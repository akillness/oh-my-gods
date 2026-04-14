# Cleanup Plan: run 32 merge gate (`plannotator`)

## Goal

Finish the bounded `plannotator` packaging slice by re-reviewing PR `#25`,
confirming no duplicate work or standards gaps remain, then merge it and leave
the next packaging lane to `ralph`.

## Behavior lock

- Do not change runtime scripts unless the skill entrypoint is currently
  pointing at the wrong script name or tool surface.
- Keep the follow-up diff limited to recurring survey state files; do not
  reopen `plannotator`, `ohmg`, `omg`, `vibe-kanban`, or older merged lanes.
- Do not start a `skill-autoresearch` mutation loop for `plannotator` in this
  run; first land the standards-clean packaging and eval baseline by merging
  PR `#25`.

## Planned edits

1. Refresh the survey lock from current official docs and GitHub state so the
   repo records the post-open review outcome instead of the older `pr-open`
   state.
2. Re-run the repo validator and the `skill-standardization` validator for
   `.god-skills/plannotator/`.
3. Confirm PR `#25` still has no review objections and the branch stays bounded
   to `plannotator` plus the survey lock files.
4. Merge PR `#25` if the review remains clean.

## Verification

- Run the repo validator and the `skill-standardization` validator on
  `.god-skills/plannotator/`.
- Validate `plannotator/evals/evals.json` as parseable JSON.
- Confirm the branch diff stays bounded to `.god-skills/plannotator/*` plus the
  survey lock files before merging the PR.
- Confirm PR `#25` is still mergeable and has no review objections.
