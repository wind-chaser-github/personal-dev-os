# Workflow Candidates

Use this file for workflow improvements that are not yet default rules.

## Template

```markdown
## Candidate: Title

Status: observation | candidate | trial | standard | adapter
Source task:
Problem:
Proposed rule:
When to use:
When not to use:
Trial evidence:
Decision:
```

## Active Candidates

## Candidate: Intent Card Clarify-And-Impact Gate

Status: standard
Source task: user asked to reduce AI misreading of spoken requirements and to preview product/code impact before coding
Problem: Frame only allowed minimal questioning; agents silently assumed meaning and started coding without naming modules/files/feature blast radius.
Proposed rule: For non-trivial feature/design/test work, normalize into an Intent Card; complex work persists `omx_wiki/specs/<slug>.md`; Review uses OCR when non-trivial; vault checklists stay synced with skill references.
When to use: Ambiguous or product-facing feature, design, and test-scenario work; complex changes needing a durable spec page.
When not to use: Tiny local edits, pure factual questions, or when the user explicitly skips clarifying (then emit minimum card and proceed).
Trial evidence: Landed clarify-and-impact, intent/spec templates, OCR install+skill links, review.md OCR wiring; vault checklists synced 2026-08-03.
Decision: **Promoted** to `standards.md` (Intent Card Clarify-And-Impact, Review With Intent And OCR, Vault And Skill Stay In Sync). Human copies: `20-Checklists/clarify-and-impact.md`, updated `code-review-checklist.md`.

## Candidate: Reduce User Workflow Burden

Status: trial
Source task: setting up personal Codex/Obsidian/OMX workflow accumulation
Problem: The workflow became too complex because it required the user to remember categories, phrases, destinations, and manual capture steps.
Proposed rule: The agent owns workflow capture. The user should be able to work normally; at the end of non-trivial tasks, the agent reports a short workflow delta and updates the Workflow Ledger when useful.
When to use: Any non-trivial software architecture, product development, implementation, maintenance, debugging, or review task.
When not to use: Tiny factual answers, pure casual chat, or one-off commands with no reusable learning.
Trial evidence: Current conversation exposed that destination-focused documentation did not help the user accumulate working methods.
Decision: Keep in trial. If useful across several tasks, promote to `standards.md` and adapter rules.

## Candidate: Design Important Interfaces Twice

Status: candidate
Source task: review of `mattpocock/skills` engineering principles
Problem: First interface designs often hide shallow modules, awkward seams, or testability problems.
Proposed rule: For high-impact interfaces, produce at least two materially different designs and compare depth, locality, seam placement, caller ergonomics, and testability before implementing.
When to use: New module boundaries, cross-service seams, persistence APIs, authorization boundaries, workflow engines, or abstractions expected to last.
When not to use: Small local changes, simple bug fixes, or obvious repo-pattern extensions.
Trial evidence:
Decision: Keep as candidate; promote after it improves real design work without adding too much overhead.

## Candidate: Environment Changes Must Update Project Environment Memory

Status: trial
Source task: uncommitted Docker/env changes for local mixed FastGPT/MinIO/mock-OA setup were made without the workflow being applied.
Problem: Environment and deployment changes are easy to treat as incidental config edits, so project memory, verification gaps, and future run instructions get skipped.
Proposed rule: Any change to Docker, compose, env examples, deployment scripts, ports, profiles, or service dependencies must update repo environment memory and run the smallest safe validation before completion.
When to use: Docker Compose changes, `.env` or example env changes, deployment scripts, local/remote integration profiles, port binding changes, service dependency changes.
When not to use: Pure code changes that do not affect runtime environment or developer operations.
Trial evidence: Current `deploy.env.example`, `docker-compose.yml`, and partner env script diff changed runtime assumptions without triggering environment docs or validation.
Decision: Added `environment-change.md` gate to Codex skill and created current repo `omx_wiki/environments/docker-local.md`; keep as trial and promote if useful.

## Candidate: Project-Level Workflow Bridge Required

Status: trial
Source task: omnilearning/taowhale-server research/modification did not use the personal workflow or standards.
Problem: Global Codex skills and Obsidian rules do not reliably apply in other repositories, threads, or IDE sessions when the project has its own `AGENTS.md` / `CLAUDE.md` and no bridge to the personal workflow.
Proposed rule: Any active project that should use the personal workflow must have a short project-level bridge in `AGENTS.md` and equivalent IDE instruction files, pointing to `~/Agent Engineering OS` and requiring verification evidence plus workflow delta for non-trivial work.
When to use: Onboarding a repo, switching projects, or noticing that personal standards were not applied.
When not to use: Temporary one-off repos where no ongoing workflow accumulation is desired.
Trial evidence: Added bridge sections to `~/code/omnilearning/taowhale-server/AGENTS.md` and `CLAUDE.md`.
Decision: Keep in trial. If this prevents misses in more projects, promote to standard and create a bootstrap script.

## Candidate: Mandatory Global Baseline Beats Skill Triggering

Status: standard
Source task: user developed a new feature in another workspace; workflow/norms/comments were skipped
Problem: Skill metadata is advisory. Other workspaces/sessions often never load `personal-dev-os`, so Intent Card, 规范, verification, and required intent/constraint comments are omitted.
Proposed rule: Always-on baseline in each IDE (Cursor/Claude rules, Gemini AGENTS, Codex AGENTS/developer_instructions) must require reading the skill; skills hold depth. Soft-link `personal-dev-os.always-on.md`.
When to use: Any recurring workflow that must apply to all non-trivial software work.
When not to use: Optional specialist workflows that should only run when explicitly requested.
Trial evidence: Cursor had skill symlink only (no alwaysApply rule) after earlier "skills-only" simplification; feature work in another workspace did not comply. Restored always-on baseline 2026-08-03.
Decision: **Promoted** to `standards.md`. Re-installed always-on symlinks via `ensure-adapter-links.sh`.
