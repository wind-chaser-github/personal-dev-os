# Requirements And Design

Use with [[40-Decision-Records/spec-page-template]] for complex feature, product, architecture, migration, or design work. Agent operational copy: `personal-dev-os/references/requirements-and-design.md`.

## Requirements

- [ ] Problem, actor/caller, trigger, desired outcome, and non-goals are explicit.
- [ ] User-visible or caller-visible requirements have stable `R-*` IDs.
- [ ] Main flow and relevant empty, invalid, duplicate, timeout, permission, partial-failure, and recovery scenarios are covered.
- [ ] Each must-have requirement maps to an observable `A-*` acceptance condition.
- [ ] Important quality attributes have measurable `NFR-*` targets, such as latency, availability, retention, security, capacity, or cost.
- [ ] Terms use the project canonical vocabulary; unresolved semantics are recorded as assumptions or open questions.

## Design

- [ ] Requirements and implementation decisions are in separate sections.
- [ ] Ownership boundary, data flow, domain states/invariants, and contracts are explicit.
- [ ] Permissions, privacy, retention, compatibility, migration, rollback, rollout, observability, performance, capacity, and cost are addressed when relevant, or marked `N/A`.
- [ ] Rejected alternatives are recorded only when a future maintainer may reasonably revisit them.

## Traceability and lifecycle

- [ ] Requirement → acceptance → implementation slice → verification evidence can be followed.
- [ ] Scope changes update requirements, acceptance, design, and change log together.
- [ ] Spec status is accurate; `done` means verification and traceability are complete.
- [ ] Expensive-to-reverse or cross-boundary decisions have an ADR.

## Follow-up rule

After implementation, record what changed from the spec, which assumptions were invalidated, and whether the lesson belongs in project memory, an ADR, or the personal Obsidian vault.
