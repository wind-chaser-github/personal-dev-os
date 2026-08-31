# Time And Timezone

Use for backend code, APIs, databases, schedulers, reports, frontend display, and cross-region behavior.

## Rules

- [ ] Store, compare, calculate, and generate instants in UTC.
- [ ] APIs use ISO 8601 timestamps with an explicit offset; use UTC `Z` by default.
- [ ] Frontends display instants using the user's configured IANA timezone, not the server or browser default as business logic.
- [ ] Distinguish an instant from a calendar date, local time, and duration. Birthdays, billing dates, and holidays must not be silently converted into timestamps.
- [ ] Use IANA timezone identifiers such as `Asia/Shanghai` and `America/Los_Angeles`; do not use ambiguous abbreviations such as `CST`.
- [ ] Test UTC, positive and negative offsets, cross-midnight conversion, leap days, and daylight-saving transitions when relevant.
- [ ] Document the timezone used by scheduled jobs, reports, and date-range filters.

## Validation

- [ ] Database, API, and UI values represent the same instant.
- [ ] Date-only behavior is tested separately from timestamp behavior.
- [ ] No business logic depends on the machine's local timezone.
