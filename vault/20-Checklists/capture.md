# Capture

Human checklist. Agent operational copy: `personal-dev-os/references/capture.md`.  
Daily phrases: [[Daily-Use-Manual]].

## Capture only durable knowledge

- Repo facts, decisions, failure modes, personal rules, workflow deltas.
- Skip one-off command output, guesses, and facts already obvious from code.

## Where

| Kind | Destination |
| --- | --- |
| Project facts / env / domain | repo `omx_wiki`, docs, `CONTEXT.md` |
| Long-lived architecture choice | repo ADR (+ optional Obsidian summary) |
| Cross-project principles / checklists / reusable lessons | this Obsidian vault |
| Workflow method changes | [[15-Workflow-Ledger/README]] first |
| Must auto-run in agents | vault **and** `personal-dev-os` skill (`SKILL.md` / `references/`) |

Do not treat Obsidian as a project wiki. It is the personal cross-project knowledge layer. Project-specific facts stay in the repo unless they have been generalized into a reusable personal rule.

## Sync rule

“以后自动 / 每次都要” → update vault first, then skill in the **same** change. Soft-linked IDEs pick up the skill; do not paste copies into each IDE.
