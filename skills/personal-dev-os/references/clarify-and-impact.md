# Clarify And Impact

Borrowed patterns (not whole frameworks):

- requirements-builder: inspect code first; prefer yes/no + defaults; name likely files
- OpenSpec: describe behavior change as ADDED / MODIFIED / REMOVED before coding
- Wiegers-style quality: complete, unambiguous, testable
- EARS-ish intent: `当 <条件>，<系统> 应 <可观察行为>`
- Impact analysis: use codegraph / search / callers — same idea as spec-gen blast radius
- Requirements/design separation: requirements define observable product behavior; design defines ownership, data flow, contracts, and mechanisms

Human template: `~/Agent Engineering OS/40-Decision-Records/intent-card-template.md`  
Human checklist SSOT: `~/Agent Engineering OS/20-Checklists/clarify-and-impact.md`

Keep this file and the vault checklist aligned when behavior changes.

## When

Use for non-trivial feature, design, product behavior, or test-scenario work when the user request could be misread. For complex work, use the requirements/design sections in the Spec Page template; do not leave design decisions only in chat.

Skip printing a full card for tiny local edits. Still avoid silent assumptions.

If the user says「直接干」/ skip clarifying: emit a minimum card (标准意图 + 假设 + 影响预览 + 知识依据若已查到), then proceed.

Escalate when the request is large, high-risk, multi-module, or still ambiguous after one clarify round:

- Process: `deep-interview` or `grill-me` as needed.
- **Persist a Spec Page** (required for complex work once intent is stable enough to implement): see below.

## Process

1. **Ambiguity scan** — missing actor, trigger, outcome, non-goals, data, permissions, acceptance, or edge behavior?
2. **Consult knowledge bases** (before inventing terms or asking the user) — see below.
3. **Normalize** — rewrite into an Intent Card using KB + code terms; mark conflicts as 假设 or 待决.
4. **Inspect for impact** — codegraph/search/reads for modules/files/features. Do not ask the user for discoverable code facts.
5. **Clarify** — ask only what changes implementation. Prefer yes/no with a stated default. Normal tasks: **at most 3 questions in one round**.
6. **Confirm or proceed** — update the card, then Decide/Plan.
7. **Persist Spec Page when complex** — if the work is complex (see below), write/update the spec file before Execute.

## Persist Spec Page (complex)

**Complex** means any of: multi-module blast radius, auth/billing/data/migration risk, product behavior unclear without a long thread, or user asked to keep a spec.

Write the Intent Card to the project knowledge layer:

```text
omx_wiki/specs/<kebab-title>.md
```

Fallback: `docs/specs/<kebab-title>.md` if the repo has no `omx_wiki`.

Rules:

- Use vault template shape: `~/Agent Engineering OS/40-Decision-Records/spec-page-template.md`.
- One active spec page per change thread; update in place instead of spawning duplicates.
- Link it from chat and put the path on the Intent Card under 知识依据.
- Later Review / OCR: pass this page (or its 标准意图+验收 summary) as `--background` / review context.
- Ordinary non-complex work: chat Intent Card only — do **not** force a spec file.

## Knowledge bases and norms to consult

Look up in this order. Skip a layer if missing; do not block on empty wiki.

| Priority | Source | Use for |
| --- | --- | --- |
| 1 | Repo `CONTEXT.md` / `CONTEXT-MAP.md` | Canonical domain words; avoid synonym drift |
| 2 | Repo `omx_wiki/` (architecture, decision, convention, environment, debugging) | Project rules, past decisions, how this product already works |
| 3 | Repo ADRs / `docs/` / `AGENTS.md` / `CLAUDE.md` / project review conventions | Constraints and local agent/review instructions |
| 4 | **Personal 规范** — `~/Agent Engineering OS/00-Principles/` + `20-Checklists/` (+ relevant `30-Patterns/`) | Architecture, testing, debugging, commenting, quality-gate, code-review expectations that apply across projects |
| 5 | This skill `references/` (architecture, testing, review, …) | Agent-operational excerpts of those norms |
| 6 | Prior Intent Cards / session notes in wiki if present | Continuity on the same feature thread |

Rules:

- Prefer KB vocabulary in **标准意图** over the user’s casual synonyms (keep 原文 intact).
- If user wording conflicts with KB/规范, surface it in **假设/待决** — do not silently override the user or the norm.
- Cite what you used under **知识依据** and list binding norms under **适用规范** (checklist/principle names or paths).
- Do not dump long KB/规范 text into the card; cite and apply.
- OMX wiki ops (`omx wiki query` / read) are fine when available; otherwise read files directly.
- When the upcoming work will need a review/PR, already note which review norms apply (at least personal `code-review-checklist` + any repo convention).

## Intent Card (print for non-trivial work)

```markdown
## Intent Card

### 原文
<user wording>

### 标准意图
当 <条件/角色>，系统应 <可观察行为>。
（用语对齐 CONTEXT / omx_wiki 已有术语）

### 行为增量（OpenSpec-style）
- ADDED:
- MODIFIED:
- REMOVED:
- 不变（显式）:

### 非目标
-

### 验收
1.
2.

### 假设（未确认则不得当成事实）
-

### 知识依据
- CONTEXT / omx_wiki / ADR / 个人库: <paths or titles, or `none found`>

### 适用规范
- 个人: <e.g. testing-standard, architecture-principles, code-review-checklist>
- 项目: <repo convention / wiki page, or `none`>

### 影响预览
- 模块:
- 文件/符号:
- 可能波及的功能:
- 风险（权限/数据/兼容/测试缺口）:

### 待决问题
- Q1 (默认: …) yes/no
```

## Quality bar (lightweight Wiegers)

Before leaving Frame, the card should be:

- **Grounded** — checked KB + 规范 + code for existing terms and constraints when they exist
- **Complete enough** to implement without guessing product meaning
- **Unambiguous** — no “适当 / 优化一下 / 更好用” without measurable meaning
- **Testable** — at least one acceptance check
- **Norm-aware** — 适用规范 named when architecture/testing/review expectations will bind the change
- **Traceable** — each must requirement maps to an acceptance condition and, for complex work, an implementation slice and verification evidence
- **Boundary-complete** — relevant permissions, data lifecycle, failure, compatibility, rollout, and observability concerns are answered or marked not applicable

## Impact preview rules

- Prefer concrete paths and symbols over vague layer names.
- Say what product behavior might change, not only which files.
- If impact cannot be scoped yet, say so and list what you will inspect next — do not invent a fake file list.

## Capture

After the work (or when the user says 记住/沉淀):

- Complex Intent → already in `omx_wiki/specs/`; mark Status `done` when shipped
- New/changed domain terms → `CONTEXT.md` / `omx_wiki`
- Project decisions from the card → ADR or `omx_wiki/decision`
- New/changed engineering 规范 → Agent Engineering OS `00-Principles` / `20-Checklists`, then skill `references/` if agents must auto-apply
- Review lessons that should become checklist items → `code-review-checklist` / ledger
- One-off cards → chat only, unless the user asks to keep them (then prefer `omx_wiki` under a clear title)
