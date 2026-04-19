# Cleanup Plan: `code-refactoring` packaging lane

## Goal

Advance the recurring improvement loop after `security-best-practices` closed
by standardizing `code-refactoring`. Keep the work focused on packaging and
boundary repair: tighten the trigger wording, add concise reference files, add
eval coverage, open a narrow PR, and keep `skill-autoresearch` deferred until
measured failures remain after this package is reviewed.

## Behavior lock

- Keep the current PR-review run focused on `code-refactoring` only.
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
2. Keep only the references and evals needed to make the skill measurable.
3. Re-run repo validation with the repo-local validator.
4. Review PR `#63` for duplicate work, missing support surfaces, or stale lock state.

## Verification

- `python3 validate_frontmatter.py`
- `git diff --stat origin/main...HEAD`
- `gh pr view 63`
