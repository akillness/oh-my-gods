# Cleanup Plan: `code-refactoring` packaging lane

## Goal

Advance the recurring improvement loop after `security-best-practices` closes
by standardizing `code-refactoring`. Keep the work focused on packaging and
boundary repair: tighten the trigger wording, add concise reference files, add
eval coverage, and decide whether `skill-autoresearch` is still unnecessary
after that package exists.

## Behavior lock

- Keep the next run focused on `code-refactoring` only.
- Do not reopen already-merged unrelated lanes.
- Keep the support package decision explicit:
  - `assets`: no
  - `scripts`: no
  - `references`: yes, add focused cleanup-plan and behavior-lock guidance
  - `evals`: yes, add trigger, route-out, and behavior-preservation review
    checks
- Do not start a `skill-autoresearch` mutation loop until the packaged lane
  still shows measured failures.

## Planned checks

1. Re-read `code-refactoring` for generic or catch-all wording.
2. Add only the references and evals needed to make the skill measurable.
3. Re-run repo validation with the repo-local validator.
4. Open a narrow PR for the packaged `code-refactoring` lane.

## Verification

- `python3 validate_frontmatter.py`
- `git diff --stat origin/main...HEAD`
- `gh pr create --fill`
