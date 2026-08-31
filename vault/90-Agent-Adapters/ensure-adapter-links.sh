#!/usr/bin/env bash
# Repair skill symlinks + always-on baseline links.
# Deep edits: ~/.codex/skills/personal-dev-os/ (+ matching vault checklists)
# Always-on edits: 90-Agent-Adapters/personal-dev-os.always-on.md
set -euo pipefail

VAULT="${PERSONAL_DEV_OS_VAULT:-$HOME/Agent Engineering OS}"
SKILL="${PERSONAL_DEV_OS_SKILL:-$HOME/.codex/skills/personal-dev-os}"
ALWAYS_ON="$VAULT/90-Agent-Adapters/personal-dev-os.always-on.md"
POINTER="For non-trivial software work, read and follow \`$SKILL/SKILL.md\` (Personal Dev OS). Load references as needed. Do not skip Intent framing, verification, or required intent/constraint comments."

if [[ ! -d "$SKILL" ]]; then
  echo "Missing canonical skill: $SKILL" >&2
  exit 1
fi
if [[ ! -f "$ALWAYS_ON" ]]; then
  echo "Missing always-on file: $ALWAYS_ON" >&2
  exit 1
fi

SYNC="$VAULT/90-Agent-Adapters/sync-personal-dev-os.sh"
if [[ ! -x "$SYNC" ]]; then
  echo "Missing executable sync helper: $SYNC" >&2
  exit 1
fi

ensure_symlink() {
  local link="$1" target="$2"
  mkdir -p "$(dirname "$link")"
  ln -sfn "$target" "$link"
  echo "link $link -> $target"
}

replace_marked() {
  local path="$1" start="$2" end="$3" inner="$4"
  python3 -c '
from pathlib import Path
import sys
path = Path(sys.argv[1])
start, end, inner = sys.argv[2], sys.argv[3], sys.argv[4]
text = path.read_text() if path.exists() else ""
block = start + "\n" + inner + "\n" + end
if start in text and end in text:
    pre = text.split(start, 1)[0]
    post = text.split(end, 1)[1]
    path.write_text(pre + block + post)
else:
    sep = "\n\n" if text and not text.endswith("\n\n") else ("\n" if text and not text.endswith("\n") else "")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text + sep + block + "\n")
print("pointer", path)
' "$path" "$start" "$end" "$inner"
}

for link in \
  "$HOME/.cursor/skills/personal-dev-os" \
  "$HOME/.claude/skills/personal-dev-os" \
  "$HOME/.gemini/skills/personal-dev-os" \
  "$HOME/.agent/skills/personal-dev-os" \
  "$HOME/.config/opencode/skills/personal-dev-os"
do
  ensure_symlink "$link" "$SKILL"
done

# Always-on baseline (skills alone are insufficient)
ensure_symlink "$HOME/.cursor/rules/personal-dev-os.mdc" "$ALWAYS_ON"
ensure_symlink "$HOME/.claude/rules/personal-dev-os.md" "$ALWAYS_ON"
ensure_symlink "$HOME/.gemini/AGENTS.md" "$ALWAYS_ON"

replace_marked "$HOME/.codex/AGENTS.md" \
  "<!-- PERSONAL-DEV-OS:START -->" \
  "<!-- PERSONAL-DEV-OS:END -->" \
  "$POINTER"
replace_marked "$HOME/.config/opencode/AGENTS.md" \
  "<!-- personal-dev-os:start -->" \
  "<!-- personal-dev-os:end -->" \
  "$POINTER"

# Open Code Review skills
OCR_PLUGIN="$HOME/.local/share/open-code-review/plugins/open-code-review"
if [[ -d "$OCR_PLUGIN/skills/open-code-review" ]]; then
  for root in \
    "$HOME/.cursor/skills" \
    "$HOME/.codex/skills" \
    "$HOME/.claude/skills" \
    "$HOME/.gemini/skills" \
    "$HOME/.agent/skills" \
    "$HOME/.config/opencode/skills"
  do
    mkdir -p "$root"
    ln -sfn "$OCR_PLUGIN/skills/open-code-review" "$root/open-code-review"
    ln -sfn "$OCR_PLUGIN/skills/open-code-review-delegate" "$root/open-code-review-delegate"
  done
  echo "OCR skills linked"
fi

echo "OK: skills + always-on baseline repaired."
