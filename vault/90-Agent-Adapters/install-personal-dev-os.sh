#!/usr/bin/env bash
# Install the portable Personal Dev OS wiring on a new computer.
set -euo pipefail

VAULT="${PERSONAL_DEV_OS_VAULT:-$HOME/Agent Engineering OS}"
SKILL="${PERSONAL_DEV_OS_SKILL:-$HOME/.codex/skills/personal-dev-os}"
SKILL_SOURCE="${PERSONAL_DEV_OS_SKILL_SOURCE:-}"

usage() {
  cat <<'USAGE'
Usage:
  install-personal-dev-os.sh [--skill-source /path/to/personal-dev-os]

Environment overrides:
  PERSONAL_DEV_OS_VAULT  Obsidian vault path (default: ~/Agent Engineering OS)
  PERSONAL_DEV_OS_SKILL  Installed skill path (default: ~/.codex/skills/personal-dev-os)
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --skill-source)
      SKILL_SOURCE="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ ! -d "$VAULT/90-Agent-Adapters" ]]; then
  echo "Missing adapter directory in Obsidian vault: $VAULT" >&2
  exit 1
fi

if [[ -z "$SKILL_SOURCE" ]]; then
  if [[ -d "$SKILL" ]]; then
    SKILL_SOURCE="$SKILL"
  else
    echo "Provide --skill-source or PERSONAL_DEV_OS_SKILL_SOURCE." >&2
    exit 1
  fi
fi

if [[ ! -d "$SKILL_SOURCE" || ! -f "$SKILL_SOURCE/SKILL.md" ]]; then
  echo "Invalid skill source: $SKILL_SOURCE" >&2
  exit 1
fi

mkdir -p "$(dirname "$SKILL")" "$HOME/bin"
ln -sfn "$SKILL_SOURCE" "$SKILL"
ln -sfn "$VAULT/90-Agent-Adapters/skills" "$HOME/bin/skills"

PERSONAL_DEV_OS_VAULT="$VAULT" PERSONAL_DEV_OS_SKILL="$SKILL" \
  "$VAULT/90-Agent-Adapters/ensure-adapter-links.sh"
PERSONAL_DEV_OS_VAULT="$VAULT" PERSONAL_DEV_OS_SKILL="$SKILL" \
  "$VAULT/90-Agent-Adapters/sync-personal-dev-os.sh" sync

echo "Personal Dev OS installed. Run: skills personal-dev-os check"
