# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- Branch baseline: `main` after PR `#20` merged and with no open follow-up PRs
- Repo-wide validator snapshot before this run: `80/80` skills pass the current frontmatter validator
- Eval coverage is still sparse: only `16` of `80` shipped skills currently include `evals/evals.json`
- After the `agent-browser` merge, the next smallest workflow-critical packaging gap is `agent-manager`: scripts plus a quick reference already exist, but the entrypoint still lacked standardized reviewability sections and evals

## Locked direction

Improve one workflow-critical skill per run, in priority order:

1. `agent-manager`
2. `agentation`
3. `ohmg` follow-up only if a new measured mutation can beat the kept experiment state

This order is locked because it balances leverage and boundedness:

- `agent-manager` is central to local multi-agent runtime control and already has scripts plus references, so adding reviewability sections and evals is a small, high-leverage PR.
- `agentation` remains important, but it still needs both stronger structure and support material, so it is a larger follow-up slice than `agent-manager`.
- `ohmg` is already the only scored optimization lane in the repo, but a new mutation is not justified until the packaging backlog shrinks or the measurement harness changes.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `agent-manager` | High | Not yet | No | Existing scripts are already enough | Existing references are already enough | Yes, on this run | Add `Instructions`, `Examples`, `Best practices`, `References`, and evals, then open a bounded PR |
| `agentation` | High | No | No | Existing scripts are already enough | Likely yes | Yes | Add `Instructions`, `Examples`, `References`, and evals before considering optimization |
| `ohmg` | High | Later | No | Existing capture and scoring scripts are already enough | Existing baseline note is enough | Already present | Keep frozen until a new mutation target or harness improvement is ready |
| `skill-standardization` | Medium | No | No | Existing validator script is already enough | No | Already present | Use as an audit surface, not an edit target, in this run |
| `skill-autoresearch` | Medium | No | No | No | Existing reference guide is already enough | Already present | Use as the decision gate for whether a scored loop is worth starting |

## Packaging decision for this run

- Target skill: `agent-manager`
- Assets: no new assets needed
- Scripts: no new scripts needed; the existing `install.sh` and `setup.sh` already cover the runtime actions
- References: no new references needed; the existing quick reference is already sufficient for a bounded packaging pass
- Evals: add `evals/evals.json` on this branch so later optimization has a measurable entrypoint
- Sections: add the missing reviewability sections to `SKILL.md` instead of widening the skill with new runtime features

## Current state

- State: PR `#21` is open for the bounded `agent-manager` packaging slice on `chore/skill-loop-pr-open-20260414-r22`
- Blocker: no hard blocker on the PR-open slice; the next run only needs to review for duplicate work, missing improvements, or new standardization gaps
- Next owner: `nanoclaw_engine` to review the branch on the next run, then `nanoclaw_pd` to merge if the review stays clean
- Stage: `PR-open`
