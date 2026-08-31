# Setup On A New Computer

Personal Dev OS has three independent pieces:

1. **Frontend**: at least one of Codex, Cursor, Claude Code, Gemini/Antigravity, or opencode.
2. **Personal knowledge**: the Obsidian app is optional at runtime, but the vault directory must be available for the checklists and templates.
3. **Execution skill**: a copy or checkout of the `personal-dev-os` skill installed at `~/.codex/skills/personal-dev-os`.

`omx` is optional. It adds OMX orchestration, setup, team, ralph, wiki, and related runtime commands; it is not required for the base Personal Dev OS loop.

## Install

1. Install and sign in to the chosen coding frontend.
2. Clone this repository and choose where the vault should live:

   ```bash
   git clone git@github.com:wind-chaser-github/personal-dev-os.git
   cd personal-dev-os
   export PERSONAL_DEV_OS_VAULT="$PWD/vault"
   ```

   Alternatively, copy or sync `vault/` to `~/Agent Engineering OS`, or set:

   ```bash
   export PERSONAL_DEV_OS_VAULT="/path/to/Agent Engineering OS"
   ```

3. Use the canonical skill package from the checkout:
4. Run the installer:

   ```bash
   "$PERSONAL_DEV_OS_VAULT/90-Agent-Adapters/install-personal-dev-os.sh" \
     --skill-source "$PWD/skills/personal-dev-os"
   ```

5. Verify the installation:

   ```bash
   omx doctor                 # only when omx is installed
   skills personal-dev-os check
   ```

## Auto-Load Wiring

The installer writes or repairs global always-on entries so IDEs load Personal Dev OS without the user naming the skill:

| Tool | Global entry |
| --- | --- |
| Codex | `~/.codex/AGENTS.md` marked pointer block |
| Cursor | `~/.cursor/rules/personal-dev-os.mdc` symlink |
| Claude Code | `~/.claude/rules/personal-dev-os.md` symlink |
| Gemini / Antigravity | `~/.gemini/AGENTS.md` symlink |
| opencode | `~/.config/opencode/AGENTS.md` marked pointer block |

Repos that should force this workflow should also include project-level bridge files:

| Tool | Project file |
| --- | --- |
| Codex / opencode | `AGENTS.md` |
| Claude Code | `CLAUDE.md` |
| Gemini / Antigravity | `GEMINI.md` |
| Cursor | `.cursor/rules/personal-dev-os.mdc` |

This repository includes those project bridge files. For other projects, copy their short shape and point them at the installed skill or a repo-local skill checkout.

## Update

Edit shared personal norms in Obsidian, then run:

```bash
skills personal-dev-os sync
skills personal-dev-os check
```

If the skill checkout changes, rerun the installer or repair links:

```bash
"$PERSONAL_DEV_OS_VAULT/90-Agent-Adapters/ensure-adapter-links.sh"
```

## Scope

- Obsidian vault: personal cross-project principles, checklists, templates, and reusable lessons.
- Personal Dev OS skill: agent execution rules and generated Obsidian checklist mirrors.
- Project repository: project facts, environment, domain terms, ADRs, and `omx_wiki`.

Do not put project-specific environment values into this global setup.
