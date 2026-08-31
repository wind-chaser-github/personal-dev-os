# Agent Adapters

Two layers — **skills alone are not enough**.

| Layer | Canonical path | Role |
| --- | --- | --- |
| Always-on baseline | `personal-dev-os.always-on.md` | Loaded every chat; forces reading the skill |
| Skill (depth) | `~/.codex/skills/personal-dev-os/` | Full loop + `references/` |

```text
personal-dev-os.always-on.md
        ↑ symlink
        ├── ~/.cursor/rules/personal-dev-os.mdc
        ├── ~/.claude/rules/personal-dev-os.md
        └── ~/.gemini/AGENTS.md

~/.codex/skills/personal-dev-os/     ← edit deep workflow here
        ↑ symlink
        ├── ~/.cursor/skills/personal-dev-os
        ├── ~/.claude/skills/personal-dev-os
        ├── ~/.gemini/skills/personal-dev-os
        ├── ~/.agent/skills/personal-dev-os
        └── ~/.config/opencode/skills/personal-dev-os
```

Codex / opencode also get a short pointer block in `AGENTS.md`.

Repair all links:

```bash
"$HOME/Agent Engineering OS/90-Agent-Adapters/ensure-adapter-links.sh"
```

Sync Obsidian checklists into the canonical skill mirror:

```bash
skills personal-dev-os sync
skills personal-dev-os check
```

On a new computer, install the Obsidian vault and a copy or checkout of the canonical skill, then run:

```bash
"$HOME/Agent Engineering OS/90-Agent-Adapters/install-personal-dev-os.sh" \
  --skill-source /path/to/personal-dev-os
```

`PERSONAL_DEV_OS_VAULT` defaults to `~/Agent Engineering OS`. `omx` is optional for this workflow: install it only when using OMX orchestration, `omx setup`, or OMX runtime commands. Codex, Cursor, Claude Code, Gemini/Antigravity, and opencode each remain optional frontends.

Obsidian remains the source of truth for human checklists. The sync command only updates generated files under `personal-dev-os/references/obsidian/`; it does not overwrite hand-written operational references.

## Per IDE

| IDE / Tool | Doc |
| --- | --- |
| Codex | [[codex]] |
| Cursor | [[cursor]] |
| Claude Code | [[claude]] |
| Antigravity / Gemini | [[antigravity]] |
| Open Code Review | [[open-code-review]] |
| opencode | skills + `AGENTS.md` pointer |

## Edit Where

| Change | Edit |
| --- | --- |
| Deep workflow / standards | skill + matching vault checklists |
| Always-on nudge | `personal-dev-os.always-on.md` only |
