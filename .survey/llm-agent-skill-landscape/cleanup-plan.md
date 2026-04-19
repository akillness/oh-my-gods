# Cleanup Plan: review `workflow-automation` before merge

## Goal

Keep the recurring loop aligned with the highest-value open lane by running one
bounded review pass on the open `workflow-automation` PR, confirming the new
repo-scoped packaging is standards-clean, and moving the lane from `pr-open`
to `merge` if no duplicate work or missing support surfaces remain.

## Behavior lock

- Keep this run focused on the already-open `workflow-automation` lane.
- Do not reopen already-merged lanes unless a shared blocker appears.
- Keep the support package decision unchanged unless review evidence says
  otherwise:
  - `assets`: no
  - `scripts`: no
  - `references`: keep the added runner-selection and local-CI parity guides
  - `evals`: keep the added trigger and boundary checks
- Do not start a `skill-autoresearch` mutation loop in this run unless the
  review finds measured failures against the new eval-backed package.

## Planned checks

1. Re-read the skill, references, and evals for duplicate or missing guidance.
2. Re-run repo validation with the repo-local validator.
3. Confirm the PR is still bounded to the active lane and is mergeable.
4. If the review is clean, refresh the survey lock files so the lane is
   recorded as merge-ready.

## Verification

- `python3 validate_frontmatter.py`
- `git diff --stat main...HEAD`
- `gh pr view 58 --json number,state,headRefName,baseRefName,isDraft,mergeable,url`
- `gh pr diff 58 --name-only`
