<!-- GENERATED FILE. Source of truth:
     ~/Agent Engineering OS/20-Checklists/clarify-and-impact.md
     SHA256: f8fa46ce9625011089631bc9a816880b37ca797589d5e8190b3855af95afbf1a -->

# Clarify And Impact

Human checklist. Agent operational copy: `personal-dev-os/references/clarify-and-impact.md`.  
Templates: [[40-Decision-Records/intent-card-template]], [[40-Decision-Records/spec-page-template]]. For complex requirements/design work also use [[20-Checklists/requirements-and-design]].

Borrowed patterns (not whole frameworks): requirements-builder Q&A, OpenSpec ADDED/MODIFIED/REMOVED, Wiegers testability, EARS-ish intent, impact/blast-radius thinking (via codegraph).

## When

- Non-trivial feature, design, product behavior, or test-scenario work that could be misread.
- Skip full card for tiny local edits; still avoid silent assumptions.
- User says「直接干」: minimum card (标准意图 + 假设 + 影响预览 + 知识依据若有), then proceed.

## Process

1. Ambiguity scan (actor, trigger, outcome, non-goals, data, permissions, acceptance, edges).
2. Consult knowledge bases and 规范 (see order below).
3. Normalize into an Intent Card.
4. Inspect impact (codegraph/search/reads) — do not ask the user for discoverable code facts.
5. Clarify: yes/no + defaults; normal tasks **max 3 questions per round**.
6. Confirm or proceed → Decide/Plan.
7. If **complex**, persist Spec Page before Execute.

## Knowledge / 规范 order

1. `CONTEXT.md` / `CONTEXT-MAP.md`
2. `omx_wiki/`
3. ADR / docs / `AGENTS.md` / project review conventions
4. This vault: `00-Principles/`, `20-Checklists/`, `30-Patterns/`
5. Skill `references/` (agent excerpts)
6. Prior Intent / Spec pages for the same thread

## Complex → Spec Page

Complex = multi-module blast radius, auth/billing/data/migration risk, long clarification thread, or user asked to keep a spec.

```text
omx_wiki/specs/<kebab-title>.md
```

Fallback: `docs/specs/<kebab-title>.md`. One page per change thread; update in place.

## Quality bar

- Grounded (KB + 规范 + code)
- Complete enough to implement
- Unambiguous (no vague “优化一下”)
- Testable (≥1 acceptance)
- Norm-aware (适用规范 named when binding)
- Traceable (complex work: requirement → acceptance → implementation → verification)
- Boundary-complete (relevant edge, permission, data, compatibility, and operational concerns are answered or marked N/A)

## Sync rule

Changing this checklist or the skill `clarify-and-impact.md` requires updating the other side in the same change when behavior should stay aligned.
