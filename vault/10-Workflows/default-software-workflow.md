# Default Software Workflow

Use this for product development, architecture, feature work, bug fixing, refactoring, and maintenance.

Narrative source of truth for the loop. Agent operational SSOT: skill `personal-dev-os` (symlinked into each IDE’s skills dir). Wiring: [[90-Agent-Adapters/README]].

## Loop

1. Frame the objective, non-goals, constraints, success criteria, and risks. For non-trivial feature/design/test work, emit an Intent Card (standard intent + behavior delta + assumptions + KB/规范 + impact preview); **complex** work also writes `omx_wiki/specs/<slug>.md`. Keep requirements and design separate, assign `R-*`/`A-*` IDs, and maintain traceability to implementation and verification. See skill `clarify-and-impact` / `requirements-and-design` and [[40-Decision-Records/intent-card-template]] / [[40-Decision-Records/spec-page-template]].
2. Inspect the existing system before proposing changes (fill impact preview with evidence; prefer codegraph).
3. Decide the approach and name rejected alternatives when the decision is meaningful.
4. Plan vertical slices with verification.
5. Execute small scoped edits.
6. Verify with targeted tests and relevant static/smoke checks.
7. Review against Intent/Spec + 规范; for non-trivial diffs run Open Code Review (`ocr` or delegate).
8. Capture reusable knowledge in the right place.
9. Workflow Delta: decide whether the personal method should change (`none`, `candidate added`, `standard promoted`, `adapter updated`, or `project memory updated`). See [[workflow-evolution]].

## Ease-of-Use Rule

The agent should infer the current stage from the user's request and fill missing earlier stages only when needed. The user should not have to remember workflow names or sequence.

## Final Report (Non-Trivial Work)

- Changed/decided.
- Verification evidence.
- Capture: what was recorded, or `none`.
- Workflow delta: one of the values above.
- Remaining risk, if any.
