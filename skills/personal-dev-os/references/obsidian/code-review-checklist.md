<!-- GENERATED FILE. Source of truth:
     ~/Agent Engineering OS/20-Checklists/code-review-checklist.md
     SHA256: 579c3776f1a39619ac4e8ac215ea2919d0fc1675f1e7c7c6ea82501e9e5e737b -->

# Code Review Checklist

Human checklist. Agent operational copy: `personal-dev-os/references/review.md`.  
OCR adapter: [[90-Agent-Adapters/open-code-review]].

Review along separate axes so one kind of success does not hide another kind of failure.

## Before reviewing

1. Reload **Intent Card** or Spec Page (`omx_wiki/specs/…`) and 验收.
2. Reload **适用规范** (this checklist + project conventions + card-named norms).
3. Re-check **impact** (codegraph preferred): modules/files/features claimed vs touched.
4. If no prior card: reconstruct requested behavior, norms, and likely impact first.

## Tooling (Open Code Review)

For non-trivial diffs / PR / pre-merge:

- Prefer `ocr review` (pass Intent/验收 as `--background`) when OCR LLM is configured.
- Else use `ocr delegate` / skill `open-code-review-delegate` so the coding agent applies OCR file+rule packing.
- Tiny one-file cleanup: agent-only review is enough; OCR optional.
- OCR silence ≠ Intent satisfied. Still score Spec and Standards axes yourself.

## Spec Axis

- Does the change implement the requested behavior (Intent/Spec)?
- Are any requirements missing or partial?
- Did the change add behavior outside the request?
- Are edge cases from the spec handled?
- Are non-goals respected?
- Are product semantics preserved where the implementation changed shape?

## Standards Axis

- Does the diff follow repo conventions and documented standards?
- Are names honest and domain-aligned?
- Is behavior placed behind the right interface/seam?
- Did the change add speculative generality?
- Is duplicated logic justified or should a shared shape be extracted?
- Did one logical change scatter across many files?
- Is one file changing for unrelated reasons?
- Are primitives standing in for domain concepts that deserve types?
- Are repeated switches or condition cascades signaling a missing abstraction?
- Are there pass-through middle layers that do not add leverage?
- Are comments useful and current, or are they narrating obvious code?
- Are errors observable and actionable?
- Does the change preserve ownership boundaries and dependency direction?
- Does it introduce dependency, configuration, state, or global behavior without need?
- Are security, privacy, auth, billing, or data-retention implications present?

## Verification Axis

- Are changed behaviors tested at the right seam?
- Did relevant typecheck, lint, build, and smoke checks run?
- Is there a clear verification gap if something could not run?
- Was a likely regression mode tested or manually checked?
- For migrations or data changes, is rollback/compatibility verified or documented?

## Maintainability Axis

- Can a future maintainer locate the owning module quickly?
- Can the common path be understood without reading every caller?
- Would a likely next change be local or scattered?
- Is the interface deeper after the change, or did it become a shallow pass-through?
- Are temporary workarounds named with a removal condition?

## Review Output

Lead with findings ordered by severity. Include file/line when possible.

Separate:

- violates Intent/验收
- violates engineering 规范
- OCR defect (tool finding)

Note whether review used OCR / delegate / agent-only, and which 规范/KB/spec informed it.

Severity:

- P0: broken, unsafe, data-loss, security, or cannot ship.
- P1: likely production bug, serious regression, or major maintainability issue.
- P2: should fix before merge if practical.
- P3: cleanup, clarity, or follow-up.

## Sync rule

Keep this checklist aligned with skill `references/review.md` when review policy or OCR wiring changes.
