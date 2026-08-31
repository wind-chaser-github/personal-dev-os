<!-- GENERATED FILE. Source of truth:
     ~/Agent Engineering OS/20-Checklists/security-baseline.md
     SHA256: 60fe5346adc5a4d814360429ff7296ddc2cdcd61a15cffd5dee2656a00551089 -->

# Security Baseline

Use for web APIs, admin tools, mobile backends, external integrations, authentication, authorization, sensitive data, and production-facing changes.

## Requirements and design

- [ ] Identify assets, actors, trust boundaries, abuse cases, and security-sensitive assumptions.
- [ ] Define authentication, authorization, tenant isolation, and object-level access checks.
- [ ] Classify sensitive data, retention, deletion, export, audit, and redaction requirements.
- [ ] Validate untrusted input at the boundary and encode output for its destination.
- [ ] Define rate limits, replay/idempotency protection, and abuse controls when relevant.

## Implementation and supply chain

- [ ] Secrets are supplied through a secret manager or private environment, never committed or logged.
- [ ] Dependencies and build artifacts are reviewed for provenance and known vulnerabilities.
- [ ] Security-sensitive errors do not leak credentials, tokens, PII, or internal topology.
- [ ] Security events are auditable without logging sensitive payloads.

## Verification

- [ ] Test unauthorized, cross-tenant, invalid-input, replay, expiry, and privilege-escalation paths.
- [ ] Choose an appropriate OWASP ASVS verification level for web applications.
- [ ] Record security exceptions, owner, expiry, and compensating control.
