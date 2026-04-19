# Platform Map

This survey normalizes the current ecosystem signal into `settings`, `rules`,
and `hooks`.

## Settings

- Keep `SKILL.md` compact enough to remain triggerable and readable at
  activation time.
- Treat `references/` and `evals/` as the first support surfaces for this lane.
- Do not add `scripts/` or `assets/` until deterministic workflow gaps justify
  them.

## Rules

- Preserve behavior; do not let refactoring become redesign by accident.
- Add explicit route-outs to `code-review`, `debugging`, `testing-strategies`,
  `backend-testing`, and `performance-optimization`.
- Add eval coverage before considering `skill-autoresearch`.
- Keep the branch bounded to the `code-refactoring` package and loop-state
  artifacts.

## Hooks

- Run repo validation after packaging changes
- Open the PR path as soon as the bounded package is validator-clean
- Use the next scheduled run for PR-review, duplicate-work detection, and
  standardization follow-up

## Recommendation For This Repo

- Stage: move from `survey` to `improvement`
- Target: `.god-skills/code-refactoring`
- Required support files this run: `references/`, `evals/`, refreshed `SKILL.toon`
- Not required this run: `scripts/`, `assets/`, `skill-autoresearch`
