# Capture Rules

Use this when a task reveals reusable knowledge.

Human checklist SSOT: `~/Agent Engineering OS/20-Checklists/capture.md` (or `$PERSONAL_DEV_OS_VAULT`). Keep aligned when routing changes.

## Capture Targets

- Repo facts: architecture, commands, setup, deployment, test strategy, domain rules.
- Decisions: chosen approach, rejected alternatives, constraints, risks, validation.
- Failure modes: symptoms, root cause, reproduction, fix, regression test.
- Personal rules: cross-project engineering heuristics, quality standards, workflow improvements.
- Workflow deltas: changes to how future work should be framed, planned, executed, verified, reviewed, or captured.

## Where To Put It

- Repo docs or `omx_wiki`: project-specific facts the agent should remember next time.
- ADR files: long-lived architectural decisions that affect collaborators.
- `~/Agent Engineering OS` (or `$PERSONAL_DEV_OS_VAULT`): Obsidian vault for personal cross-project principles, workflows, checklists, templates, and reusable lessons.
- `~/Agent Engineering OS/15-Workflow-Ledger`: workflow observations, candidates, trials, standards, and adapter promotions.
- Skill updates: repeated procedural rules that agents should execute automatically.

## User Phrases And Required Action

When the user says "记住", "沉淀", "积累", "以后都", "规范", "项目环境信息", "记录一下", or similar, treat it as a capture request. First classify the target layer, then update files unless the request is ambiguous or unsafe. Do not collapse Obsidian into project wiki: it is the personal cross-project knowledge layer.

Routing:

- "通用规范", "我的规范", "以后所有项目", "架构原则", "代码质量标准": update `~/Agent Engineering OS`.
- "这个项目", "本项目", "这个 repo", "环境信息", "启动方式", "部署方式", "测试命令": update current repo docs or `omx_wiki`. Environment facts must be scoped by repo/subproject/service/environment profile; never write them as global personal rules.
- "ADR", "架构决策", "为什么选 A 不选 B": update repo ADR and optionally summarize in Obsidian.
- "以后自动", "默认规则", "每次都要": update Obsidian checklist/principle **and** this skill (`SKILL.md` / `references/`) in the same change. Soft-linked IDEs pick up the skill; do not paste copies into each IDE.
- "工作流", "流程", "范式", "积累我的工作流", "这套没用", "太复杂": update the Workflow Ledger first. Do not add another command burden to the user; simplify the operating rule.

If editing Codex skill files, run the skill validator afterward when one is provided by the skill/runtime. Personal Dev OS currently has no dedicated validator, so perform the structural checks available locally instead: referenced files exist, Markdown is readable, required sections are present, and symlinks still resolve.

Operational manual: `~/Agent Engineering OS/Daily-Use-Manual.md`.
Workflow ledger: `~/Agent Engineering OS/15-Workflow-Ledger`.

Project environment files should prefer `omx_wiki/environments/<scope>.md` when no existing repo source of truth exists. Examples: `backend-local.md`, `web-local.md`, `admin-local.md`, `docker-local.md`, `staging.md`, `production.md`, `ci-github-actions.md`.

## Capture Template

```markdown
# Title

## Context

## Decision / Lesson

## Rejected Alternatives

## Validation

## Follow-up
```

## Filter

Do not capture transient details, one-off command output, guesses, or knowledge already obvious from the code.

## End-Of-Task Check

For non-trivial software work, explicitly report one of:

- `Capture: none` when nothing durable emerged.
- `Capture: project memory updated` with the repo path.
- `Capture: Obsidian updated` with the vault path.
- `Capture: Obsidian + skill updated` when future automatic behavior changed.
