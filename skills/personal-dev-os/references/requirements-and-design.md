# Requirements And Design Documents

Use for complex feature, product, architecture, migration, or design work. Human template: `~/Agent Engineering OS/40-Decision-Records/spec-page-template.md`; human checklist: `~/Agent Engineering OS/20-Checklists/requirements-and-design.md`.

## Separation

- Requirements answer **what should happen and why** from the user/caller/product perspective.
- Design answers **where ownership lives and how it works**: boundaries, data flow, contracts, state, failure handling, and operations.
- A single Spec Page may contain both, but keep the sections separate. Do not turn implementation choices into requirements.

## Required for complex work

1. Give each must-have requirement a stable `R-*` ID.
2. Describe the main scenario and relevant exception/boundary scenarios.
3. Give each must-have requirement at least one observable `A-*` acceptance condition.
4. Describe permissions, data lifecycle, compatibility, and non-goals when relevant; mark `N/A` explicitly when not relevant.
5. Record design ownership, data flow, domain states/invariants, contracts, failure/retry/idempotency, security/privacy, observability, capacity/cost, rollout, and rollback when relevant.
6. Maintain a trace from requirement to implementation slice to test or other verification evidence.

## Change discipline

- When scope changes, update the requirement table, acceptance table, affected design section, and change log together.
- A design decision that is expensive to reverse or changes persistence, auth, privacy, billing, or external contracts also gets an ADR.
- Before implementation, unresolved product semantics stay under `待决问题`; before completion, accepted requirements and verification evidence are current.
- At completion, mark Spec Status `done` only after the traceability and completion checklist are up to date.

## Lightweight path

For ordinary non-complex work, the Intent Card can stay in chat. Still include the main scenario, one acceptance condition, non-goals, and any explicit assumption that affects implementation.
