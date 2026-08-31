<!-- GENERATED FILE. Source of truth:
     ~/Agent Engineering OS/20-Checklists/release-and-deployment.md
     SHA256: cb607d18c556033edc2a8bf93ce842c038c0dd72c9372ce8b1b1af61619eb0e4 -->

# Release And Deployment

Use for production releases, migrations, feature flags, configuration changes, infrastructure changes, and externally visible behavior.

## Before release

- [ ] Build artifact is reproducible or its source/version/provenance is recorded.
- [ ] CI runs relevant tests, static checks, security checks, and migration validation.
- [ ] Compatibility with old and new clients/services is explicit.
- [ ] Database migration, backfill, locking, rollback, and retry behavior are documented.
- [ ] Feature flags have owner, default, rollout scope, success metric, and removal date.

## Rollout

- [ ] Staging or pre-production smoke check covers the changed path.
- [ ] Release is phased when blast radius or reversibility requires it.
- [ ] Release dashboard, logs, alerts, and rollback command are known before deployment.
- [ ] Post-release verification has a time window and explicit success criteria.

## After release

- [ ] Confirm user-facing metrics and error budget impact.
- [ ] Remove temporary flags, compatibility branches, and migration scaffolding when their exit condition is met.
- [ ] Record release-specific operational knowledge in project docs, not the global vault.
