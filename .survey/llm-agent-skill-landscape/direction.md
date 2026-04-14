# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- Repo-wide validator snapshot on this run: `80/80` shipped skills pass the
  current frontmatter validator with `0` errors; the repo-wide
  `skill-standardization` warning count now drops to `77`.
- Eval coverage rises to `23/80` shipped skills after adding
  `.god-skills/backend-testing/evals/evals.json`.
- `ralph` is already merged on `origin/main` via PR `#26`, so that lane stays
  closed in this run.
- `backend-testing` moved from the repo's largest non-eval backlog item to a
  standards-clean PR-open slice by shrinking the entrypoint from `845` lines
  to `216`, bundling the missing reference material, and adding eval coverage
  without introducing new runtime scripts or assets.
- PR `#27` now carries the bounded `backend-testing` lane, and the post-open
  review on this run found no follow-up patch worth opening before merge.

## Locked direction

Improve one workflow-critical or high-leverage skill per run, in priority
order:

1. `backend-testing`
2. packaging refresh across the large non-eval backlog after
   `backend-testing` resolves
3. `ohmg` follow-up only if a new measured mutation can beat the kept
   experiment state
4. other script-heavy or workflow-critical skills only after the above queue
   changes

This order is locked because:

- `backend-testing` is the repo's biggest remaining skill and directly serves
  the ecosystem-wide shift toward verification-ready, eval-backed skills.
- `backend-testing` was a clean packaging-first target: the missing pieces were
  references and evals, not new runtime scripts or product logic.
- `skill-autoresearch` is not justified yet for `backend-testing`; the stronger
  move was to land the baseline packaging and eval coverage before scoring
  mutations.
- `authentication-setup`, `database-schema-design`, and `genkit` remain good
  next candidates, but they should wait until the active review lane resolves.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `backend-testing` | High | No | No | No | Added on this branch because the old entrypoint was oversized and example-heavy | Added on this branch | Merge PR `#27`, then reconsider mutation only if repeated measured failures appear |
| `authentication-setup` | High | No | No | No | Likely yes | Yes | Keep behind `backend-testing` |
| `database-schema-design` | High | No | No | No | Likely yes | Yes | Keep behind `backend-testing` |
| `genkit` | Medium | No | No | No | Likely yes | Yes | Keep behind `backend-testing` |
| `ohmg` | High | Later | No | Existing capture and scoring scripts are already enough | Existing baseline note is enough | Already present | Keep frozen until a stronger mutation target or harness change exists |

## Packaging decision for this run

- Target skill: `backend-testing`
- Assets: no new assets needed
- Scripts: no new runtime scripts needed
- References: added in this run because the entrypoint was `845` lines and the
  framework boilerplate plus failure handling did not belong in the main skill
- Evals: added in this run because `backend-testing` had no packaged eval
  coverage
- Sections: the main skill is now compact and standards-clean, and
  `SKILL.toon` was refreshed to match the new structure
- Post-open review result: clean; no follow-up patch is justified before merge

## Current state

- State: PR `#27` has passed the post-open review gate and is ready to merge
  for the bounded `backend-testing` packaging slice on
  `chore/skill-loop-pr-open-20260415-r28`
- Blocker: no hard blocker remains for the packaging slice itself; the only
  deferred work is `skill-autoresearch`, which still waits on a merged baseline
  plus repeated measured failures
- Next owner: `nanoclaw_pd` to merge PR `#27` in this run, then
  `nanoclaw_engine` for the next bounded packaging pass after merge
- Stage: `merge`
