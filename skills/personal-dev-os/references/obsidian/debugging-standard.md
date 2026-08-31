<!-- GENERATED FILE. Source of truth:
     ~/Agent Engineering OS/20-Checklists/debugging-standard.md
     SHA256: 466919631cc427c2b7e5366a8b80497c7bba1b08739b5593a902d2205369406e -->

# Debugging Standard

## Feedback Loop First

For hard bugs, the first objective is a tight red/green signal for the exact symptom.

Acceptable loops include:

- Failing test at the correct seam.
- HTTP/curl script against a dev server.
- CLI fixture with expected output.
- Playwright/Puppeteer script for UI bugs.
- Captured request, event, trace, or log replay.
- Minimal harness that exercises the failing path.
- Fuzz, stress, differential, or bisection loop when needed.

## Loop Quality

The loop should be:

- Red-capable: catches this specific bug.
- Deterministic or high-reproduction-rate for flaky bugs.
- Fast enough to run repeatedly.
- Agent-runnable without manual interpretation.

## Diagnosis Process

1. Build the loop.
2. Reproduce the user's exact symptom.
3. Minimize the scenario until every remaining element matters.
4. Generate 3-5 falsifiable hypotheses.
5. Instrument one variable at a time.
6. Fix with a regression test at the correct seam.
7. Remove temporary instrumentation and record the root cause.

## Guardrail

Do not jump from reading code to a single favorite hypothesis before a red-capable loop exists, unless explicitly documenting why no loop can be built.
