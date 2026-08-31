# Release Checklist

Use this before publishing the repository or pushing a new version.

1. Run `rg` for secrets and personal-only paths.
2. Run `skills personal-dev-os check` with `PERSONAL_DEV_OS_VAULT` and `PERSONAL_DEV_OS_SKILL` pointed at this checkout.
3. Confirm `.gitignore` excludes local Obsidian workspace state and temporary files.
4. Review `git status --short` and commit only the intended vault, skill, docs, and adapter files.
5. Push to GitHub.
