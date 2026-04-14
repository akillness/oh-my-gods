# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- Branch baseline: `main` after PR `#21` merged and with no open follow-up PRs
- Repo-wide validator snapshot on this review run: `80/80` skills pass the current frontmatter validator
- `agentation` now passes the `skill-standardization` validator with `0` errors and `0` warnings on top of the repo validator
- Eval coverage on this branch is now `18` of `80` shipped skills with `evals/evals.json`
- After the `agentation` review pass, the next smallest workflow-critical packaging gap is `vibe-kanban`: scripts and references already exist, but eval coverage is still missing

## Locked direction

Improve one workflow-critical skill per run, in priority order:

1. `vibe-kanban`
2. `ohmg` follow-up only if a new measured mutation can beat the kept experiment state
3. Revisit `agentation` only if post-merge feedback or eval results show a real measured gap

This order is locked because it balances leverage and boundedness after the
current `agentation` slice is merged:

- `vibe-kanban` is now the cleanest workflow-critical packaging gap because it already ships scripts and references, but it still lacks eval coverage.
- `ohmg` is already the only scored optimization lane in the repo, but a new mutation is not justified until the packaging backlog shrinks or the measurement harness changes.
- `agentation` should stay closed after merge unless the new eval gate or real review feedback exposes a measured follow-up need.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `agentation` | High | Not yet | No | Existing scripts are already enough | Added on this branch | Added on this branch | Merge the packaging slice first; only revisit `skill-autoresearch` if repeated scored failures show up later |
| `vibe-kanban` | High | No | No | Existing scripts are already enough | Existing references are already enough | Yes | Add evals and any missing reviewability sections in a later bounded packaging pass |
| `ohmg` | High | Later | No | Existing capture and scoring scripts are already enough | Existing baseline note is enough | Already present | Keep frozen until a new mutation target or harness improvement is ready |
| `skill-standardization` | Medium | No | No | Existing validator script is already enough | No | Already present | Use as an audit surface, not an edit target, in this run |
| `skill-autoresearch` | Medium | No | No | No | Existing reference guide is already enough | Already present | Use as the decision gate for whether a scored loop is worth starting |

## Packaging decision for this run

- Target skill: `agentation`
- Assets: no new assets needed
- Scripts: no new scripts needed; the existing setup and verify helpers already cover the runtime actions
- References: keep the new setup guide and merge it as part of the packaging slice
- Evals: keep the new `evals/evals.json` and merge it as the measurement gate for any later optimization
- Sections: keep the new reviewability sections in `SKILL.md`; review found no need to widen the skill with new runtime features

## Current state

- State: PR `#22` is review-clean and ready to merge for the bounded `agentation` packaging slice on `chore/skill-loop-pr-open-20260414-r23`
- Blocker: no hard blocker remains for the packaging slice itself; `skill-autoresearch` is still deferred because `agentation` has not yet produced repeated scored runs against the new eval gate
- Next owner: `nanoclaw_pd` to merge PR `#22`, then `nanoclaw_engine` for the next bounded `vibe-kanban` packaging pass
- Stage: `merge`
