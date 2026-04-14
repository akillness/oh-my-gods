# Current Lock

Date: 2026-04-14

## Survey refresh

- Agent Skills still frames skills as folders centered on `SKILL.md` with
  optional scripts and resources, and its evaluation guidance still points
  toward structured example coverage before deeper optimization. That keeps
  compact entrypoints plus eval coverage as the highest-value packaging move in
  this repo.
- Claude Code, Gemini CLI, and the broader portable-skills ecosystem still
  favor skills that stay concise at the entrypoint and push deeper setup or
  troubleshooting into support files. That validates the reference split for
  `plannotator` instead of another inline expansion.
- OpenAI's Codex guidance still emphasizes parallel, well-scoped agent work,
  which keeps shared planning and review surfaces high-leverage inside
  `oh-my-gods`.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/evaluating-skills
- https://code.claude.com/docs/en/skills
- https://geminicli.com/docs/tools/activate-skill/
- https://github.com/vercel-labs/skills
- https://openai.com/codex/

## Audit snapshot

- Repo-wide validator snapshot on this review branch: `81/81` skill directories
  pass the current frontmatter validator with `0` errors.
- `skill-standardization` validates `.god-skills/plannotator/` at `0` errors
  and `0` warnings.
- Eval coverage on this branch rises to `21/81` shipped skills because
  `.god-skills/plannotator/evals/evals.json` is now present.
- `plannotator` now includes the support references it was missing, so the
  entrypoint shrank from `606` lines to `235` lines without losing the critical
  setup or troubleshooting guidance.
- PR `#25` is open, not a draft, and currently has no review decision. GitHub
  has been recalculating mergeability immediately after the latest push, so
  this run should stop at `pr-open` and hand the next cycle a clear PR-review
  target instead of assuming merge readiness.
- `skill-autoresearch` remains the decision gate only; this run found no reason
  to start scored mutations for `plannotator` before the new packaging baseline
  is reviewed.
- `omg` and `vibe-kanban` are already merged on `origin/main`, so reopening
  either lane in this run would be duplicate work.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `omg` | Already merged on `origin/main` via PR `#24`; no follow-up change is needed in this run | No new assets needed | Existing scripts are already sufficient | Already present | Already present | No | Keep merged and do not reopen |
| `vibe-kanban` | Already merged on `origin/main` via PR `#23`; no further change is justified in this run | No new assets needed | Existing scripts are already sufficient | Already present | Already present | No | Keep merged and do not reopen |
| `plannotator` | PR `#25` is open; the skill is standards-clean and now eval-backed on this branch | No | Existing scripts are already sufficient | Added on this branch because the entrypoint was too large and missing bundled setup/troubleshooting detail | Added on this branch | No | Re-review PR `#25` on the next run and patch only if that review finds a bounded gap |
| `ralph` | Still a candidate because it lacks evals, but it stays behind the active `plannotator` PR-open lane | No | Existing scripts are already sufficient | Existing references are already sufficient | Needed | No | Keep behind `plannotator` unless the review lane closes cleanly |
| `ohmg` | Still the only measured optimization lane, but the kept experiment state is still lower priority than packaging another workflow skill | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a stronger mutation or harness change exists | Keep stable in this run |
| `skill-standardization` | Standards-clean and already eval-backed | No | Existing validator script is already sufficient | No extra references needed | Already present | No | Keep as an audit surface only |
| `skill-autoresearch` | Standards-clean and already eval-backed | No | No new scripts needed | Existing reference guide is already sufficient | Already present | No | Keep as the decision gate, not an edit target, in this run |

## Locked direction

- Primary lane: review the bounded `plannotator` packaging slice on PR `#25`
- Secondary lane: keep `ralph` as the next packaging target after the
  `plannotator` lane resolves
- Secondary lane: keep `ohmg` frozen; do not reopen the mutation loop while the
  better next move is still packaging another workflow skill
- Keep this branch clean by excluding unrelated docs churn, runtime
  experiments, and already-merged slices

## Cleanup plan

1. Refresh the survey and standards evidence before changing lifecycle state.
2. Revalidate `plannotator` with the repo validator summary and the
   `skill-standardization` validator.
3. Confirm PR `#25` still matches the intended bounded file set.
4. On the next run, review PR `#25` for duplicate work, missing improvements,
   or remaining standardization gaps, and only then decide whether one bounded
   follow-up patch is justified.

## Run action

- Smallest bounded action for this run: make `plannotator` reviewable,
  register the PR path, and stop at `pr-open`

## Status

- Current state: PR `#25` is open for the bounded `plannotator` packaging
  slice on `chore/skill-loop-pr-open-20260414-r26`
- Blocker: no hard blocker remains for PR `#25`, but GitHub mergeability is
  still settling after the latest push; the next gate is a post-open review for
  duplicate work or one more bounded cleanup patch
- Next owner: `nanoclaw_pd` for the next scheduled PR-review run, with
  `nanoclaw_engine` only if that review finds a bounded fix to apply
- Stage: `pr-open`
- PR-readiness note: keep the lane limited to `.god-skills/plannotator/*` plus
  the recurring survey lock files; do not mix `ralph`, `ohmg`, or unrelated
  docs churn into this branch
