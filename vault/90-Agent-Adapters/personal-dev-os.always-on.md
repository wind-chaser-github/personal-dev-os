---
alwaysApply: true
---

# Personal Development OS (mandatory baseline)

For non-trivial software work (features, bugs, refactors, design, tests, review, env/deploy changes), you **must** follow skill `personal-dev-os`:

`~/.codex/skills/personal-dev-os/SKILL.md`

Read that skill at the start of the task, then load its `references/` when relevant (especially `clarify-and-impact`, `commenting`, `testing`, `review`, `quality-gate`).

## Minimums (do not skip)

1. **Frame**: Intent Card for non-trivial product/design/test work (知识库 + 规范 + 影响预览). Complex → `omx_wiki/specs/<slug>.md`.
2. **Inspect** before editing (codegraph/search/docs). Do not invent project facts.
3. **Execute** small scoped diffs; follow project patterns and 适用规范.
4. **Comments**: add comments where the commenting standard requires them (intent, constraints, invariants, tradeoffs, external rules). Do not leave unexplained business/legacy constraints in code with zero comments.
5. **Verify** with fresh evidence or name the exact gap.
6. **Review** against Intent + 规范; non-trivial diffs use Open Code Review (`ocr` or delegate) when available.
7. End with: changed/decided, verification evidence, capture (or none), workflow delta.

Trivial one-line edits: keep this lightweight. If the user says「不要流程」, skip. Otherwise **do not** ship feature work without Intent framing and verification.
