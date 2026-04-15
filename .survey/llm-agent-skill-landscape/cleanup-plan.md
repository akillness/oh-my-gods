# Cleanup Plan: run 50 improvement lane (`codebase-search`)

## Goal

Package `codebase-search` into a compact, standards-clean skill surface now
that PR `#34` for `state-management` is merged, while keeping this run limited
to one new bounded lane plus the survey lock files that record its live state.

## Behavior lock

- Keep this run limited to `.god-skills/codebase-search/*` and
  `.survey/llm-agent-skill-landscape/*`.
- Do not reopen the merged `state-management`, `deployment-automation`,
  `technical-writing`, `prompt-repetition`, `genkit`, or
  `database-schema-design` lanes.
- Do not widen scope into `ui-component-patterns`, `git-workflow`, or another
  large skill in this run.
- Do not add scripts or assets unless the packaging work proves a reusable
  deterministic helper or bundled data file is necessary.
- Add eval coverage before rewriting the main skill entrypoint so the current
  behavior is locked first.

## Packaging decisions

- `codebase-search`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
- `skill-autoresearch`
  - Keep at triage only in this run
  - Do not start a mutation loop yet because `codebase-search` is not compact
    or baseline-scored on `main`

## Planned edits

1. Add `evals/evals.json` for `codebase-search` to lock the search-strategy and
   impact-analysis expectations before cleanup.
2. Move detailed command recipes and playbooks into `references/` so the main
   `SKILL.md` becomes compact and easier to trigger.
3. Update the survey lock to reflect that PR `#34` is merged and
   `codebase-search` is the new active lane.
4. Re-run target and repo-wide validation, confirm the diff stays bounded, then
   open a fresh PR path for the new lane.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/codebase-search`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the diff stays bounded to `codebase-search` packaging plus survey
  lock files
- Open the new PR and record current state, blocker, next owner, and stage as
  `pr-open`
