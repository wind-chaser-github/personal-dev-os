# Time And Timezone

Read for backend, API, database, scheduler, report, or frontend time behavior.

- Store, compare, calculate, and generate instants in UTC.
- Use ISO 8601 with an explicit offset in APIs; use UTC `Z` by default.
- Display instants in the user's IANA timezone; never use server/browser local timezone as business logic.
- Distinguish instants, calendar dates, local times, and durations.
- Test offset changes, cross-midnight behavior, leap days, and daylight-saving transitions when relevant.
- Document the timezone of jobs, reports, and date-range filters.
