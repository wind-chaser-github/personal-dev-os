# Domain Modeling Standard

## Purpose

Maintain a project language that reduces ambiguity for humans and agents.

## Context Documents

- Use `CONTEXT.md` for project/domain language, not implementation notes.
- If a repo has multiple domains, use `CONTEXT-MAP.md` to point to context-specific `CONTEXT.md` files.
- Create context files lazily when terms are actually resolved.

## Term Rules

- Pick one canonical term for each domain concept.
- List avoided synonyms when they would cause confusion.
- Keep definitions short: what the concept is, not how it is implemented.
- Exclude general programming terms unless they have project-specific meaning.
- Challenge vague or overloaded language as soon as it appears.

## ADR Rules

Create an ADR only when all are true:

- The decision is costly to reverse.
- Future readers would be surprised without the context.
- Real alternatives existed and one was chosen for a reason.

Keep ADRs short. The value is recording the decision and why it was made.
