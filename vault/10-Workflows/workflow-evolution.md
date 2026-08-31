# Workflow Evolution

Use this to improve the user's personal development workflow over time.

## End-of-Task Workflow Delta

After non-trivial software work, ask internally:

1. What slowed the work down?
2. What prevented a bug or mistake?
3. What should happen earlier next time?
4. What repeated step could become a checklist, skill, rule, or script?
5. Is this project-specific or cross-project?

## Actions

- Project-specific learning: update repo docs, ADR, or `omx_wiki`.
- Cross-project method: add/update `15-Workflow-Ledger/candidates.md`.
- Proven method: promote to `15-Workflow-Ledger/standards.md`.
- Automatic behavior: update the matching Obsidian checklist/principle and the `personal-dev-os` skill reference in the same change; repair adapter links only when wiring changed.

## Rule Lifecycle

- Use `MUST` only for rules with a concrete correctness, security, data-loss, or operational risk.
- Use `SHOULD` for a strong default with justified exceptions; record the exception and reason.
- Use `MAY` for a useful option, not a mandatory workflow gate.
- Every active rule should state scope, owner, evidence or rationale, and a review date when it may become stale.
- Deprecate rules when the underlying technology, project shape, or evidence no longer supports them; do not silently leave contradictory rules active.

## Allowed Delta Values

Use exactly one of:

- `none`
- `candidate added`
- `standard promoted`
- `adapter updated`
- `project memory updated`

These match the skill Final Response Shape and the portable agent rule.

## Default Final Report Add-on

For non-trivial tasks, include one short line:

```text
Workflow delta: none
```

or:

```text
Workflow delta: candidate added "<title>"
```
