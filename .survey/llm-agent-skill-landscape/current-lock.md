# Current Lock

Date: 2026-04-14

## Survey refresh

- Agent Skills still frames skills as folders of instructions, scripts, and
  resources, and the evaluation guide still recommends structured evals before
  mutation. That keeps workflow-critical eval coverage as the main leverage
  point for this repo.
- Claude Code and Gemini CLI both still describe skills as specialized
  procedural packages that load when relevant, which continues to favor compact
  entrypoints backed by scripts and references instead of duplicated playbooks.
- The broader skills ecosystem still pushes portability hard: `vercel-labs`
  continues shipping a cross-agent install surface that targets Claude Code,
  Codex, OpenCode, and many more agents.
- OpenAI's current Codex launch guidance still recommends assigning
  well-scoped tasks to multiple agents and explicitly frames asynchronous,
  multi-agent workflows as the direction of travel. That keeps shared
  orchestration skills high-leverage in this repo.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/evaluating-skills
- https://code.claude.com/docs/en/skills
- https://geminicli.com/docs/tools/activate-skill/
- https://github.com/vercel-labs/skills
- https://openai.com/index/introducing-codex/

## Audit snapshot

- Repo-wide validator snapshot on this review branch: `80/80` skills pass the
  current frontmatter validator.
- `vibe-kanban` is already merged on `origin/main` through PR `#23`, so that
  lane is complete and must not be reopened in this run.
- `skill-standardization` validates `.god-skills/omg/` at `0` errors and `0`
  warnings.
- Eval coverage on this branch rises to `20/80` shipped skills because
  `.god-skills/omg/evals/evals.json` is now present.
- The branch diff stays bounded to `.god-skills/omg/*` plus the recurring
  survey lock files.
- PR `#24` is open, mergeable, has no review comments or review decisions, and
  still matches the intended bounded file set on re-review, so the loop can
  advance to merge instead of opening another implementation lane.
- `skill-autoresearch` remains the decision gate only; this run found no reason
  to mutate `omg` before the new packaging baseline is reviewed and merged.
- `plannotator` still surfaces `5` standardization warnings, and that cleanup
  remains broader than the already-queued post-merge lane, so it stays behind
  `omg` in the bounded improvement order.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agentation` | Already merged on `origin/main`; no follow-up change is needed in this run | No new assets needed | Existing scripts are already sufficient | Already present | Already present | Not yet; any later scored mutation loop should start from the merged baseline | Keep merged and do not reopen |
| `vibe-kanban` | Already merged on `origin/main` via PR `#23`; no further change is justified in this run | No new assets needed | Existing scripts are already sufficient | Already present | Already present | Not yet; reopen only if a future review finds a real regression | Keep merged and do not reopen |
| `omg` | PR `#24` passed the post-open review gate; the skill is standards-clean and eval-backed on this branch | No | Existing scripts are already sufficient | Added on this branch because the skill already referenced the note | Added on this branch | No | Merge PR `#24` in this run |
| `plannotator` | Still lacks evals and remains broader than the current `omg` slice | No | Existing scripts are already present | References would help later, but not in this run | Needed | No | Re-rank after `omg` |
| `ohmg` | Still the only measured optimization lane, but the kept experiment state is better handled after the packaging backlog shrinks | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a stronger mutation or harness change exists | Keep stable in this run |
| `skill-standardization` | Standards-clean and already eval-backed | No | Existing validator script is already sufficient | No extra references needed | Already present | No | Keep as an audit surface only |
| `skill-autoresearch` | Standards-clean and already eval-backed | No | No new scripts needed | Existing reference guide is already sufficient | Already present | No | Keep as the decision gate, not an edit target, in this run |

## Locked direction

- Primary lane: merge the bounded `omg` packaging slice on PR `#24`
- Secondary lane: keep `plannotator` as the next packaging target after `omg`
  lands
- Secondary lane: keep `ohmg` frozen; do not reopen the mutation loop while the
  better next move is still packaging another workflow skill
- Tertiary lane: keep `ralph` and the other script/reference-heavy non-eval
  skills behind `plannotator` until the queue changes materially
- Keep this branch clean by excluding unrelated docs churn, runtime experiments,
  and older merged slices

## Cleanup plan

1. Refresh the survey and standards evidence before changing lifecycle state.
2. Revalidate `omg` with the repo validator and the
   `skill-standardization` validator.
3. Confirm PR `#24` still has no review objections and the branch stays bounded
   to `omg` plus the survey lock files.
4. Merge PR `#24` once the review remains clean; leave `plannotator` for the
   next run.

## Run action

- Smallest bounded action for this run: complete the post-open review for
  `omg`, confirm no duplicate work is needed, and merge PR `#24`

## Status

- Current state: PR `#24` reviewed cleanly and is ready to merge for the
  bounded `omg` packaging slice on `chore/skill-loop-pr-open-20260414-r25`
- Blocker: no hard blocker remains for PR `#24`; runtime or browser validation
  is still intentionally deferred because this slice packaged evals and a
  reliability reference rather than changing browser behavior or runtime logic
- Next owner: `nanoclaw_pd` to merge PR `#24` in this run, then
  `nanoclaw_engine` for the next bounded `plannotator` packaging pass after
  merge
- Stage: `merge`
- PR-readiness note: keep the merged slice limited to `.god-skills/omg/*` plus
  the survey lock updates and cleanup plan; do not mix `plannotator`, `ohmg`,
  or unrelated docs churn into this branch
