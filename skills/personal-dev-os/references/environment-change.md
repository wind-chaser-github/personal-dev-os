# Environment Change Gate

Use this before finishing any task that changes Docker, compose files, env examples, deployment scripts, startup commands, ports, service dependencies, profiles, credentials shape, or local/remote integration assumptions.

Human checklist SSOT: `~/Agent Engineering OS/20-Checklists/environment-change.md` (or `$PERSONAL_DEV_OS_VAULT`). Keep aligned when the gate changes.

## Required Actions

1. Identify the affected scope: repo, service, environment profile, and machine/profile when relevant.
2. Inspect existing repo environment docs, `README`, `docs`, and `omx_wiki/environments`.
3. Update the project environment memory when the change affects how future agents or developers run, verify, deploy, or debug the system.
4. Run the smallest safe validation available:
   - `docker compose config` for compose changes.
   - Relevant script `--help` or dry-run for environment scripts.
   - Service smoke checks when a stack is running.
5. Report any verification gap explicitly.

## Destination

Prefer existing repo docs if they are already authoritative.

If no source exists, use:

```text
omx_wiki/environments/<scope>.md
```

Scopes should be explicit: `docker-local`, `backend-local`, `web-local`, `admin-local`, `staging`, `production`, `ci-github-actions`, or machine-specific names.

## Review Questions

- Did a port become publicly exposed or intentionally local-only?
- Did service dependency order change?
- Did a local-only URL become part of a remote integration path?
- Did a secret, token, password, host, or profile assumption get introduced?
- Does this belong in an example file, a local override, or a private env file?
- Can another developer reproduce the environment from the docs?
