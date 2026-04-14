# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- Repo-wide validator snapshot on this run: `80/80` shipped skills pass the
  current frontmatter validator with `0` errors; warning count is now `78`.
- Eval coverage rises to `22/80` shipped skills after adding
  `.god-skills/ralph/evals/evals.json`.
- `plannotator` is already merged on `origin/main` via PR `#25`, so that lane
  stays closed in this run.
- `ralph` moved from a three-warning packaging backlog item to a
  standards-clean PR-open slice by adding evals and the missing standard
  sections while keeping the bundled scripts and references unchanged.
- No open PR existed before this run, and PR `#26` now carries the bounded
  `ralph` lane for the next review pass.

## Locked direction

Improve one workflow-critical skill per run, in priority order:

1. `ralph` post-open review on PR `#26`
2. packaging refresh across the large non-eval backlog after `ralph` resolves
3. `ohmg` follow-up only if a new measured mutation can beat the kept
   experiment state
4. other script-heavy or workflow-critical skills only after the above queue
   changes

This order is locked because:

- `ralph` already had packaged references and scripts, so adding eval coverage
  and standard sections produced a bounded reviewable slice with low scope
  risk.
- `skill-autoresearch` is not justified yet for `ralph`; the stronger next move
  was to land the eval baseline before scoring mutations.
- The broader long-skill backlog now matters more than re-opening `ohmg`, but
  that backlog should wait until the active `ralph` review lane is resolved.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `ralph` | High | No | No | Existing scripts are already enough | Existing references are already enough | Added on this branch | Review PR `#26` next run and merge if clean |
| `ohmg` | High | Later | No | Existing capture and scoring scripts are already enough | Existing baseline note is enough | Already present | Keep frozen until a stronger mutation target or harness change exists |
| `skill-standardization` | Medium | No | No | Existing validator script is already enough | No | Already present | Keep as an audit surface, not an edit target |
| `skill-autoresearch` | Medium | No | No | No | Existing reference guide is already enough | Already present | Keep as the decision gate for when a scored loop is worth starting |

## Packaging decision for this run

- Target skill: `ralph`
- Assets: no new assets needed
- Scripts: no new runtime scripts needed
- References: no further references needed in this run; the existing bundled
  command and platform guides already cover the deep setup material
- Evals: added in this run because `ralph` had no packaged eval coverage
- Sections: added the missing `Instructions`, `Examples`, and `Best practices`
  sections so the entrypoint now passes the targeted standards check
- Post-open state: PR `#26` is now open and ready for the next scheduled review
  gate

## Current state

- State: PR `#26` is open for the bounded `ralph` packaging slice on
  `chore/skill-loop-pr-open-20260414-r27`
- Blocker: no hard blocker remains for the slice itself; the only deferred work
  is the next-run PR review pass and any feedback that appears there
- Next owner: `nanoclaw_pd` to perform the PR-review gate on the next run, then
  `nanoclaw_engine` only if a concrete follow-up patch is required
- Stage: `PR-open`
