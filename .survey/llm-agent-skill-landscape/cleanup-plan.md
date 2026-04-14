# Cleanup Plan: run 40 PR-review gate (`database-schema-design`)

## Goal

Re-review the already-open `database-schema-design` PR for duplicate work,
missing improvements, or standardization gaps, then merge it if the lane stays
clean.

## Behavior lock

- Keep this lane limited to `.god-skills/database-schema-design/*` plus the
  recurring survey lock files.
- Prefer deletion and extraction over adding new abstraction layers or runtime
  scripts.
- Do not add assets unless a concrete schema template is required; this pass is
  expected to need references and evals only.
- Do not reopen `authentication-setup`, `genkit`, or older merged lanes in this
  branch.
- Do not start a `skill-autoresearch` mutation loop for
  `database-schema-design` in this run; the compact entrypoint and packaged
  eval baseline already exist, and this pass is only for explicit review plus
  lifecycle advancement.

## Planned edits

1. Refresh GitHub state for PR `#29` and confirm the lane is still merge-clean.
2. Re-review only `.god-skills/database-schema-design/*` for duplicated work,
   missing support surfaces, or spec regressions.
3. Re-run the target validator, JSON parse check, and repo-wide validator.
4. If the review stays clean, update the survey lock files to record the merge
   stage and merge the PR without adding fresh skill churn.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/database-schema-design`
- Validate `.god-skills/database-schema-design/evals/evals.json` as parseable
  JSON
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the branch stays bounded to `database-schema-design` plus the survey
  lock files
- Record the branch, PR number, blocker, next owner, and stage before merge
