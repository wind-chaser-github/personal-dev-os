# Debugging Standard

Agent operational excerpt. Human SSOT also: `~/Agent Engineering OS/20-Checklists/debugging-standard.md`. Keep aligned when the standard changes.

## Rule

For hard or uncertain bugs, build a tight red/green feedback loop for the exact symptom before committing to a fix.

Valid loops: failing tests, curl/HTTP scripts, CLI fixtures, browser scripts, captured traces/log replay, minimal harnesses, fuzz/stress/differential/bisection.

Loop quality: red-capable for this symptom, deterministic or high-reproduction-rate, fast enough to repeat, and agent-runnable without manual interpretation.

## Process

1. Reproduce the exact symptom.
2. Minimize the scenario.
3. Generate 3–5 falsifiable hypotheses.
4. Instrument one variable at a time.
5. Fix with a regression test at the correct seam.
6. Remove instrumentation; capture root cause when reusable.

Guardrail: do not jump from reading code to one favorite hypothesis before a red-capable loop exists, unless explicitly documenting why no loop can be built.
