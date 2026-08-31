# Commenting Standard

Agent operational excerpt. Human SSOT also: `~/Agent Engineering OS/20-Checklists/commenting-standard.md`. Keep aligned when the standard changes.

- Comments explain intent, constraints, invariants, tradeoffs, external requirements, compatibility, performance, or non-obvious business rules.
- Do not comment ordinary mechanics that names and structure can express.
- Temporary notes need reason and removal condition:

```text
TODO(owner, date): reason. Remove when <condition>.
```

- Use `FIXME` only for known incorrect behavior left unresolved on purpose.
