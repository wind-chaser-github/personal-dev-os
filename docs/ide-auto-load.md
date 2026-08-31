# IDE Auto-Load Wiring

Personal Dev OS uses two layers so each IDE loads the workflow without the user naming it every time.

## Layer 1: Global Always-On Rules

Run the installer once on each machine:

```bash
export PERSONAL_DEV_OS_VAULT="$PWD/vault"
"$PERSONAL_DEV_OS_VAULT/90-Agent-Adapters/install-personal-dev-os.sh" \
  --skill-source "$PWD/skills/personal-dev-os"
```

The installer wires these global entry points:

| Tool | Auto-load entry |
| --- | --- |
| Codex | `~/.codex/AGENTS.md` marked Personal Dev OS pointer block |
| Cursor | `~/.cursor/rules/personal-dev-os.mdc` symlink |
| Claude Code | `~/.claude/rules/personal-dev-os.md` symlink |
| Gemini / Antigravity | `~/.gemini/AGENTS.md` symlink |
| opencode | `~/.config/opencode/AGENTS.md` marked Personal Dev OS pointer block |

Those entries point at the canonical skill installed at `~/.codex/skills/personal-dev-os`.

## Layer 2: Project-Level Bridge Files

Repositories that should always use Personal Dev OS should include short bridge files:

| Tool | Project file |
| --- | --- |
| Codex / opencode | `AGENTS.md` |
| Claude Code | `CLAUDE.md` |
| Gemini / Antigravity | `GEMINI.md` |
| Cursor | `.cursor/rules/personal-dev-os.mdc` |

This repository includes those bridge files. They deliberately stay short and point to `skills/personal-dev-os/SKILL.md`; they are not copies of the full workflow.

## Repair

If an IDE stops loading the workflow, repair links:

```bash
"$PERSONAL_DEV_OS_VAULT/90-Agent-Adapters/ensure-adapter-links.sh"
skills personal-dev-os check
```

## Edit Rule

- Deep workflow changes: edit `vault/` and `skills/personal-dev-os/`.
- Auto-load wording only: edit `vault/90-Agent-Adapters/personal-dev-os.always-on.md` and rerun the installer/link repair.
- Project-specific bridge wording: edit the root bridge file for that project.
