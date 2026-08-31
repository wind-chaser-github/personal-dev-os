<!-- GENERATED FILE. Source of truth:
     ~/Agent Engineering OS/20-Checklists/reliability-and-operations.md
     SHA256: 03799cb1c0e901b85ed6498281ff4a31b9ae4db86e0e9377360e1ba98f68d91a -->

# Reliability And Operations

Use for production services, jobs, external dependencies, queues, streaming, data processing, and user-critical workflows.

## Reliability contract

- [ ] Define the user-facing SLI and target SLO for the critical path.
- [ ] Define timeout, retry/backoff, rate limit, circuit breaking, deduplication, and degradation behavior.
- [ ] Identify capacity limits, queue growth behavior, saturation signals, and cost guardrails.
- [ ] Define health checks that distinguish process health from dependency and user-path health.

## Observability

- [ ] Logs are structured, actionable, correlated, and redacted.
- [ ] Metrics cover request volume, errors, latency percentiles, saturation, queue depth, and dependency failures.
- [ ] Traces or correlation IDs cross important service boundaries.
- [ ] Alerts are symptom-based, actionable, owned, and linked to a runbook.

## Incident readiness

- [ ] Define rollback, kill switch, feature flag, or degraded mode for risky changes.
- [ ] Define who is notified, what evidence to collect, and how to communicate impact.
- [ ] After incidents, record timeline, impact, root/contributing causes, corrective actions, and follow-up owners.
