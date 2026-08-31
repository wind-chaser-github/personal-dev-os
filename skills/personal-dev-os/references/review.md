# Review Standard

Agent operational excerpt. Human SSOT also: `~/Agent Engineering OS/20-Checklists/code-review-checklist.md`.

Tooling: **Open Code Review (`ocr`)** — installed CLI + skills `open-code-review` / `open-code-review-delegate`.

Keep this file and the vault checklist aligned when review policy or OCR wiring changes.

## Before reviewing

Consult (do not review in a vacuum):

1. **Intent / spec** — Intent Card or `omx_wiki/specs/<slug>.md`; flag missing/extra behavior (Spec axis).
2. **适用规范** — personal checklists/principles on the card, plus this review standard and `quality-gate.md`.
3. **Project norms** — `omx_wiki` conventions, ADRs, `AGENTS.md` / review docs if present.
4. **Impact** — blast radius via **codegraph** (preferred) / search / callers; modules/files/features claimed vs actually touched.

If the user asks for code review with no prior card, still reconstruct: requested behavior, applicable 规范, and likely impact before listing findings.

## How to run the review (OCR integrated)

Default for non-trivial diffs / PR / pre-merge:

1. Resolve background context: Intent Card text and/or spec page path under `omx_wiki/specs/`.
2. Prefer **OCR** for diff-scoped, line-level findings:
   - If `ocr` LLM is configured:  
     `ocr review --audience agent`  
     (add `--from <base> --to <head>` or `--commit` as needed)  
     Pass product context: `ocr review --background "<标准意图/验收摘要>"` and/or point at the spec markdown when supported.
   - If OCR LLM is **not** configured: use **delegation** so this coding agent does the LLM work:  
     `ocr delegate preview` then `ocr delegate rule <files…>` — apply those rules while reviewing with Intent + 规范.  
     Or invoke skill `open-code-review-delegate`.
3. Merge OCR/delegate findings with Dev OS axes below. OCR is strong on bugs/security/precision; **you** still own Spec (Intent) and personal/project 规范.
4. Tiny one-file cleanup: agent-only review is enough; OCR optional.

Do not skip Intent/规范 because OCR ran. Do not treat OCR silence as “matches product Intent”.

## Severity

Lead with findings ordered by severity:

- P0: broken, unsafe, data-loss, security, or cannot ship.
- P1: likely production bug, serious regression, or major maintainability issue.
- P2: should fix before merge if practical.
- P3: cleanup, clarity, or follow-up.

Map OCR severities into this scale when presenting.

## Axes

- Spec: requested behavior (Intent Card / spec page / 验收), missing/extra requirements, edge cases, non-goals.
- Standards: personal + project 规范 (architecture, testing, commenting, naming, seams), no speculative generality, no unrelated churn, observable errors, dependency direction.
- Verification: tests at the right seam, typecheck/lint/build/smoke evidence, explicit gaps (`quality-gate.md`).
- Maintainability: clear ownership, understandable common path, local next change, temporary workaround has removal condition.
- Security/privacy/performance when relevant (OCR rules help here).

## Output shape

- Findings first, by severity, with file/symbol (and line when OCR provides it).
- Note which 规范/KB/spec page informed the review (short cite).
- Note whether OCR / delegate / agent-only was used.
- Separate “violates Intent/验收” from “violates engineering 规范” from “OCR defect”.
