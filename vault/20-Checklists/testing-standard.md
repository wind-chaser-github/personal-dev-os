# Testing Standard

## Test Surface

- Test behavior through public interfaces, not private implementation details.
- Tests should survive internal refactors when behavior is unchanged.
- Test names should describe user/caller-visible behavior.
- Expected values must come from an independent source of truth, not the same calculation as the implementation.

## Test Layers

Choose the lowest layer that proves the behavior without coupling to internals:

- Unit/pure tests: deterministic logic with no I/O, complex branching, parsing, calculation, validation.
- Integration tests: module behavior across real interfaces, database/repository behavior, API handlers, job processors, service boundaries.
- Contract tests: cross-service or external integration assumptions, request/response shape, event schemas, permission contracts.
- End-to-end tests: user-critical workflows where integration between UI/backend/services matters more than local logic.
- Smoke tests: cheap checks that a changed app, command, route, or job starts and performs the basic path.

## What Requires Tests

- New user-visible behavior.
- Bug fixes where a correct seam exists.
- Complex branching, permissions, billing, auth, migrations, retries, concurrency, parsing, or data transformation.
- Shared utilities or modules used by multiple callers.
- Refactors that move behavior across seams.

## Acceptable Test Gaps

Skipping tests is acceptable only when the gap is explicit and the next-best verification is named. Examples:

- No stable seam exists yet; document this as a design smell.
- External dependency cannot be exercised locally; use a contract fixture or mocked boundary and name the missing live check.
- Pure visual polish with manual screenshot verification.
- Emergency hotfix where follow-up regression coverage is tracked.

## TDD Loop

- For complex features or bug fixes, prefer red -> green -> review.
- Work one vertical slice at a time: one seam, one failing test, one minimal implementation.
- Do not write a large batch of imagined tests before learning from the first implementation slice.
- Refactoring belongs after the behavior is green, not mixed into the red/green step.

## Seams

- Identify the seam under test before writing tests.
- Prefer integration-style tests through real project interfaces.
- Do not test internals unless there is no stable public seam; if no seam exists, treat that as a design smell.

## Mocking

- Mock at system boundaries: external APIs, time, randomness, sometimes filesystem/network.
- Avoid mocking internal modules you own.
- Prefer test databases or local stand-ins for persistence when practical.
- Design external clients as specific operations instead of generic conditional fetchers.

## Test Quality Smells

- Test fails after harmless refactor.
- Assertion repeats the implementation.
- Snapshot is too broad to explain intent.
- Mock setup is more complex than the behavior under test.
- Test name describes implementation mechanics.
- Test depends on real time, order, network, or shared state without isolation.
