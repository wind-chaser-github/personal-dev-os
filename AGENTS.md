# Personal Dev OS Repository Instructions

This repository packages the Personal Dev OS Obsidian vault, Codex skill, IDE adapter rules, and setup scripts.

<!-- PERSONAL-DEV-OS:START -->
For non-trivial software work in this repository, read and follow `skills/personal-dev-os/SKILL.md` (Personal Dev OS). Load references as needed. Do not skip Intent framing, verification, or required intent/constraint comments.
<!-- PERSONAL-DEV-OS:END -->

## Repository Source Of Truth

- Human knowledge source: `vault/`
- Executable agent skill: `skills/personal-dev-os/`
- IDE auto-load wiring: `vault/90-Agent-Adapters/`
- Installation entry point: `vault/90-Agent-Adapters/install-personal-dev-os.sh`

When changing a workflow rule that should become automatic agent behavior, update the matching vault checklist/principle and the skill reference in the same change.

Do not commit local runtime state, temporary files, secrets, or machine-specific workspace state.
