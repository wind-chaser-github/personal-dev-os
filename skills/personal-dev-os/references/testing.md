# Testing Standard

Agent operational excerpt. Human SSOT also: `~/Agent Engineering OS/20-Checklists/testing-standard.md`. Keep aligned when the standard changes.

## Surface

- Test behavior through public interfaces, not private implementation.
- Test names should describe user/caller-visible behavior.
- Expected values should come from an independent source of truth, not the same calculation as the implementation.
- Pick the lowest layer that proves behavior without coupling to internals:
  - Unit: deterministic logic, branching, parsing, validation, calculations.
  - Integration: real interfaces across modules, repositories, handlers, jobs.
  - Contract: request/response/event/permission assumptions across services.
  - E2E: user-critical combined flows.
  - Smoke: cheap proof the changed path starts and works basically.

## When To Add/Update Tests

New user-visible behavior; bug fixes with a stable seam; complex branching; permissions/billing/auth; migrations; retries; concurrency; parsing/transforms; shared utilities; refactors that move behavior across seams.

Accept a test gap only when explicit, with next-best verification named. Valid examples: no stable seam yet, external dependency cannot run locally, pure visual polish with screenshot/manual evidence, or emergency hotfix with tracked follow-up coverage.

## Practice

- Complex features/bugs: prefer red -> green -> review.
- Work one vertical slice at a time: one seam, one failing test, one minimal implementation.
- Mock at system boundaries (external APIs, time, randomness, sometimes FS/network). Avoid mocking internal owned modules.
- Smells: assertions mirroring implementation, broad snapshots, mechanic-named tests, brittle internals, real time/network/shared-state dependence.
