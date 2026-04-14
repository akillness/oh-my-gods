# Current Lock

Date: 2026-04-14

## Survey refresh

- Agent Skills still frames skills as directories centered on `SKILL.md`, with
  optional scripts and resources, and its evaluation guidance still points
  toward structured example coverage before deeper optimization. That keeps
  compact entrypoints plus eval coverage as the highest-value packaging move in
  this repo.
- Agent Skills still treats the frontmatter `description` as the main trigger
  mechanism and recommends keeping trigger logic focused instead of burying it
  under setup detail. That continues to validate a compact `plannotator`
  entrypoint with deeper setup and troubleshooting split into references.
- The broader portable-skills ecosystem still favors packaged, installable
  skills across multiple agent surfaces rather than replacing the underlying
  skill-spec discipline. That keeps workflow-critical shared skills high
  leverage inside `oh-my-gods`.
- Claude Code and OpenAI Codex both continue to emphasize bounded delegation
  and PR-oriented agent workflows, which supports the current review-then-merge
  lane structure for this recurring loop.
- Gemini CLI remains an extensible terminal agent with custom commands, MCP,
  and context files rather than a first-party Agent Skills activation contract,
  so it does not change the current prioritization.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/optimizing-descriptions
- https://agentskills.io/skill-creation/using-scripts
- https://vercel.com/docs/agent-resources/skills
- https://code.claude.com/docs/en/sub-agents
- https://developers.openai.com/codex/cloud
- https://github.com/google-gemini/gemini-cli

## Audit snapshot

- Repo-wide validator snapshot on this review branch: `80/80` shipped skills
  pass the current frontmatter validator with `0` errors; the extra local
  directory under `.god-skills/` is `__pycache__`, not a shipped skill.
- `skill-standardization` validates `.god-skills/plannotator/` at `0` errors
  and `0` warnings.
- Eval coverage on this branch rises to `21/80` shipped skills because
  `.god-skills/plannotator/evals/evals.json` is now present.
- `plannotator` now includes the support references it was missing, so the
  entrypoint shrank from `606` lines to `235` lines without losing the critical
  setup or troubleshooting guidance.
- PR `#25` is open, not a draft, mergeable, has no review comments or review
  decision, and still matches the intended bounded file set on re-review, so
  the loop can advance to merge instead of opening another implementation lane.
- `skill-autoresearch` remains the decision gate only; this run found no reason
  to start scored mutations for `plannotator` before the new packaging baseline
  is merged.
- `omg` and `vibe-kanban` are already merged on `origin/main`, so reopening
  either lane in this run would be duplicate work.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `omg` | Already merged on `origin/main` via PR `#24`; no follow-up change is needed in this run | No new assets needed | Existing scripts are already sufficient | Already present | Already present | No | Keep merged and do not reopen |
| `vibe-kanban` | Already merged on `origin/main` via PR `#23`; no further change is justified in this run | No new assets needed | Existing scripts are already sufficient | Already present | Already present | No | Keep merged and do not reopen |
| `plannotator` | PR `#25` passed the post-open review gate; the skill is standards-clean and eval-backed on this branch | No | Existing scripts are already sufficient | Added on this branch because the entrypoint was too large and missing bundled setup/troubleshooting detail | Added on this branch | No | Merge PR `#25` in this run |
| `ralph` | Still a candidate because it lacks evals, but it stays behind the active `plannotator` merge lane | No | Existing scripts are already sufficient | Existing references are already sufficient | Needed | No | Keep behind `plannotator` unless the merge lane changes materially |
| `ohmg` | Still the only measured optimization lane, but the kept experiment state is still lower priority than packaging another workflow skill | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a stronger mutation or harness change exists | Keep stable in this run |
| `skill-standardization` | Standards-clean and already eval-backed | No | Existing validator script is already sufficient | No extra references needed | Already present | No | Keep as an audit surface only |
| `skill-autoresearch` | Standards-clean and already eval-backed | No | No new scripts needed | Existing reference guide is already sufficient | Already present | No | Keep as the decision gate, not an edit target, in this run |

## Locked direction

- Primary lane: merge the bounded `plannotator` packaging slice on PR `#25`
- Secondary lane: keep `ralph` as the next packaging target after the
  `plannotator` lane lands
- Secondary lane: keep `ohmg` frozen; do not reopen the mutation loop while the
  better next move is still packaging another workflow skill
- Keep this branch clean by excluding unrelated docs churn, runtime
  experiments, and already-merged slices

## Cleanup plan

1. Refresh the survey and standards evidence before changing lifecycle state.
2. Revalidate `plannotator` with the repo validator summary and the
   `skill-standardization` validator.
3. Confirm PR `#25` still has no review objections and the branch stays bounded
   to `plannotator` plus the survey lock files.
4. Merge PR `#25` once the review remains clean; leave `ralph` for the next
   run.

## Run action

- Smallest bounded action for this run: complete the post-open review for
  `plannotator`, confirm no duplicate work is needed, and merge PR `#25`

## Status

- Current state: PR `#25` reviewed cleanly and is ready to merge for the
  bounded `plannotator` packaging slice on
  `chore/skill-loop-pr-open-20260414-r26`
- Blocker: no hard blocker remains for PR `#25`; runtime or browser validation
  is intentionally not required because this slice only packages docs,
  references, and eval coverage rather than changing browser behavior or
  runtime logic
- Next owner: `nanoclaw_pd` to merge PR `#25` in this run, then
  `nanoclaw_engine` for the next bounded `ralph` packaging pass after merge
- Stage: `merge`
- PR-readiness note: keep the lane limited to `.god-skills/plannotator/*` plus
  the recurring survey lock files; do not mix `ralph`, `ohmg`, or unrelated
  docs churn into this branch
