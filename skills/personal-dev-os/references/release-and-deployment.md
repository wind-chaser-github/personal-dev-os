# Release And Deployment

Read for production releases, migrations, feature flags, configuration, infrastructure, and externally visible behavior.

- Record artifact source/version/provenance and run relevant CI tests, static checks, security checks, and migration validation.
- Define old/new client compatibility, migration/backfill/locking/retry/rollback behavior.
- Give feature flags an owner, default, rollout scope, success metric, and removal date.
- Use staging smoke checks and phased rollout when blast radius or reversibility requires it.
- Know the release dashboard, alerts, rollback command, and post-release success window before deploying.
- Remove temporary flags, compatibility branches, and migration scaffolding at their exit condition.
