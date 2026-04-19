# Platform Map

This survey normalizes the current ecosystem signal into `settings`, `rules`,
and `hooks`.

## Settings

- Keep skill entrypoints compact enough for discovery surfaces such as `gh skill`
  and multi-host skill catalogs.
- Add `references/` and `evals/` before considering `scripts/` or `assets/`
  for the next legacy lane.
- Treat route clarity between neighboring Git skills as part of packaging, not
  an optional polish pass.

## Rules

- Keep merged lanes closed unless review feedback or measured failures reopen
  them.
- Move the loop from `api-design` to `git-submodule`.
- Add `references/` and `evals/` to `git-submodule`; do not add `scripts/` or
  `assets/` unless a concrete execution gap appears.
- Keep `skill-autoresearch` deferred until the packaged lane still misses
  objective checks.

## Hooks

- Re-run repo validation before opening the PR path.
- Check for duplicate open PR work before pushing the new branch.
- Hand the next scheduled run to PR review once the bounded `git-submodule`
  package is opened.

## Recommendation For This Repo

- Stage now: move from `survey` to `improvement`, then `pr-open` once the new
  branch is published
- Active target: `.god-skills/git-submodule`
- Required support files: `references/` and `evals/`
- Not justified yet: `assets/`, `scripts/`, `skill-autoresearch`
