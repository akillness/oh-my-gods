# Cleanup Plan: run 42 PR-review gate (`genkit`)

## Goal

Re-review the already-open `genkit` PR for duplicate work, missing
improvements, or standardization gaps, then merge it if the lane stays clean.

## Behavior lock

- Keep this lane limited to `.god-skills/genkit/*` plus the recurring survey
  lock files.
- Prefer deletion and extraction over adding new abstraction layers or runtime
  scripts.
- Do not add assets unless a concrete reusable template becomes necessary; this
  pass should stay at lifecycle advancement only.
- Do not reopen `database-schema-design`, `authentication-setup`, or any older
  merged lane in this branch.
- Do not start a `skill-autoresearch` mutation loop for `genkit` in this run;
  the compact entrypoint and packaged eval baseline already exist, and this
  pass is only for explicit review plus lifecycle advancement.

## Planned edits

1. Refresh GitHub state for PR `#30` and confirm the lane is still merge-clean.
2. Re-review only `.god-skills/genkit/*` for duplicated work, missing support
   surfaces, or spec regressions.
3. Re-run the target validator, JSON parse check, and repo-wide validator.
4. If the review stays clean, update the survey lock files to record the merge
   stage and merge the PR without adding fresh skill churn.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/genkit`
- Validate `.god-skills/genkit/evals/evals.json` as parseable JSON
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the branch stays bounded to `genkit` plus the survey lock files
- Record the branch, PR number, blocker, next owner, and stage before merge
