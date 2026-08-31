#!/usr/bin/env bash
# Mirror Obsidian checklists into the canonical skill without overwriting
# hand-written operational references.
set -euo pipefail

VAULT="${PERSONAL_DEV_OS_VAULT:-$HOME/Agent Engineering OS}"
SKILL="${PERSONAL_DEV_OS_SKILL:-$HOME/.codex/skills/personal-dev-os}"
SOURCE_DIR="$VAULT/20-Checklists"
MIRROR_DIR="$SKILL/references/obsidian"

usage() {
  cat <<'USAGE'
Usage:
  sync-personal-dev-os.sh sync   Mirror Obsidian checklists into the skill.
  sync-personal-dev-os.sh check  Verify the mirror is current and complete.
USAGE
}

mode="${1:-}"
if [[ "$mode" != "sync" && "$mode" != "check" ]]; then
  usage >&2
  exit 2
fi

if [[ ! -d "$SOURCE_DIR" || ! -d "$SKILL" ]]; then
  echo "Missing Obsidian checklist directory or canonical skill." >&2
  exit 1
fi

hash_file() {
  shasum -a 256 "$1" | awk '{print $1}'
}

status=0
while IFS= read -r source; do
  relative="${source#"$SOURCE_DIR/"}"
  target="$MIRROR_DIR/$relative"
  digest="$(hash_file "$source")"

  if [[ "$mode" == "sync" ]]; then
    mkdir -p "$(dirname "$target")"
    temporary="$(mktemp "${target}.tmp.XXXXXX")"
    {
      printf '%s\n' '<!-- GENERATED FILE. Source of truth:'
      printf '%s\n' "     $source"
      printf '%s\n' "     SHA256: $digest -->"
      printf '\n'
      cat "$source"
    } > "$temporary"
    if [[ ! -f "$target" ]] || ! cmp -s "$temporary" "$target"; then
      mv "$temporary" "$target"
      echo "updated $target"
    else
      rm -f "$temporary"
      echo "current $target"
    fi
  else
    if [[ ! -f "$target" ]]; then
      echo "missing $target"
      status=1
    elif ! rg -q "SHA256: $digest" "$target"; then
      echo "stale $target"
      status=1
    else
      echo "current $target"
    fi
  fi
done < <(rg --files "$SOURCE_DIR" -g '*.md' | sort)

if [[ "$mode" == "check" && "$status" -ne 0 ]]; then
  echo "Obsidian mirror is out of date. Run: skills personal-dev-os sync" >&2
  exit "$status"
fi

if [[ "$mode" == "sync" ]]; then
  echo "Obsidian checklist mirror is current."
fi
