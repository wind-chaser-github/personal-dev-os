# Architecture Frame

Use this when a task changes boundaries, data flow, dependencies, persistence, APIs, permissions, scaling behavior, or long-lived technical direction.

Human checklist SSOT: `~/Agent Engineering OS/20-Checklists/architecture-frame.md` (or `$PERSONAL_DEV_OS_VAULT`). Keep aligned when the frame changes.

## Minimum Frame

Answer these before implementation:

- Objective: what result must exist after the change.
- Non-goals: what must not be changed.
- Users/callers: who or what depends on this behavior.
- Boundary: which module owns the behavior after the change.
- Data flow: where data enters, transforms, persists, and exits.
- Domain/state model: important entities, invariants, states, legal transitions, and ownership.
- Contracts: API/event/UI/CLI inputs, outputs, errors, ordering, and compatibility expectations.
- Failure modes: timeout, partial failure, bad input, permissions, retries, idempotency.
- Security/privacy: authentication, authorization, sensitive data, retention, audit, and abuse boundaries.
- Operations: observability, SLO or performance target, capacity/cost assumptions, rollout, and rollback.
- Compatibility: migrations, API shape, rollback, feature flags.
- Verification: the smallest tests or checks that prove the decision.
- If object storage / blob registry is in scope: read `object-storage-and-registry.md` (fan-out, indexes, lifecycle).

## Decision Bias

- Keep ownership explicit.
- Avoid bidirectional dependencies.
- Keep orchestration separate from domain logic.
- Prefer narrow interfaces and boring data contracts.
- Make failure behavior visible and testable.
- Reject abstractions that do not remove current complexity or protect a real boundary.

## Escalate

Pause for a user decision only when there are materially different product semantics, irreversible data migrations, credentialed production actions, or broad cost/security tradeoffs.
