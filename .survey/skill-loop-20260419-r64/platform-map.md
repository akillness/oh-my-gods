# Platform Map

This survey normalizes the current ecosystem signal into `settings`, `rules`,
and `hooks`.

## Settings

- Keep `SKILL.md` compact enough to stay triggerable at activation time.
- Treat `references/` and `evals/` as the first support surfaces for this lane.
- Do not add `scripts/` or `assets/` until deterministic workflow gaps justify
  them.

## Rules

- Keep `api-design` contract-first; do not let it become docs publishing or
  backend implementation.
- Add explicit route-outs to `api-documentation`,
  `authentication-setup`, `backend-testing`, and
  `database-schema-design`.
- Add eval coverage before considering `skill-autoresearch`.
- Keep the branch bounded to the `api-design` package and loop-state artifacts.

## Hooks

- Run repo validation after packaging changes.
- Open the PR path as soon as the bounded package is validator-clean.
- Use the next scheduled run for PR review, duplicate-work detection, and
  follow-up standardization gaps.

## Recommendation For This Repo

- Stage: move from `survey` to `improvement`, then `pr-open` in the same run if
  validation stays clean
- Target: `.god-skills/api-design`
- Required support files this run: `references/`, `evals/`, refreshed
  `SKILL.toon`
- Not required this run: `scripts/`, `assets/`, `skill-autoresearch`
