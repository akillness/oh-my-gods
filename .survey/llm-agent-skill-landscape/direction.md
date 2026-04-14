# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- Repo-wide validator snapshot on this run: `80/80` skills pass the current
  frontmatter validator.
- `vibe-kanban` is already merged on `origin/main` via PR `#23`, so the loop
  should not reopen that lane.
- Eval coverage rises to `20` of `80` shipped skills after adding
  `.god-skills/omg/evals/evals.json` on this branch.
- `omg` now has the bounded packaging artifacts it was missing: eval coverage
  plus the reliability note already referenced by the entrypoint and operations
  guide.
- `plannotator` remains a real backlog item, but it is still a broader cleanup
  than the current `omg` PR-open slice.

## Locked direction

Improve one workflow-critical skill per run, in priority order:

1. `omg`
2. `plannotator`
3. `ralph`
4. `ohmg` follow-up only if a new measured mutation can beat the kept experiment state

This order is locked because it balances leverage and boundedness after the
`vibe-kanban` merge:

- `omg` is now the highest-leverage packaging target because it sits on the
  shared orchestration spine and is ready for a bounded PR review.
- `plannotator` remains valuable, but it still needs a broader cleanup pass than
  the current `omg` slice.
- `ralph` and the other script/reference-heavy skills without evals remain
  candidates, but they are less central to the shared orchestration entrypoint.
- `ohmg` stays on the later mutation lane because it already has evals and
  support artifacts; the bigger payoff is still packaging-first work elsewhere.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `omg` | High | Not yet | No | Existing scripts are already enough | Added on this branch to close the broken-link gap | Added on this branch | Review PR `#24`, merge the packaging slice, then decide on mutation only if repeated measured failures appear |
| `plannotator` | Medium | No | No | Existing scripts are already enough | No | Yes | Re-rank after `omg` |
| `ralph` | Medium | No | No | Existing scripts are already enough | Existing references are already enough | Yes | Keep behind `plannotator` unless the survey lock changes materially |
| `ohmg` | High | Later | No | Existing capture and scoring scripts are already enough | Existing baseline note is enough | Already present | Keep frozen until a stronger mutation target or harness change exists |
| `skill-standardization` | Medium | No | No | Existing validator script is already enough | No | Already present | Use as an audit surface, not an edit target, in this run |
| `skill-autoresearch` | Medium | No | No | No | Existing reference guide is already enough | Already present | Use as the decision gate for whether a scored loop is worth starting |

## Packaging decision for this run

- Target skill: `omg`
- Assets: no new assets needed
- Scripts: no new runtime scripts needed
- References: add the missing `PLANNOTATOR_RELIABILITY_CONSENSUS_2026-03-06.md`
  note already referenced by the skill
- Evals: add `evals/evals.json`
- Sections: no SKILL.md section rewrite needed because the entrypoint is already
  standards-clean and compact
- Skill-autoresearch decision: still `no` for this run because the new eval
  baseline needs review and merge before a scored mutation loop is justified

## Current state

- State: PR `#24` is open for the bounded `omg` packaging slice on
  `chore/skill-loop-pr-open-20260414-r25`
- Blocker: no hard blocker remains; the lane is waiting on the next scheduled
  PR review to confirm no duplicate work, missing artifacts, or new
  standardization gaps
- Next owner: `nanoclaw_pd` to review PR `#24` next run and hand off a bounded
  follow-up only if the review finds a real gap
- Stage: `pr-open`
