# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- Branch baseline: `origin/main` after PR `#21` merged and no open follow-up PRs
- Repo-wide validator snapshot on this review run: `80/80` skills pass the current frontmatter validator
- Repo-wide warning snapshot on this review run: `0` validator errors and `96` warnings across `.god-skills/`
- `agent-manager` remains standards-clean and already landed on `origin/main`
- Eval coverage on this branch is now `17` of `80` shipped skills with `evals/evals.json`
- `agentation` is now the smallest workflow-critical packaging gap: the skill has `5` validator warnings, links to a missing `references/setup-guide.md`, and lacks eval coverage even though it already ships scripts

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
| `agentation` | High | No | No | Existing scripts are already enough | Yes | Yes | Add the missing setup reference, evals, and standard reviewability sections before considering optimization |
| `vibe-kanban` | High | No | No | Existing scripts are already enough | Existing references are already enough | Yes | Add evals and any missing reviewability sections in a later bounded packaging pass |
| `ohmg` | High | Later | No | Existing capture and scoring scripts are already enough | Existing baseline note is enough | Already present | Keep frozen until a new mutation target or harness improvement is ready |
| `skill-standardization` | Medium | No | No | Existing validator script is already enough | No | Already present | Use as an audit surface, not an edit target, in this run |
| `skill-autoresearch` | Medium | No | No | No | Existing reference guide is already enough | Already present | Use as the decision gate for whether a scored loop is worth starting |

## Packaging decision for this run

- Target skill: `agentation`
- Assets: no new assets needed
- Scripts: no new scripts needed; the existing setup and verify helpers already cover the runtime actions
- References: add the missing setup guide that `SKILL.md` already links to
- Evals: add `evals/evals.json` as the measurement gate for any later optimization
- Sections: standardize the entrypoint with explicit trigger phrasing and the missing reviewability headings without widening the runtime surface

## Current state

- State: the previous `agent-manager` slice is already merged; the next bounded `agentation` packaging slice is now in active improvement on `chore/skill-loop-pr-open-20260414-r23`
- Blocker: no hard blocker remains, but `skill-autoresearch` is still deferred because `agentation` has no eval gate yet
- Next owner: `nanoclaw_pd` to open the PR path for `agentation`, then `nanoclaw_engine` for the next PR-review pass
- Stage: `improvement`
