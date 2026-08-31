# Wiring: Skill + Always-On Baseline

Skills alone are **not** enough. Evidence: feature work in another workspace skipped Intent Card, norms, and required comments when only skill symlinks existed.

## Layers

1. **Always-on baseline** (must load every chat): `personal-dev-os.always-on.md`  
   - Cursor: `~/.cursor/rules/personal-dev-os.mdc` → symlink  
   - Claude: `~/.claude/rules/personal-dev-os.md` → symlink  
   - Antigravity/Gemini: `~/.gemini/AGENTS.md` → symlink (if file is Dev-OS-only)  
   - Codex: `developer_instructions` + optional AGENTS pointer (already has baseline)  
   - opencode: short pointer block in `AGENTS.md`

2. **Skill (depth)**: `~/.codex/skills/personal-dev-os` soft-linked into each IDE `skills/`

3. **Human norms**: `~/Agent Engineering OS` (or `$PERSONAL_DEV_OS_VAULT`)

## Edit

| Change | Edit |
| --- | --- |
| Deep workflow / standards | skill `SKILL.md` + `references/` **and** matching vault checklists |
| Always-on nudge text | `personal-dev-os.always-on.md` only (symlinked) |

Repair: `ensure-adapter-links.sh`
