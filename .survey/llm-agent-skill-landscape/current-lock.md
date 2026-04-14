# Current Lock

Date: 2026-04-14

## Survey refresh

- Agent Skills still frames skills as folders of instructions, scripts, and
  resources, which reinforces keeping high-leverage workflow skills compact at
  the entrypoint while loading detail on demand.
- The broader `skills` ecosystem continues expanding portability pressure; the
  current `vercel-labs/skills` README advertises Codex plus `40+` other agent
  surfaces and shows `v1.5.0` released on `2026-04-12`.
- OpenAI continues positioning Codex around multi-agent, parallel work with
  skills as the packaging layer, which keeps workflow-review skills important in
  this repo.
- Upstream `BloopAI/vibe-kanban` was updated on `2026-04-14`, which raised the
  cost of keeping a duplicated operational playbook inside the main skill file.

Source links:

- https://agentskills.io/home
- https://github.com/vercel-labs/skills
- https://openai.com/index/introducing-the-codex-app/
- https://github.com/BloopAI/vibe-kanban

## Audit snapshot

- PR `#22` (`agentation`) is already merged, so the recurring loop had to start
  a new slice instead of re-reporting `merge` state on a stale branch.
- Repo-wide validator snapshot on this review branch: `80/80` skills pass the
  current frontmatter validator.
- `skill-standardization` now validates `.god-skills/vibe-kanban/` at `0`
  errors and `0` warnings.
- Eval coverage on this branch rises to `19/80` shipped skills because
  `.god-skills/vibe-kanban/evals/evals.json` is now present.
- The branch diff stays bounded to `.god-skills/vibe-kanban/*` plus the
  recurring survey lock files.
- PR `#23` is open and mergeable, so this pass ends in `PR-open` rather than
  reopening a second implementation lane.
- `skill-autoresearch` remains the decision gate only; this run found no reason
  to mutate `vibe-kanban` before the new packaging baseline is merged.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agentation` | Already merged on `origin/main`; no follow-up change is needed in this run | No new assets needed | Existing scripts are already sufficient | Already present | Already present | Not yet; any later scored mutation loop should start from the merged baseline | Keep merged and do not reopen |
| `vibe-kanban` | PR `#23` is open for the packaging slice; the skill is now standards-clean and eval-backed on this branch | No new assets needed | Existing scripts are already sufficient; only comment/path cleanup landed | Added on this branch | Added on this branch | Not yet; merge the packaging slice first | Review PR `#23` on the next run |
| `omg` | Still lacks evals even though it already ships scripts plus references, so it is the next packaging candidate after `vibe-kanban` | No | Existing scripts are already present | Existing references are already present | Needed | No | Make it the next bounded packaging target after merge |
| `plannotator` | Still lacks evals but stays behind `omg` on leverage | No | Existing scripts are already present | No extra references needed yet | Needed | No | Re-rank after `omg` |
| `ohmg` | Still the only measured optimization lane, but the kept experiment state is better handled after the packaging backlog shrinks | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a stronger mutation or harness change exists | Keep stable in this run |
| `skill-standardization` | Standards-clean and already eval-backed | No | Existing validator script is already sufficient | No extra references needed | Already present | No | Keep as an audit surface only |
| `skill-autoresearch` | Standards-clean and already eval-backed | No | No new scripts needed | Existing reference guide is already sufficient | Already present | No | Keep as the decision gate, not an edit target, in this run |

## Locked direction

- Primary lane: keep the bounded `vibe-kanban` packaging slice on PR `#23`
- Secondary lane: keep `omg` as the next packaging target after `vibe-kanban` lands
- Secondary lane: keep `ohmg` frozen; do not reopen the mutation loop while the
  better next move is still packaging another workflow skill
- Tertiary lane: keep `agentation` closed unless a later scored optimization
  loop is explicitly justified
- Keep this branch clean by excluding unrelated docs churn, runtime experiments,
  and older merged slices

## Cleanup plan

1. Refresh the survey and standards evidence before changing lifecycle state.
2. Revalidate `vibe-kanban` with the repo validator and the
   `skill-standardization` validator.
3. Confirm the branch stays bounded to `vibe-kanban` plus the survey lock files.
4. Open PR `#23` and leave review plus merge for the next scheduled run.

## Run action

- Smallest bounded action for this run: open the `vibe-kanban` packaging PR and
  stop at `PR-open` instead of forcing the next-run review into the same cycle

## Status

- Current state: PR `#23` is open and mergeable for the bounded `vibe-kanban`
  packaging slice on `chore/skill-loop-pr-open-20260414-r24`
- Blocker: no hard blocker remains for PR `#23`; runtime or browser validation
  is still intentionally deferred because this slice packaged docs, references,
  evals, and small comment-level accuracy fixes
- Next owner: `nanoclaw_pd` to review PR `#23`, then `nanoclaw_engine` for the
  next bounded `omg` packaging pass after merge
- Stage: `PR-open`
- PR-readiness note: keep the PR limited to `.god-skills/vibe-kanban/*` plus the
  survey lock updates and cleanup plan; do not mix `omg`, `ohmg`, or unrelated
  docs churn into this branch
