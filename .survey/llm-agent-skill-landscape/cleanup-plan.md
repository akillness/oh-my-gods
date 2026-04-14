# Cleanup Plan: run 28 merge gate (`vibe-kanban`)

## Goal

Finish the bounded `vibe-kanban` packaging slice by re-reviewing PR `#23`,
confirming no duplicate work or standards gaps remain, then merge it and leave
the next packaging lane to `omg`.

## Behavior lock

- Do not change runtime scripts unless the skill entrypoint is currently
  pointing at the wrong script name or tool surface.
- Keep the slice limited to `.god-skills/vibe-kanban/*` plus the recurring
  survey lock files; do not reopen `agentation`, `ohmg`, or older merged lanes.
- Do not start a `skill-autoresearch` mutation loop for `vibe-kanban` in this
  run; first land the measured baseline by merging the standards-clean packaging
  and evals slice.

## Planned edits

1. Refresh the survey lock from live ecosystem and GitHub state so the loop
   records the post-open review outcome instead of the older `PR-open` state.
2. Re-run the repo validator and the `skill-standardization` validator for
   `.god-skills/vibe-kanban/`.
3. Confirm PR `#23` still has no review comments and the diff stays limited to
   `vibe-kanban` plus the survey lock files.
4. Merge PR `#23` if the review remains clean.

## Verification

- Run the repo validator and the `skill-standardization` validator on
  `.god-skills/vibe-kanban/`.
- Confirm the branch diff stays bounded to `vibe-kanban` plus the survey lock
  files before merging the PR.
- Confirm PR `#23` is still mergeable and has no review objections.
