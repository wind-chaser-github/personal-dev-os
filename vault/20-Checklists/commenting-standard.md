# Commenting Standard

## Purpose

Comments should preserve intent that code cannot express clearly enough. They should not narrate obvious syntax.

## Write Comments For

- Non-obvious business rules, especially when the code looks simpler than the rule.
- Constraints from external systems, legacy behavior, regulation, data shape, performance, or compatibility.
- Deliberate tradeoffs and rejected simpler approaches.
- Invariants that callers or future maintainers must preserve.
- Temporary workarounds with an owner, reason, and removal condition.
- Complex algorithms where a short orientation saves future readers time.

## Avoid Comments That

- Restate the next line of code.
- Explain what a well-named function or variable already says.
- Apologize for unclear code instead of improving the code.
- Preserve stale history that belongs in git, ADRs, or issue trackers.
- Use vague labels like "fix bug", "handle edge case", or "temporary" without saying which bug, edge case, or condition.

## Required Format For Temporary Notes

Use a searchable prefix and include a condition for removal:

```text
TODO(owner, date): reason. Remove when <condition>.
```

Use `FIXME` only for known incorrect behavior that is intentionally left unresolved.

## Review Questions

- Could a better name or smaller function remove this comment?
- Does the comment explain why, not merely what?
- Will this still be true after a small refactor?
- Does it name the external constraint or business rule precisely?
