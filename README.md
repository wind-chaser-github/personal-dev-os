# Personal Dev OS

Personal Dev OS is a portable personal engineering operating system for AI-assisted software work. It keeps three layers together:

- `vault/`: the Obsidian knowledge base, including principles, workflows, checklists, templates, adapter notes, and the new-computer setup guide.
- `skills/personal-dev-os/`: the Codex skill package that agents execute from.
- `vault/90-Agent-Adapters/`: adapter prompts and scripts for Codex, Cursor, Claude Code, Gemini/Antigravity, opencode, Open Code Review, and optional OMX usage.
- `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.cursor/rules/personal-dev-os.mdc`: project-level bridge files that make IDEs load the workflow automatically inside this repository.

The Obsidian vault is the human source of truth. The skill is the executable agent surface. When a workflow rule should become automatic agent behavior, update both the vault checklist/principle and the matching skill reference.

## New Computer Setup

Clone this repository, then either keep the vault in place or copy it to `~/Agent Engineering OS`.

```bash
git clone git@github.com:wind-chaser-github/personal-dev-os.git
cd personal-dev-os
export PERSONAL_DEV_OS_VAULT="$PWD/vault"

"$PERSONAL_DEV_OS_VAULT/90-Agent-Adapters/install-personal-dev-os.sh" \
  --skill-source "$PWD/skills/personal-dev-os"
```

Verify:

```bash
skills personal-dev-os check
omx doctor  # optional, only when omx is installed
```

The detailed setup guide lives at [vault/90-Agent-Adapters/setup-new-computer.md](vault/90-Agent-Adapters/setup-new-computer.md).

IDE auto-load details live at [docs/ide-auto-load.md](docs/ide-auto-load.md). The short version: run the installer once for global rules, and add project-level bridge files (`AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, Cursor rule) to repos that should always use Personal Dev OS.

## Daily Use

Start from [vault/Home.md](vault/Home.md) or [vault/Daily-Use-Manual.md](vault/Daily-Use-Manual.md).

Useful commands:

```bash
skills personal-dev-os check
skills personal-dev-os sync
"$PERSONAL_DEV_OS_VAULT/90-Agent-Adapters/ensure-adapter-links.sh"
```

## Repository Map

- [vault/00-Principles](vault/00-Principles): durable engineering principles.
- [vault/10-Workflows](vault/10-Workflows): reusable execution loops and workflow evolution rules.
- [vault/15-Workflow-Ledger](vault/15-Workflow-Ledger): candidate and promoted workflow changes.
- [vault/20-Checklists](vault/20-Checklists): quality gates, review prompts, testing, security, release, and reliability checklists.
- [vault/30-Patterns](vault/30-Patterns): reusable domain and architecture patterns.
- [vault/40-Decision-Records](vault/40-Decision-Records): templates for ADRs, intent cards, incidents, specs, and personal rules.
- [vault/90-Agent-Adapters](vault/90-Agent-Adapters): adapter prompts, always-on baseline, installation, link repair, and sync scripts.
- [skills/personal-dev-os](skills/personal-dev-os): Codex skill package and operational references.
- [docs/ide-auto-load.md](docs/ide-auto-load.md): exact auto-load wiring for Codex, Cursor, Claude Code, Gemini/Antigravity, and opencode.

## Maintenance Rule

Personal cross-project knowledge belongs in `vault/`. Project-specific facts belong in the relevant project repository, ADRs, `CONTEXT.md`, or `omx_wiki/`.

After editing checklists in `vault/20-Checklists`, refresh the skill mirror:

```bash
export PERSONAL_DEV_OS_VAULT="$PWD/vault"
export PERSONAL_DEV_OS_SKILL="$PWD/skills/personal-dev-os"
vault/90-Agent-Adapters/sync-personal-dev-os.sh sync
vault/90-Agent-Adapters/sync-personal-dev-os.sh check
```
