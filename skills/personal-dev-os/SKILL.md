---
name: personal-dev-os
description: "Default personal software engineering workflow and standards. Use for normal software work even when the user does not mention a workflow: new features, bug fixes, refactors, architecture/design, requirement clarification, impact preview, code review, tests, comments, environment/deployment changes, maintenance, reliability work, project research, and capturing reusable engineering knowledge. Do not use for pure casual chat, simple non-software questions, or when the user explicitly says no workflow/plain answer."
---

# Personal Dev OS

Default skill for software work across IDEs. Infer the current stage; do not require the user to name stages or order.

## Source Of Truth

| Layer | Location |
| --- | --- |
| **Edit workflow/standards here** | this skill (`SKILL.md` + `references/`) + matching Obsidian vault checklists |
| **Always-on baseline (required)** | `~/Agent Engineering OS/90-Agent-Adapters/personal-dev-os.always-on.md` (symlinked into IDE rules) |
| Other IDEs skills | symlink their `skills/personal-dev-os` → this directory |
| Personal cross-project knowledge | `~/Agent Engineering OS/` (Obsidian vault; not project wiki) |
| Generated Obsidian mirror | `references/obsidian/` (refresh with `skills personal-dev-os sync`) |
| Project knowledge | current repo docs, ADRs, `CONTEXT.md`, `omx_wiki/` |
| Link map | `references/multi-ide.md` |

### Vault And Skill Stay In Sync

Human norms live in `~/Agent Engineering OS`; agent execution lives in this skill. When a rule must stay aligned, update **both** in the same change. Soft-link IDEs to this skill directory — do not copy skill text into each IDE.

Obsidian is the cross-project personal knowledge layer, not merely a project wiki. Route knowledge deliberately:

- Project facts, environment, domain terms, and this-repo decisions → repo docs / ADR / `CONTEXT.md` / `omx_wiki`.
- Cross-project principles, workflows, checklists, templates, and reusable lessons → `~/Agent Engineering OS`.
- Rules the agent must execute automatically in future sessions → Obsidian vault **and** this skill (`SKILL.md` / `references/`) in the same change.

**Skills alone are not enough.** Always-on baseline must remain installed (`ensure-adapter-links.sh`) so other workspaces still load Personal Dev OS.

## Core Loop

```text
Frame -> Inspect -> Decide -> Plan -> Execute -> Verify -> Review -> Capture -> Workflow Delta
```

Stay lightweight. Surface only: active stage, important decision, blocker, verification evidence, final delta.

## Stage Rules

### Frame
- For non-trivial feature/design/test work, run clarify-and-impact: consult knowledge bases **and 规范**, normalize into an Intent Card, then preview impact. Read `references/clarify-and-impact.md`.
- **Complex** work: after intent stabilizes, persist `omx_wiki/specs/<slug>.md` (template in Agent Engineering OS `spec-page-template.md`).
- Complex feature/design work keeps requirements and design separate, uses stable `R-*`/`A-*` IDs, and maintains traceability through implementation and verification. Read `references/requirements-and-design.md`.
- Objective, non-goals, constraints, success criteria, likely failure modes, explicit assumptions, and **适用规范**.
- For user-facing or production behavior, include measurable quality targets (latency, availability, retention, security, capacity, or cost) when relevant.
- Prefer yes/no questions with defaults; normal tasks at most 3 questions per round. Do not ask codebase/wiki/norm facts you can look up.
- Tiny local edits: keep framing internal. If user asks for direct implementation: minimum card, then proceed.
- Large/high-risk still-ambiguous work: escalate to `deep-interview` or `grill-me`, then persist Spec Page.

### Inspect
- Read code, tests, docs, config, local conventions before editing.
- Prefer search/reads/codegraph over assumptions. Use impact findings to fill the Intent Card’s 影响预览.
- New repo: check `AGENTS.md`, `CLAUDE.md`, `.codex/`, `.cursor/`, `.agents/`, `GEMINI.md`, `omx_wiki`, `CONTEXT.md`, docs first.

### Decide
- Prefer existing patterns, deletion, simplification, boundary repair before new abstractions; align with 适用规范.
- Name rejected alternatives only when a future maintainer would revisit them.
- Match verification depth to risk.

