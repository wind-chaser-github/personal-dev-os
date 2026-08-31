<!-- GENERATED FILE. Source of truth:
     ~/Agent Engineering OS/20-Checklists/quality-gate.md
     SHA256: 09fa9ea0907e3e62fcc64abae3cca74e7571c75e737e749b9b16829d33ab8efc -->

# Quality Gate

Human checklist. Agent operational copy: `personal-dev-os/references/quality-gate.md`.

Before calling software work complete, verify:

- Changed behavior is tested or the test gap is explicit.
- Relevant typecheck, lint, build, or compiler checks passed when available.
- Affected integrations were smoke-tested when practical.
- The blast radius is understood.
- No unnecessary abstraction or dependency was introduced.
- Error handling and rollback are adequate for the risk.
- Documentation, ADR, migration, Spec Page status, or release notes were added when needed.
- Comments explain intent, constraints, or tradeoffs rather than restating code.
- Review-relevant axes were considered: spec, standards, verification, maintainability.
- For non-trivial diffs/PR: Open Code Review ran (`ocr` or delegate) or an explicit reason skipped it — see [[code-review-checklist]].
- Named 规范 for the change were applied (testing, architecture, commenting, review).
- Security-sensitive changes have appropriate auth, input, secrets, privacy, dependency, and abuse checks.
- Production-facing changes have compatibility, rollout, rollback, and post-release verification evidence.

## Risk-Based Depth

- Trivial/local change: targeted check is enough.
- Shared module, contract, migration, auth, billing, permissions, or concurrency: require tests plus broader static/build/smoke verification.
- User-facing UI flow: include browser/manual/visual smoke evidence when automated e2e is absent.
- Production operations or irreversible data changes: require rollback, compatibility, and monitoring notes.

## Sync rule

Keep aligned with skill `references/quality-gate.md` when the gate changes.
