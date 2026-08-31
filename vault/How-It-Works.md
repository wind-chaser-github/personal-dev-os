# How It Works

This system has three layers:

1. Execution layer: Codex, Cursor, Claude, opencode, OMX.
2. Project memory layer: repo docs, ADRs, `omx_wiki`.
3. Personal knowledge layer: this Obsidian vault.

## Default Work Loop

For normal software work, the agent should automatically run:

```text
Frame -> Inspect -> Decide -> Plan -> Execute -> Verify -> Review -> Capture -> Workflow Delta
```

The user should not need to remember this sequence. The agent infers the current stage from the request and fills missing stages only when useful.

Wiring has two layers: an always-on adapter tells each IDE to load the workflow, and the `personal-dev-os` skill holds the detailed behavior. Skills alone are not enough in every workspace.

## What Happens During A Task

### 1. Frame

Clarify the outcome, non-goals, constraints, risks, and success criteria.

For non-trivial feature/design/test work, produce an **Intent Card**: consult knowledge bases **and 规范**, normalize wording, list ADDED/MODIFIED/REMOVED behavior, assumptions, applicable norms, and impact preview. Prefer yes/no with defaults (max 3 per round).

**Complex** work: persist Spec Page at `omx_wiki/specs/<slug>.md` ([[40-Decision-Records/spec-page-template]]), use [[20-Checklists/requirements-and-design]] to separate requirements from design and trace `R-*` → `A-*` → implementation → verification; escalate with `deep-interview` / `grill-me` when still ambiguous.

Details: skill `references/clarify-and-impact.md`; Intent template [[40-Decision-Records/intent-card-template]].

Code review: reload Intent/Spec + 适用规范 + impact; non-trivial diffs use **Open Code Review** (`ocr`). See skill `references/review.md`, [[90-Agent-Adapters/open-code-review]], [[20-Checklists/code-review-checklist]].

Use when the request is broad, risky, architectural, product-facing, or ambiguous.

### 2. Inspect

Read existing code, tests, docs, project rules, and conventions before changing anything.

Use for almost every code task.

### 3. Decide

Choose the implementation or architecture approach. Record meaningful rejected alternatives.

Use when there are multiple valid approaches or long-lived tradeoffs.

### 4. Plan

Split work into vertical slices with a verification path for each slice.

Use when more than a trivial one-file change is needed.

### 5. Execute

Make small scoped changes using existing project patterns.

Use after enough context exists to avoid guessing.

### 6. Verify

Run targeted tests first, then typecheck, lint, build, smoke, or e2e checks when relevant.

Use before claiming completion.

### 7. Review

Check regressions, boundaries, complexity, security, performance, naming, and maintainability.

Before findings: reload Intent/Spec Page/验收, **适用规范**, and impact. For non-trivial diffs/PR use Open Code Review (`ocr` or delegate). Separate “breaks Intent” / “breaks 规范” / “OCR defect”. See skill `references/review.md`, [[90-Agent-Adapters/open-code-review]], [[20-Checklists/code-review-checklist]].

Use before PR handoff or when quality matters.

### 8. Capture

Store only durable learning.

Use when the task reveals a recurring rule, project fact, failure mode, or architecture decision.

### 9. Workflow Delta

Decide whether the personal working method should change.

Values: `none`, `candidate added`, `standard promoted`, `adapter updated`, or `project memory updated`.

Use after non-trivial work. Route method changes through [[15-Workflow-Ledger/README]] before promoting adapters. See [[10-Workflows/workflow-evolution]].

## Where Knowledge Goes

### Put In `omx_wiki` Or Repo Docs

Use for project-specific memory:

- Architecture of this repo.
- How to run tests/build/deploy in this repo.
- Domain terms for this product.
- Known project failure modes.
- Debugging notes specific to this codebase.
- Decisions collaborators should see.

### Put In ADRs

Use for long-lived project decisions:

- Chosen architecture.
- Rejected alternatives.
- Migration decisions.
- Data model/API boundary decisions.
- Risk and rollback notes.

### Put In This Obsidian Vault

Use for personal cross-project knowledge:

- Your engineering principles.
- Architecture patterns you reuse.
- Quality gates and review checklists.
- Product development workflows.
- Lessons that should apply across many repos and IDEs.

This vault is not the project wiki. Write here when the lesson should outlive one repo or shape future work across IDEs.

### Put In Skills / Rules / Commands

Use for repeatable behavior:

- Things the agent should do automatically.
- Workflows that should run the same way every time.
- Checklists that should become defaults.
- Scripts for repeated mechanical steps.

## Practical Usage

You can speak normally:

```text
帮我实现这个功能
修这个 bug
review 这个 PR
这个架构方案怎么样
把这次经验沉淀一下
```

The agent should decide the workflow stage and use the right layer.

## Capture Decision Table

| Learning | Destination |
| --- | --- |
| This repo uses command X to run tests | `omx_wiki` or repo docs |
| This product has domain rule Y | `omx_wiki` or repo docs |
| We chose architecture A over B | ADR plus optional Obsidian summary |
| I prefer quality rule Z across projects | Obsidian |
| This checklist should run every task | Obsidian plus skill/rule adapter |
| This command is repeated often | script or command |

## Weekly Maintenance Loop

Review recent notes and promote them:

1. Project note still useful only for this repo: keep in `omx_wiki` or repo docs.
2. Project note became a general principle: summarize into Obsidian.
3. Obsidian principle should affect agent behavior: convert into a skill/rule.
4. Repeated manual operation: convert into a script or command.

## Current Installed Adapters

Two-layer wiring. See [[90-Agent-Adapters/README]].

- Canonical: `~/.codex/skills/personal-dev-os`
- Always-on baseline: `90-Agent-Adapters/personal-dev-os.always-on.md`
- Soft links: Cursor / Claude / Gemini / `~/.agent` / opencode `skills/personal-dev-os`
- Optional repair: `90-Agent-Adapters/ensure-adapter-links.sh`
