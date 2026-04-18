# Cleanup Plan: standardize `presentation-builder`

## Goal

Take the next bounded post-merge lane on `presentation-builder` from survey
into standards cleanup. Keep the scope limited to spec compliance,
discoverability, and optimization readiness so the run can cleanly decide
whether the branch should move to PR-open.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/presentation-builder/*`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, `opencontext`, `bmad`, `bmad-idea`, `langchain-bmad`,
  or `clawteam` lanes unless measured failures appear.
- Do not widen the run into the two-warning cluster (`design-system`,
  `frontend-design-system`, `langextract`, `marketing-automation`,
  `remotion-video-production`, `video-production`) unless a shared blocker
  appears.
- Do not add assets or scripts for `presentation-builder` unless the standards
  pass proves they are necessary.
- Do not start a `skill-autoresearch` mutation loop for `presentation-builder`
  before its standards gaps are fixed and eval coverage exists.

## Planned edits

1. Reconfirm `presentation-builder` as the top warning target after the latest
   repo-wide validation pass.
2. Standardize `.god-skills/presentation-builder/SKILL.md` around the expected
   `Instructions`, `Examples`, and `Best practices` sections.
3. Add only the missing support files justified by this target:
   `references/slides-grab-workflow.md` and `evals/evals.json`.
4. Sync `SKILL.toon` to the revised entrypoint.
5. Refresh the durable survey lock with the explicit packaging decision and
   move the lane to `pr-open` only if the validator delta is clean.

## Verification

- Re-run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
  and confirm `presentation-builder` no longer contributes warnings
- Check `git diff --stat` and `git status --short --branch` for bounded scope
- Open the PR path only after the local validation result is stable
