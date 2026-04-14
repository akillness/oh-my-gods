# Current Lock

Date: 2026-04-14

## Survey refresh

- Agent Skills still frames skills as folders of instructions, scripts, and
  resources, and its evaluation guidance still reinforces packaging before
  mutation. That keeps workflow-critical eval coverage as the main leverage
  point for this repo.
- Claude, Codex, and Gemini all continue to treat skills as compact entrypoints
  that fan out into supporting files or tooling surfaces rather than monolithic
  prompts. That still favors compact workflow skills plus references over larger
  duplicated entrypoints.
- With `vibe-kanban` already merged, the cleanest remaining bounded gap is now
  the `omg` skill because it sits on the orchestration spine, already ships
  scripts plus references, and was still missing eval packaging on `main`.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/evaluating-skills
- https://code.claude.com/docs/en/skills
- https://openai.com/index/introducing-the-codex-app/
- https://geminicli.com/docs/tools/activate-skill/
- https://github.com/vercel-labs/skills

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
- PR `#24` is open and currently has no review comments or decisions, which puts
  the recurring loop at the expected `pr-open` stage rather than `improvement`
  or `merge`.
- `skill-autoresearch` remains the decision gate only; this run found no reason
  to mutate `omg` before the new packaging baseline is reviewed and merged.
- `plannotator` remains behind `omg` in the bounded improvement order because
  its warning cleanup is still broader than this slice.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agentation` | Already merged on `origin/main`; no follow-up change is needed in this run | No new assets needed | Existing scripts are already sufficient | Already present | Already present | Not yet; any later scored mutation loop should start from the merged baseline | Keep merged and do not reopen |
| `vibe-kanban` | Already merged on `origin/main` via PR `#23`; no further change is justified in this run | No new assets needed | Existing scripts are already sufficient | Already present | Already present | Not yet; reopen only if a future review finds a real regression | Keep merged and do not reopen |
| `omg` | PR `#24` is now open with added evals and the restored reliability reference | No | Existing scripts are already present | Added on this branch because the skill already referenced the note | Added on this branch | No | Review PR `#24` next run; merge if the review stays clean |
| `plannotator` | Still lacks evals and remains broader than the current `omg` slice | No | Existing scripts are already present | References would help later, but not in this run | Needed | No | Re-rank after `omg` |
| `ohmg` | Still the only measured optimization lane, but the kept experiment state is better handled after the packaging backlog shrinks | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a stronger mutation or harness change exists | Keep stable in this run |
| `skill-standardization` | Standards-clean and already eval-backed | No | Existing validator script is already sufficient | No extra references needed | Already present | No | Keep as an audit surface only |
| `skill-autoresearch` | Standards-clean and already eval-backed | No | No new scripts needed | Existing reference guide is already sufficient | Already present | No | Keep as the decision gate, not an edit target, in this run |

## Locked direction

- Primary lane: review the bounded `omg` packaging slice on PR `#24`
- Secondary lane: keep `plannotator` as the next packaging target after `omg`
  lands
- Secondary lane: keep `ohmg` frozen; do not reopen the mutation loop while the
  better next move is still packaging another workflow skill
- Tertiary lane: keep `ralph` and the other script/reference-heavy non-eval
  skills behind `plannotator` until the queue changes materially
- Keep this branch clean by excluding unrelated docs churn, runtime experiments,
  and older merged slices

## Cleanup plan

1. Refresh the survey and standards evidence now that `vibe-kanban` is merged.
2. Revalidate `omg` with the repo validator and the
   `skill-standardization` validator.
3. Keep the branch diff bounded to `omg` plus the survey lock files.
4. Review PR `#24` next run; merge it if the review remains clean and no
   duplicate work is found.

## Run action

- Smallest bounded action for this run: open the bounded `omg` packaging PR and
  leave the next run at the review gate

## Status

- Current state: PR `#24` is open for the bounded `omg` packaging slice on
  `chore/skill-loop-pr-open-20260414-r25`
- Blocker: no hard blocker remains; the lane is waiting for the next scheduled
  review to confirm there is no duplicate work, no missing improvement, and no
  new standards gap before merge
- Next owner: `nanoclaw_pd` to review PR `#24` next run and hand off a bounded
  fix only if the review finds a real gap
- Stage: `pr-open`
- PR-readiness note: keep the open slice limited to `.god-skills/omg/*` plus the
  survey lock updates and cleanup plan; do not mix `plannotator`, `ohmg`, or
  unrelated docs churn into this branch
