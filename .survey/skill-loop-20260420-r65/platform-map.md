# Platform Map

This survey normalizes the current ecosystem signal into `settings`, `rules`,
and `hooks`.

## Settings

- Keep skill entrypoints compact and portable for hosts that now support skill
  discovery and installation directly.
- Prefer `references/` and `evals/` as the first added support surfaces for
  remaining legacy lanes.
- Do not add `scripts/` or `assets/` unless the target workflow has a concrete,
  repeatable execution gap.

## Rules

- Treat the current `api-design` PR as merge-ready unless review evidence
  appears.
- Keep already-merged lanes closed.
- Queue `git-submodule` as the next candidate because the repo evidence shows a
  large skill with no `references/` and no `evals/`.
- Keep `skill-autoresearch` deferred until a packaged lane still misses
  objective checks.

## Hooks

- Re-run repo validation before merge.
- Check PR review state and duplicate-work risk before merging.
- On the next cycle after merge, start with the `git-submodule` packaging lane
  unless a newer measured failure outranks it.

## Recommendation For This Repo

- Stage now: move from `pr-open` to `merge`
- Active target: `.god-skills/api-design`
- Next queued target after merge: `.god-skills/git-submodule`
- Required support files on the next lane: likely `references/` and `evals/`
- Not justified yet: `assets/`, `scripts/`, `skill-autoresearch`
