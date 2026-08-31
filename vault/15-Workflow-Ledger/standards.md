# Workflow Standards

These are accepted personal workflow standards.

Only add rules here after they have survived real use or are obviously core to engineering quality.

## Current Standards

### Verify Before Done

Do not claim software work is complete without fresh verification evidence or an explicit verification gap.

### Inspect Before Editing

For code changes, inspect existing code, tests, and conventions before editing unless the task is trivial and local.

### Mandatory Always-On Baseline (Skills Alone Are Not Enough)

Skill symlinks are advisory and can be skipped in other workspaces/sessions. Non-trivial software work must also load a global always-on baseline that points at `personal-dev-os` (Cursor/Claude rules, Gemini AGENTS, Codex developer_instructions/AGENTS pointer). Evidence: feature work shipped without Intent Card, norms, or required intent/constraint comments when only skills were installed. See `90-Agent-Adapters/personal-dev-os.always-on.md` and `ensure-adapter-links.sh`.

### Intent Card Clarify-And-Impact

For non-trivial feature/design/test work: consult KB + 规范, emit an Intent Card (标准意图, ADDED/MODIFIED/REMOVED, 假设, 知识依据, 适用规范, 影响预览). Prefer yes/no with defaults (max 3/round). Complex work also persists `omx_wiki/specs/<slug>.md`. See [[20-Checklists/clarify-and-impact]].

### Review With Intent And OCR

Before findings: reload Intent/Spec + 适用规范 + impact. For non-trivial diffs/PR use Open Code Review (`ocr` or delegate). Separate Intent violations, 规范 violations, and OCR defects. See [[20-Checklists/code-review-checklist]] and [[90-Agent-Adapters/open-code-review]].

### Vault And Skill Stay In Sync

Human norms live in this Obsidian vault; agent execution lives in `~/.codex/skills/personal-dev-os/`. When a rule must stay aligned, update **both** in the same change. Soft-link IDEs to the skill — do not copy skill text into each IDE.

### Obsidian Is Personal Knowledge, Not Project Wiki

Project facts, environment notes, domain vocabulary, and repo-specific decisions belong in the current repo (`omx_wiki`, docs, ADRs, `CONTEXT.md`). This Obsidian vault is for cross-project principles, workflows, checklists, templates, and reusable lessons. When a project note becomes generally useful, summarize it into Obsidian; when an Obsidian rule should become automatic behavior, update the matching skill reference in the same change.

### Capture Workflow Delta

At the end of non-trivial software work, decide whether the task revealed a workflow improvement. If yes, add it to `15-Workflow-Ledger/candidates.md` instead of immediately turning it into a permanent rule.

### Skill Directory Symlinks Across IDEs

Canonical skill: `~/.codex/skills/personal-dev-os`. Soft-link that directory into each IDE’s skills folder. Edit the skill only — no content copies, no content-sync script. `ensure-adapter-links.sh` only repairs broken symlinks.

### Feedback Loop First For Bugs

For hard bugs, build a red-capable feedback loop for the exact symptom before committing to a hypothesis.

### Test At Seams

Prefer tests through public behavior seams. Avoid tests that verify private implementation details or internal collaborator calls.

### Separate Review Axes

Review "does it satisfy the spec?" separately from "does it meet engineering standards?" so one does not mask the other.

### Object Storage And Registry Performance

Object keys and media/file registries must plan for fan-out, filter indexes, and ops/lifecycle — not pure-flat or pure-type prefixes. Checklist: [[20-Checklists/object-storage-and-registry-performance]]; skill: `personal-dev-os/references/object-storage-and-registry.md`. Evidence: media asset registry initially proposed flat `media/{id}/`, which fails at 10⁵+ keys per prefix and ignored DB filter performance.

### Time And Timezone

Store and calculate instants in UTC, transmit explicit ISO 8601 offsets, display using the user's IANA timezone, and distinguish timestamps from calendar dates. Test cross-midnight and daylight-saving behavior when relevant. See [[20-Checklists/time-and-timezone]].

### Long-Running Requests And Streaming

Prefer durable asynchronous tasks for long work. Streaming connections need timeout coordination, heartbeat, reconnect/cursor behavior, cancellation, idempotency, graceful shutdown, and operational metrics. See [[20-Checklists/long-running-request]].

### Security Baseline

Production-facing software must identify trust boundaries, enforce authorization at the object/tenant boundary, protect secrets and sensitive data, validate untrusted input, review dependencies, and verify abuse paths according to risk. See [[20-Checklists/security-baseline]].

### Reliability And Release Readiness

Production changes should define user-facing SLI/SLO where relevant, actionable alerts, degradation, rollback, compatibility, rollout, post-release verification, and feature-flag cleanup. See [[20-Checklists/reliability-and-operations]] and [[20-Checklists/release-and-deployment]].

### Risk-Proportional Rule Strength

Use `MUST`, `SHOULD`, and `MAY` deliberately. A `MUST` rule needs a concrete correctness, security, data-loss, or operational reason; a `SHOULD` rule needs an explicit exception path; a `MAY` rule is guidance, not a gate. Active rules should state scope, owner, evidence, and review date when they can become stale. See [[10-Workflows/workflow-evolution]] and [[40-Decision-Records/personal-rule-template]].
