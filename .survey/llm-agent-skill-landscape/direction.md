# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- Branch baseline: `main` after PR `#20` merged and with no open follow-up PRs
- Repo-wide validator snapshot on this review run: `80/80` skills pass the current frontmatter validator
- `agent-manager` now passes the `skill-standardization` validator with `0` errors and `0` warnings on top of the repo validator
- Eval coverage on this branch is now `17` of `80` shipped skills with `evals/evals.json`
- After the `agent-manager` review pass, the next smallest workflow-critical packaging gap is `agentation`: scripts already exist, but the skill still lacks evals and likely needs a reference layer

## Locked direction

Improve one workflow-critical skill per run, in priority order:

1. `agentation`
2. `vibe-kanban`
3. `ohmg` follow-up only if a new measured mutation can beat the kept experiment state

This order is locked because it balances leverage and boundedness:

- `agentation` remains high leverage because it is the repo's UI-feedback bridge and already ships scripts, but it still lacks the eval and support-material layer needed before any optimization loop.
- `vibe-kanban` is another orchestration-heavy skill with existing scripts and references but no eval coverage, so it is a clean later packaging candidate once `agentation` lands.
- `ohmg` is already the only scored optimization lane in the repo, but a new mutation is not justified until the packaging backlog shrinks or the measurement harness changes.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `agentation` | High | No | No | Existing scripts are already enough | Likely yes | Yes | Add `Instructions`, `Examples`, `References`, and evals before considering optimization |
| `vibe-kanban` | High | No | No | Existing scripts are already enough | Existing references are already enough | Yes | Add evals and any missing reviewability sections in a later bounded packaging pass |
| `ohmg` | High | Later | No | Existing capture and scoring scripts are already enough | Existing baseline note is enough | Already present | Keep frozen until a new mutation target or harness improvement is ready |
| `skill-standardization` | Medium | No | No | Existing validator script is already enough | No | Already present | Use as an audit surface, not an edit target, in this run |
| `skill-autoresearch` | Medium | No | No | No | Existing reference guide is already enough | Already present | Use as the decision gate for whether a scored loop is worth starting |

## Packaging decision for this run

- Target skill: `agent-manager`
- Assets: no new assets needed
- Scripts: no new scripts needed; the existing `install.sh` and `setup.sh` already cover the runtime actions
- References: no new references needed; the existing quick reference was already sufficient for the bounded packaging pass
- Evals: keep the new `evals/evals.json` and merge it as the measurement gate for any later optimization
- Sections: keep the new reviewability sections in `SKILL.md`; review found no need to widen the skill with new runtime features

## Current state

- State: PR `#21` is review-clean and ready to merge for the bounded `agent-manager` packaging slice on `chore/skill-loop-pr-open-20260414-r22`
- Blocker: no hard blocker remains for the packaging slice itself; `skill-autoresearch` is still deferred because `agent-manager` lacks repeated scored runs
- Next owner: `nanoclaw_pd` to merge PR `#21`, then `nanoclaw_engine` for the next bounded `agentation` packaging pass
- Stage: `merge`
