# Open Code Review Adapter

Installed for Personal Dev OS Review deepening.

| Piece | Location |
| --- | --- |
| CLI | `ocr` via `npm i -g @alibaba-group/open-code-review` (`~/.npm-global/bin/ocr`) |
| Upstream checkout | `~/.local/share/open-code-review` |
| Cursor plugin | `~/.cursor/plugins/local/open-code-review/` |
| Skills (symlinked) | `open-code-review`, `open-code-review-delegate` under each IDE `skills/` |

## How Dev OS uses it

- Norms + Intent/Spec Page: always Dev OS first (`personal-dev-os` Review).
- Diff/PR defects: run `ocr review` (or skill). Pass Intent/spec summary with `--background`.
- No OCR API key yet: use `ocr delegate` / `open-code-review-delegate` so the coding agent reviews with OCR’s file+rule packing.
- Impact graph: keep using **codegraph**, not code-review-graph, unless you later choose otherwise.

## Codex notes

Your interactive Codex usually comes from **ChatGPT.app**, not Homebrew. Homebrew’s `/opt/homebrew/bin/codex` may be a broken stub.

Working CLI (after fix):

```bash
# ~/bin/codex → ChatGPT.app bundled binary
codex --version   # expect codex-cli from ChatGPT Resources

# Marketplace + plugin (already done if ensure ran)
codex plugin marketplace add alibaba/open-code-review
codex plugin add open-code-review-codex@open-code-review
```

In Codex UI you can also just ask to use the `open-code-review` skill (already under `~/.codex/skills/`).

```bash
ocr config provider
ocr config model
ocr llm test
```

Skip if you only use delegation mode.

## Repair skill links

```bash
PLUGIN="$HOME/.local/share/open-code-review/plugins/open-code-review"
for root in ~/.cursor/skills ~/.codex/skills ~/.claude/skills ~/.gemini/skills ~/.agent/skills ~/.config/opencode/skills; do
  ln -sfn "$PLUGIN/skills/open-code-review" "$root/open-code-review"
  ln -sfn "$PLUGIN/skills/open-code-review-delegate" "$root/open-code-review-delegate"
done
```