### Plan
- Vertical slices, each with a verification path.
- Tiny local edits: keep plan internal.
- Architecture, contracts, migrations, auth, billing, permissions, data retention, concurrency, external APIs: make the plan explicit. For boundary-heavy work, read `references/architecture-frame.md`.
- For production, network, streaming, or asynchronous work, include timeout, retry, cancellation, idempotency, observability, rollout, and rollback in the plan.

### Execute
- Small, scoped, reversible diffs.
- Preserve ownership boundaries and dependency direction.
- No speculative generality or unjustified new dependencies.
- Prefer existing utilities and project style; respect 适用规范.

### Verify
- No completion claim without fresh evidence or an explicit verification gap.
- Targeted tests first, then typecheck/lint/build/smoke/browser as relevant.
- Before PR/handoff, read `references/quality-gate.md` (includes 规范).
- For production-facing work, read `references/security-baseline.md`, `references/reliability-and-operations.md`, and `references/release-and-deployment.md` as applicable.

### Review
- Before findings: reload Intent/Spec Page/验收, 适用规范, project review conventions, and impact (codegraph). Read `references/review.md`.
- For non-trivial diffs/PR/pre-merge: run **Open Code Review** (`ocr review` or `open-code-review` skill; if no OCR LLM, `ocr delegate` / `open-code-review-delegate`). Pass Intent/spec as `--background`.
- Axes: spec, standards (personal + project 规范), verification, maintainability, security/privacy/performance when relevant.
- Separate “breaks Intent” / “breaks 规范” / “OCR defect”. Lead with severity-ordered findings.
- Tests prove behavior, not decoration. Remove temporary instrumentation.

### Capture
- Durable knowledge only. Route every capture decision through `references/capture.md`: project memory, ADR, Obsidian personal knowledge, skill/rule update, or `none`.
- When the user says "记住", "沉淀", "以后默认", "通用规范", or similar and the target is clear, update the appropriate files instead of only answering in chat.

### Workflow Delta
- After non-trivial work, pick one: `none` | `candidate added` | `standard promoted` | `adapter updated` | `project memory updated`.
- Method changes go through `~/Agent Engineering OS/15-Workflow-Ledger` before adapters. If promoted into automatic behavior, update the Obsidian checklist/principle and the matching skill reference together.

## Load References When Needed

| Situation | Read |
| --- | --- |
| Ambiguous feature/design/test ask; Intent Card / impact / Spec Page | `references/clarify-and-impact.md` |
| Requirements or design document; complex product/architecture change | `references/requirements-and-design.md` + `references/architecture-frame.md` when boundaries change |
| Code review / PR / pre-merge (incl. OCR) | `references/review.md` |
| Architecture / boundaries / ADR | `references/architecture.md`, `references/architecture-frame.md` |
| Object storage keys / media-file registry / CDN path / list-filter perf | `references/object-storage-and-registry.md` |
| Tests / TDD | `references/testing.md` |
| Hard bugs | `references/debugging.md` |
| Comments | `references/commenting.md` |
| Domain language | `references/domain-modeling.md` |
| Env / deploy / `.env` / Docker | `references/environment-change.md` |
| Time, timezone, scheduled jobs, date filters | `references/time-and-timezone.md` |
| SSE, WebSocket, streaming, long polling, long jobs | `references/long-running-request.md` |
| Auth, permissions, sensitive data, external/public surface | `references/security-baseline.md` |
| Production reliability, SLO, alerting, incident, degradation | `references/reliability-and-operations.md` |
| Release, migration, feature flag, rollout, rollback | `references/release-and-deployment.md` |
| "记住/沉淀/规范" | `references/capture.md` |
| Done / PR ready | `references/quality-gate.md` |
| New IDE / skill links | `references/multi-ide.md` |

Human copies of many standards also live under `~/Agent Engineering OS/20-Checklists/` and `00-Principles/`. Generated checklist mirrors live under `references/obsidian/`; refresh them with `skills personal-dev-os sync` and verify with `skills personal-dev-os check`. Prefer the operational `references/` while executing, and use the generated mirror when the detailed human checklist is relevant.

## Final Response Shape

For non-trivial software work:

- Changed/decided.
- Verification evidence.
- Capture: what was recorded, or `none`.
- Workflow delta: one of the allowed values.
- Remaining risk, if any.

Do not print the full workflow unless asked.
