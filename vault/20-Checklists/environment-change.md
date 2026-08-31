# Environment Change

Human checklist. Agent operational copy: `personal-dev-os/references/environment-change.md`.  
Template: [[40-Decision-Records/project-environment-template]].

## When

Any change to Docker, compose, env examples, deployment scripts, startup commands, ports, service dependencies, profiles, credentials shape, or local/remote integration assumptions.

## Required

1. Name scope: repo, service, environment profile, machine/profile when relevant.
2. Inspect existing environment docs / README / `omx_wiki/environments`.
3. Update project environment memory when future run/verify/deploy/debug changes.
4. Smallest safe validation (`docker compose config`, script dry-run, smoke when stack is up).
5. Explicit verification gap if something cannot run.

## Destination

Prefer existing authoritative repo docs. Else:

```text
omx_wiki/environments/<scope>.md
```

Never store project environment facts as global personal rules in this vault.

## Sync rule

Keep this file aligned with skill `references/environment-change.md` when the gate changes.
