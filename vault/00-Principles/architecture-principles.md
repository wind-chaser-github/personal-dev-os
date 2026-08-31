# Architecture Principles

Derived from current personal standards plus reviewed external engineering-skill principles.

## Deep Modules

- Prefer modules with small interfaces and substantial hidden behavior.
- Treat the interface as everything callers must know: signatures, invariants, ordering, errors, configuration, and performance expectations.
- Put seams where behavior genuinely varies or where tests need a stable public surface.
- Do not introduce a seam for only one adapter unless there is a near-term, real second adapter.
- Hide internal complexity behind the module interface; do not expose internal seams just to make tests easier.

## Design Checks

- Deletion test: if deleting a module removes complexity, it may be pass-through indirection; if complexity spreads back into callers, it is earning its place.
- Interface test: callers and tests should cross the same public seam.
- Locality test: a likely change should concentrate in one module, not scatter across unrelated files.
- Leverage test: one interface should give callers useful behavior without requiring them to understand the implementation.

## Dependency Categories

- In-process logic: test directly through the module interface.
- Local substitutable dependencies: prefer local test stand-ins when available.
- Remote owned services: define a narrow port at the seam; production uses transport adapter, tests use local adapter.
- True external services: inject a boundary interface and mock at that boundary only.

## Design Alternatives

For high-impact interfaces, design at least two materially different options before committing. Compare by depth, locality, seam placement, caller ergonomics, failure modes, and testability.

## Design Stage Checklist

Use before implementing non-trivial architecture or module changes:

- Define the user/caller outcome and the failure modes that matter.
- Identify the owning module/context for the behavior.
- Name the public interface and what callers must know to use it safely.
- Identify data ownership: who creates, validates, mutates, persists, and observes the data.
- Identify dependency direction and any forbidden dependencies.
- Identify the test seam before implementation.
- Decide whether this is reversible. If not, include migration and rollback.
- Record rejected alternatives when a future maintainer would reasonably ask why.

## API And Interface Rules

- Make the common path easy and the dangerous path explicit.
- Prefer explicit result/error shapes over hidden side effects.
- Keep ordering constraints and lifecycle requirements visible in the interface.
- Do not leak persistence, transport, framework, or vendor details unless they are the actual abstraction.
- Avoid "options bag" interfaces until there are enough real options to justify one.
- Prefer stable domain terms over technical convenience names.

## Data And State Rules

- Put validation as close as practical to the boundary where untrusted data enters.
- Keep derived state either cheap to recompute or clearly owned and invalidated.
- Make idempotency explicit for commands that can be retried.
- Treat migrations, backfills, and compatibility windows as part of the design, not deployment chores.

## Escalation Triggers

Write an ADR or ask for explicit decision when:

- The decision is expensive to reverse.
- The decision changes ownership boundaries.
- The decision changes persistence, auth, billing, privacy, or external contracts.
- The implementation deliberately violates a local convention.
