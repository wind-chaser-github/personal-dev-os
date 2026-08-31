# Agent Engineering OS

This vault is the source of truth for a portable personal software engineering workflow.

Use it across Codex, Cursor, Claude Code, opencode, and other agent-enabled IDEs. Tool-specific files should adapt this source; they should not become separate competing workflows.

## Layers

- `00-Principles`: durable engineering principles.
- `10-Workflows`: reusable execution loops.
- `20-Checklists`: quality gates and review prompts.
- `40-Decision-Records`: ADR templates and decision logs.
- `90-Agent-Adapters`: snippets for Codex, Cursor, Claude, and other tools.

New computer setup: [[90-Agent-Adapters/setup-new-computer]].

Daily entry point: [[Home]]. Engineering checklists are listed under Home's Quality Gate section; do not rely on the file explorer alone to discover newly added standards.

规范生命周期、强度和复审方式见 [[10-Workflows/workflow-evolution]] 与 [[40-Decision-Records/personal-rule-template]]。事故复盘使用 [[40-Decision-Records/incident-postmortem-template]]。

## Rule

Knowledge writes once here when it is personal and cross-project. Project-specific facts belong in the repo, project docs, ADRs, or `omx_wiki`.

This vault is not a project wiki. Promote repo knowledge here only after it becomes a reusable personal principle, workflow, checklist, template, or lesson. If a vault rule must become future automatic agent behavior, update the matching `personal-dev-os` skill reference in the same change.
