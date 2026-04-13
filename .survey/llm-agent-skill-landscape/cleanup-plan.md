# Cleanup Plan: run 18 (`omc`)

## Goal

Make `.god-skills/omc/SKILL.md` standards-clean and eval-backed without widening into runtime, docs-site, or script changes.

## Behavior lock

- Do not change OMC runtime behavior, commands, or installation paths.
- Preserve the existing Team / Autopilot / Ralph / Ultrawork positioning.
- Keep the main skill compact; do not add a new `references/`, `scripts/`, or `assets/` directory in this slice.

## Planned edits

1. Rewrite the frontmatter description to use trigger-oriented phrasing.
2. Add the missing `## Instructions`, `## Examples`, `## Best practices`, and `## References` sections.
3. Add `evals/evals.json` with realistic Claude Code / OMC prompts.
4. Refresh the recurring survey lock files with the new target decision and run status.

## Verification

- Run the validator on `.god-skills/omc/`.
- Check `evals/evals.json` for valid JSON.
- Recompute repo-wide warning counts for the survey lock update.
