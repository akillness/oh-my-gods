# Cleanup Plan: run 31 standardization gate (`plannotator`)

## Goal

Finish the next bounded packaging slice by making `plannotator` standards-clean
enough for a PR-open lane: compact the SKILL entrypoint, add the missing evals,
bundle the support references that should not live inline, and avoid unrelated
skill churn.

## Behavior lock

- Do not change runtime scripts unless the current documentation points to the
  wrong script surface.
- Keep the lane limited to `.god-skills/plannotator/*` plus the recurring
  survey state files.
- Do not start a `skill-autoresearch` mutation loop for `plannotator` in this
  run; packaging and trigger-quality cleanup is still the higher-leverage move.
- Use the new evals as the regression lock for response shape and known
  limitations.

## Planned edits

1. Refresh the survey lock from current official docs and the merged repo state
   so the next target is `plannotator`, not the already-landed `omg` slice.
2. Re-run the repo validator and the `skill-standardization` validator for
   `.god-skills/plannotator/`.
3. Reduce the SKILL entrypoint to a compact standards-oriented surface with
   explicit `Instructions`, `Examples`, and `Best practices`.
4. Add bundled reference docs for platform setup and notes/troubleshooting.
5. Open the PR path once the diff stays bounded and the validator output is
   acceptable.

## Verification

- Run the repo validator and the `skill-standardization` validator on
  `.god-skills/plannotator/`.
- Validate `plannotator/evals/evals.json` as parseable JSON.
- Confirm the branch diff stays bounded to `.god-skills/plannotator/*` plus the
  survey lock files before opening the PR.
- Confirm the branch is not reopening already-merged `omg` or `vibe-kanban`
  work.
