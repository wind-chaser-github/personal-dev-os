# Engineering Quality Gate

Use before declaring code work complete, before PR handoff, or when the user asks whether something is ready.

Human checklist SSOT: `~/Agent Engineering OS/20-Checklists/quality-gate.md` (or `$PERSONAL_DEV_OS_VAULT`). Keep aligned when the gate changes.

## Required Evidence

- Behavior: targeted tests cover the changed path or an explicit reason explains why not.
- Integration: affected API, UI, job, command, or workflow has a smoke check when practical.
- Static checks: typecheck, lint, build, or compiler checks run when available and relevant.
- Regression: at least one likely failure mode is tested or manually verified.
- Blast radius: touched shared modules, contracts, migrations, config, or auth paths are named.
- Documentation: docs, ADR, migration notes, release notes, environment notes, or Spec Page status are updated when needed.
- Review: for non-trivial diffs/PR, Open Code Review (`ocr` or delegate) ran, or the reason for skipping it is explicit.
- Security: security-sensitive changes have boundary, authorization, secrets, privacy, dependency, and abuse verification appropriate to risk.
- Release: production-facing changes have compatibility, rollout, rollback, and post-release verification evidence.

## Review Questions

- Did the change preserve existing ownership boundaries?
- Did it add unnecessary abstraction, state, dependency, or configuration?
- Are errors observable and actionable?
- Are names and APIs consistent with the local codebase?
- Can the change be rolled back or safely disabled?
- Is documentation or migration guidance needed?

## Norms

Also apply relevant personal/project 规范 named for the change (testing, architecture, commenting, review checklist). Cite them briefly when they drive a “not ready” call.

For non-trivial diffs/PR, prefer running Open Code Review (`ocr review` or delegate) in addition to the evidence above — see `review.md`.

## Risk-Based Depth

- Trivial/local change: targeted check is enough.
- Shared module, contract, migration, auth, billing, permissions, concurrency, or config: require tests plus broader static/build/smoke verification.
- User-facing UI flow: include browser/manual/visual smoke evidence when automated e2e is absent.
- Production operations or irreversible data changes: require rollback, compatibility, and monitoring notes.

## Completion Rule

If verification cannot run, say exactly what could not run and use the next-best check. Do not report "done" as if tests passed.
