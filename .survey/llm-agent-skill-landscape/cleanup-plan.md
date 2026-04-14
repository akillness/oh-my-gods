# Cleanup Plan: run 30 merge gate (`omg`)

## Goal

Finish the bounded `omg` packaging slice by re-reviewing PR `#24`, confirming
no duplicate work or standards gaps remain, then merge it and leave the next
packaging lane to `plannotator`.

## Behavior lock

- Do not change runtime scripts unless the skill entrypoint is currently
  pointing at the wrong script name or tool surface.
- Keep the follow-up diff limited to recurring survey state files; do not
  reopen `plannotator`, `ohmg`, `vibe-kanban`, or older merged lanes.
- Do not start a `skill-autoresearch` mutation loop for `omg` in this run;
  first land the measured baseline by merging the standards-clean packaging and
  evals slice.

## Planned edits

1. Refresh the survey lock from current official docs and GitHub state so the
   repo records the post-open review outcome instead of the older `pr-open`
   state.
2. Re-run the repo validator and the `skill-standardization` validator for
   `.god-skills/omg/`.
3. Confirm PR `#24` still has no review objections and the branch stays bounded
   to `omg` plus the survey lock files.
4. Merge PR `#24` if the review remains clean.

## Verification

- Run the repo validator and the `skill-standardization` validator on
  `.god-skills/omg/`.
- Validate `omg/evals/evals.json` as parseable JSON.
- Confirm the branch diff stays bounded to `.god-skills/omg/*` plus the survey
  lock files before merging the PR.
- Confirm PR `#24` is still mergeable and has no review objections.
