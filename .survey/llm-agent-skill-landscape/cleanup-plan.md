# Cleanup Plan: active packaging pass (`responsive-design`)

## Goal

Keep this run bounded to a survey refresh plus the `responsive-design`
packaging surface now that PR `#37` for `git-workflow` has merged, then stop
at the next PR-open checkpoint for scheduled review work.

## Behavior lock

- Keep this run limited to
  `.survey/llm-agent-skill-landscape/*` plus
  `.god-skills/responsive-design/*`.
- Do not reopen the merged `git-workflow`, `codebase-search`,
  `ui-component-patterns`, `state-management`, `deployment-automation`,
  `technical-writing`, `prompt-repetition`, `genkit`, or
  `database-schema-design` lanes.
- Do not widen this run into a repo-wide warning cleanup pass.
- Do not add scripts or assets unless the packaging pass proves a reusable
  deterministic helper or bundled template is required.

## Packaging decisions

- `responsive-design`
  - Assets: no; the current gap is instructional structure, not bundled media
    or templates
  - Scripts: no; the repo already has a validator and this skill does not yet
    justify a reusable checker
  - References: yes; split dense layout, media, and testing guidance into
    focused files so the entrypoint stays below the 500-line guideline
  - Evals: yes; add representative prompts so later `skill-autoresearch`
    decisions can use measured failures instead of prose-only review
- `skill-autoresearch`
  - Keep at triage only in this run
  - Do not start a mutation loop until `responsive-design` is compact,
    eval-backed, and either failing measured checks or attracting review
    feedback

## Planned edits

1. Refresh the survey lock and direction files to mark `responsive-design` as
   the active packaging lane after the merged `git-workflow` PR.
2. Replace the oversized `responsive-design` monolith with a compact
   entrypoint that focuses on triage, layout decisions, and verification.
3. Add focused `references/` files for layout strategy, media and typography,
   and browser verification/common failure modes.
4. Add `evals/evals.json` for the highest-value responsive-layout scenarios.
5. Validate the target skill and the full skill inventory.
6. Register the next PR lane once the bounded change set is ready, then leave
   the repo in explicit `pr-open` state for the next scheduled review run.

## Verification

- Confirm PR `#37` is merged and there is no newer open lane ahead of
  `responsive-design`
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/responsive-design`
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the diff stays bounded to the `responsive-design` skill package plus
  survey lock files
- Record current state, blocker, next owner, and stage for the next scheduled
  improvement run
