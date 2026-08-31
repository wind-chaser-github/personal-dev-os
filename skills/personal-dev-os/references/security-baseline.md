# Security Baseline

Read for web APIs, admin tools, mobile backends, external integrations, auth, permissions, sensitive data, and production-facing changes.

- Identify assets, actors, trust boundaries, abuse cases, and security assumptions.
- Define authentication, authorization, tenant isolation, object-level access, data classification, retention, deletion, export, and audit behavior.
- Validate untrusted input at boundaries and encode output for its destination.
- Define rate limits, replay/idempotency protection, and abuse controls when relevant.
- Keep secrets out of source control and logs; review dependencies and artifact provenance.
- Test unauthorized, cross-tenant, invalid-input, replay, expiry, and privilege-escalation paths.
- Choose an appropriate OWASP ASVS verification level for web applications.
