# Cleanup Plan: run 24 review (`playwriter`)

## Goal

Review the bounded `playwriter` PR slice for duplicate work or missed standards gaps, apply only the smallest trigger-quality fix if it is still justified, and then move the branch onto the merge path.

## Behavior lock

- Do not change `playwriter`'s core contract around the running Chrome session, preserved cookies and logins, `localhost:19988`, or the `Observe -> Act -> Observe` loop.
- Keep the slice limited to review cleanup and lock-state updates: no new runtime scripts, assets, eval prompts, or support references in this run.
- Preserve the distinction between `playwriter` and `agent-browser`: live authenticated browser control vs isolated headless automation.
- Do not open a skill-autoresearch mutation loop for `playwriter`; this run only decides whether the PR is clean enough to advance toward merge.

## Planned edits

1. Re-review draft PR `#19` against `main` for duplicate work, missing structure, or weak trigger phrasing.
2. Tighten only the `playwriter` frontmatter description if the review still finds a trigger-quality gap.
3. Refresh the recurring survey lock so the next run knows whether `playwriter` is still in review or has advanced to `merge`.

## Verification

- Run the validator on `.god-skills/playwriter/`.
- Recompute the repo-wide standards counts after the edit.
- Review the diff to confirm the slice stays bounded to `playwriter` plus loop-state files before advancing the PR state.
