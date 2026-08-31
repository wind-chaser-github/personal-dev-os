<!-- GENERATED FILE. Source of truth:
     ~/Agent Engineering OS/20-Checklists/architecture-frame.md
     SHA256: 3c38bc7f9299e95af386e7c67426a91f4f81bc71854fdd5c4ea85566860c992d -->

# Architecture Frame

Human checklist for boundary-heavy changes. Agent copy: `personal-dev-os/references/architecture-frame.md`.  
Principles: [[00-Principles/architecture-principles]].

## When

Boundaries, data flow, dependencies, persistence, APIs, permissions, scaling, or long-lived technical direction change.

## Minimum questions before implementation

- Objective / non-goals
- Users/callers
- Owning module/boundary
- Data enter → transform → persist → exit
- Domain states, invariants, legal transitions, and ownership
- API/event/UI/CLI contracts, including errors and compatibility
- Failure modes (timeout, partial, bad input, permissions, retries, idempotency)
- Security/privacy, data retention, and audit implications
- Observability, performance/capacity/cost assumptions, rollout, and rollback
- Compatibility (migrations, API shape, rollback, flags)
- Smallest verification that proves the decision
- If object storage / blob registry is in scope: [[20-Checklists/object-storage-and-registry-performance]]

## Bias

Explicit ownership; no bidirectional deps; orchestration ≠ domain; narrow interfaces; visible failures; no abstraction without removing real complexity.

## Sync rule

Keep aligned with skill `references/architecture-frame.md` and architecture principles when either changes.
