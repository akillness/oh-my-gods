# Cleanup Plan: run 29 (`omg` packaging)

## Goal

Advance the recurring loop onto the next bounded workflow-critical target now
that `vibe-kanban` is merged. Package `omg` for the next PR review by adding
the missing standards support artifacts without reopening older merged lanes or
starting a premature mutation loop.

## Behavior lock

- Keep the slice limited to `.god-skills/omg/*` plus the recurring survey lock
  files; do not reopen `vibe-kanban`, `agentation`, `ohmg`, or older merged
  lanes.
- Do not change OMG runtime scripts in this run unless a supporting reference is
  missing or the skill entrypoint points at a nonexistent file.
- Do not start a `skill-autoresearch` mutation loop for `omg` in this run; add
  the eval baseline first, then let the next run decide whether a scored loop is
  justified.

## Planned edits

1. Refresh the survey lock from current landscape and GitHub state so the repo
   records that PR `#23` is merged and `omg` is now the next bounded target.
2. Add the missing `omg` support artifacts: `evals/evals.json` plus the
   referenced reliability note for the `exit 32` manual-approval fallback.
3. Re-run the repo validator and the `skill-standardization` validator for
   `.god-skills/omg/`.
4. Open the bounded PR path for this branch once the diff stays limited to
   `.god-skills/omg/*` and the survey lock files.

## Verification

- Run the repo validator and the `skill-standardization` validator on
  `.god-skills/omg/`.
- Validate the new `evals/evals.json` as parseable JSON.
- Confirm the branch diff stays bounded to `.god-skills/omg/*` plus the survey
  lock files before opening the PR.
