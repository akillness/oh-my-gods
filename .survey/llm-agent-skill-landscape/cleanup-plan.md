# Cleanup Plan: `git-submodule` packaging lane

## Goal

Advance the recurring improvement loop after PR `#64` merged the
`api-design` lane by standardizing `git-submodule`. Keep the work focused on
packaging and boundary repair: tighten the trigger wording, add concise
reference files, add eval coverage, open a narrow PR, and keep
`skill-autoresearch` deferred until measured failures remain after this package
is reviewed.

## Behavior lock

- Keep this run focused on `git-submodule` only.
- Do not reopen already-merged unrelated lanes.
- Keep the support package decision explicit:
  - `assets`: no
  - `scripts`: no
  - `references`: yes, add focused setup, update, removal, and CI guidance
  - `evals`: yes, add trigger, route-out, and detached-HEAD safety checks
- Do not start a `skill-autoresearch` mutation loop until the packaged lane
  still shows measured failures.

## Planned checks

1. Re-read `git-submodule` for generic or catch-all wording.
2. Keep only the references and evals needed to make the skill measurable.
3. Re-run repo validation with the repo-local validator.
4. Open the next PR path as soon as the branch is validator-clean.
5. Hand the next scheduled run to PR review once the lane is open.

## Verification

- `python3 validate_frontmatter.py`
- `git diff --stat origin/main...HEAD`
- `gh pr list --state open`

## Intended stage transition

- Survey refresh now shows PR `#64` merged cleanly, so the loop should stop
  treating `api-design` as active.
- `git-submodule` is the strongest remaining general-purpose gap because it is
  still workflow-critical and still lacks focused `references/` and `evals/`.
- This run should package `git-submodule`, open PR `#65`, and hand the next
  scheduled run to PR review for that lane unless a higher-priority measured
  failure appears first.
