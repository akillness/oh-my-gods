# Cleanup Plan: run 45 packaging lane (`technical-writing`)

## Goal

Package `technical-writing` into a standards-clean, reviewable skill surface so
this run can open the next bounded PR and leave the following run to perform
the explicit PR-review pass.

## Behavior lock

- Keep this lane limited to `.god-skills/technical-writing/*` plus the
  recurring survey lock files.
- Prefer extraction and deletion over adding new abstraction layers.
- Add only support files that materially improve trigger quality or keep the
  entrypoint under control.
- Do not reopen already-merged lanes such as `prompt-repetition`, `genkit`, or
  `database-schema-design`.
- Do not start a `skill-autoresearch` mutation loop for `technical-writing` in
  this run; first establish a compact entrypoint and packaged eval baseline.

## Packaging decisions

- Assets: no; the skill needs guidance and templates, not binary assets
- Scripts: no; the lane does not yet justify a deterministic scaffold helper
- References: yes; move bulky document templates and review guidance out of the
  activation surface
- Evals: yes; add representative prompts so future review or mutation work has
  a baseline

## Planned edits

1. Refresh GitHub and validator state after the merged `prompt-repetition`
   cycle so the lock files match current reality.
2. Rewrite `.god-skills/technical-writing/SKILL.md` into a compact entrypoint
   focused on audience, document lane selection, and scope boundaries.
3. Add only the justified support files:
   `references/document-templates.md`,
   `references/review-checklists.md`, and `evals/evals.json`.
4. Update `SKILL.toon` so the packaged support surface stays discoverable.
5. Re-run target validation plus repo-wide validation, then record the lane as
   `PR-open` with the next owner set to the review pass.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/technical-writing`
- Validate `.god-skills/technical-writing/evals/evals.json` as parseable JSON
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the branch stays bounded to `technical-writing` plus the survey lock
  files
- Record current state, blocker, next owner, and stage before opening the PR
