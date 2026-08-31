# Architecture Standard

Agent operational excerpt. Human SSOT also: `~/Agent Engineering OS/00-Principles/architecture-principles.md` (or `$PERSONAL_DEV_OS_VAULT`). Keep aligned when principles change. Framing checklist: `architecture-frame.md` ↔ vault `20-Checklists/architecture-frame.md`.

For framing questions before big changes, see `architecture-frame.md`.

## Deep Modules

- Prefer small public interface, substantial hidden behavior.
- Interface = everything callers must know: signatures, invariants, ordering, errors, configuration, performance expectations.
- Put seams where behavior varies or tests need a stable public surface.
- Do not add a seam for a single adapter unless a real second adapter is near-term.
- Hide internals; do not expose them just to ease tests.
- Make common paths easy and dangerous paths explicit.
- Prefer explicit result/error shapes over hidden side effects.
- Keep lifecycle/ordering constraints visible in interfaces.
- Do not leak persistence, transport, framework, or vendor details unless they are the abstraction.
- Avoid options bags until real options justify one.
- Use stable domain terms over technical convenience names.
- Validate near untrusted boundaries.
- Make idempotency explicit for retryable commands.
- Treat migrations, backfills, compatibility, rollback, and monitoring as part of design.
- Object storage keys and blob registries: follow `object-storage-and-registry.md` (no pure-flat / pure-type prefixes; index real filters; keyset pagination).

## ADR

Write or update an ADR when a decision is expensive to reverse, changes ownership boundaries, affects persistence/auth/billing/privacy/external contracts, or deliberately violates local convention.
