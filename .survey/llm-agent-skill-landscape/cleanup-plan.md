# Cleanup Plan: `testing-strategies` packaging lane

## Goal

Prepare the next bounded lane after `workflow-automation` closes by
standardizing `testing-strategies`. Keep the work focused on packaging and
boundary repair: tighten the trigger wording, add concise reference files, add
eval coverage, and decide whether `skill-autoresearch` is still unnecessary
after that package exists.

## Behavior lock

- Keep the next run focused on `testing-strategies` only.
- Do not reopen already-merged unrelated lanes.
- Keep the support package decision explicit:
  - `assets`: no
  - `scripts`: no
  - `references`: yes, add focused test-layer and release-readiness guidance
  - `evals`: yes, add trigger, route-out, and validation-policy checks
- Do not start a `skill-autoresearch` mutation loop until the packaged lane
  still shows measured failures.

## Planned checks

1. Re-read `testing-strategies` for generic or catch-all wording.
2. Add only the references and evals needed to make the skill measurable.
3. Re-run repo validation with the repo-local validator.
4. Open a narrow PR for the packaged `testing-strategies` lane.

## Verification

- `python3 validate_frontmatter.py`
- `git diff --stat main...HEAD`
- `gh pr create --fill`
