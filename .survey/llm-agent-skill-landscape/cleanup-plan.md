# Cleanup Plan: run 44 PR-review gate (`prompt-repetition`)

## Goal

Re-review the already-open `prompt-repetition` PR for duplicate work, missing
improvements, or standardization gaps, then merge it if the lane stays clean.

## Behavior lock

- Keep this lane limited to `.god-skills/prompt-repetition/*` plus the
  recurring survey lock files.
- Prefer extraction and deletion over adding new abstraction layers.
- Do not add assets unless a concrete reusable template becomes necessary; this
  pass should stay at lifecycle advancement only.
- Do not reopen already-merged lanes such as `genkit` or
  `database-schema-design`.
- Do not start a `skill-autoresearch` mutation loop for `prompt-repetition` in
  this run; the compact entrypoint and packaged eval baseline already exist,
  and this pass is only for explicit review plus lifecycle advancement.

## Planned edits

1. Refresh GitHub state for PR `#31` and confirm the lane is still merge-clean.
2. Re-review only `.god-skills/prompt-repetition/*` for duplicated work,
   missing support surfaces, or spec regressions.
3. Re-run the target validator, JSON parse check, Python compile check, and
   repo-wide validator.
4. If the review stays clean, update the survey lock files to record the merge
   stage and merge the PR without adding fresh skill churn.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/prompt-repetition`
- Validate `.god-skills/prompt-repetition/evals/evals.json` as parseable JSON
- Run `python3 -m py_compile .god-skills/prompt-repetition/scripts/prompt_repetition_transformer.py`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the branch stays bounded to `prompt-repetition` plus the survey lock
  files
- Record the branch, blocker, next owner, and stage before merge
