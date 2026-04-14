# Current Lock

Date: 2026-04-15

## Survey refresh

- Agent Skills still defines skills as directories centered on `SKILL.md` with
  optional `scripts/`, `references/`, and `assets/`, and still recommends
  progressive disclosure so the main entrypoint stays compact and reviewable.
  That keeps packaging-first work higher leverage than prompt-mutation work
  for oversized skills in this repo.
- Agent Skills still treats the frontmatter `description` as the primary
  trigger mechanism and still recommends user-intent-focused imperative
  phrasing. `backend-testing` already met that bar, so the stronger move in
  this run was reducing size and adding support files, not rewriting the
  trigger description aggressively.
- Agent Skills evaluation guidance still centers observable assertions in
  `evals/evals.json`, which made missing eval coverage the clearest gap for
  `backend-testing`.
- OpenAI Codex docs now explicitly expose Skills, Rules, Hooks, `AGENTS.md`,
  Subagents, Background mode, and Evaluation surfaces in the same product
  stack, and Codex cloud still supports background work that can turn results
  into pull requests. That continues to support the repo's
  `PR-open -> PR-review -> merge` loop for skill packaging.
- Vercel's official skill docs still frame skills as packaged, verified,
  installable capabilities across agent clients, which continues to favor
  compact entrypoints plus support files over monolithic prompt blobs.
- Gemini CLI still foregrounds extensions, custom commands, and `GEMINI.md`
  context files rather than a first-party Agent Skills activation contract, so
  it does not change the current packaging-first prioritization.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/optimizing-descriptions
- https://agentskills.io/skill-creation/evaluating-skills
- https://agentskills.io/skill-creation/using-scripts
- https://developers.openai.com/codex/cloud
- https://vercel.com/docs/agent-resources/skills
- https://github.com/google-gemini/gemini-cli

## Audit snapshot

- PR `#26` for `ralph` is no longer merely merge-ready; it merged into
  `origin/main` on `2026-04-14T14:04:41Z`.
- Before this run there were no open pull requests in the repo, so opening the
  next bounded lane did not duplicate an active review path.
- Repo-wide validator snapshot on this branch: `80/80` shipped skills still
  pass with `0` hard errors; the repo-wide `skill-standardization` warning
  count drops to `77`.
- `skill-standardization` now validates `.god-skills/backend-testing/` at `0`
  errors and `0` warnings.
- Eval coverage rises to `23/80` shipped skills because
  `.god-skills/backend-testing/evals/evals.json` now exists.
- `backend-testing` now includes the support references it was missing, so the
  entrypoint shrank from `845` lines to `216` lines while keeping detailed
  framework recipes and troubleshooting guidance bundled locally.
- No new assets or runtime scripts were needed for `backend-testing` in this
  run; the repo changes inside the skill were the entrypoint, `SKILL.toon`,
  references, and eval coverage.
- New review lane registered as PR `#27`:
  `https://github.com/akillness/oh-my-gods/pull/27`
- PR `#27` is open, not a draft, has `mergeStateStatus = CLEAN`, has no review
  decision or reviews yet, and its diff stays bounded to
  `.god-skills/backend-testing/*` plus the recurring cleanup-plan file.
- `skill-autoresearch` remains a decision gate only; this run found no reason
  to start scored mutations for `backend-testing` before the new packaging and
  eval baseline is reviewed on the open PR.
- `ralph`, `plannotator`, `omg`, and `vibe-kanban` are already merged on
  `origin/main`, so reopening any of those lanes now would be duplicate work.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `backend-testing` | PR `#27` is open; the skill is now standards-clean and eval-backed on `chore/skill-loop-pr-open-20260415-r28` | No | No new scripts needed | Added on this branch because the previous entrypoint was oversized and example-heavy | Added on this branch | No | Re-review PR `#27` on the next run and merge it if it stays clean |
| `authentication-setup` | Still a top candidate in the large non-eval backlog after `backend-testing` resolves | No new assets needed | No new scripts needed | Likely needed | Needed | No | Keep behind `backend-testing` |
| `database-schema-design` | Still a top candidate in the large non-eval backlog after `backend-testing` resolves | No new assets needed | No new scripts needed | Likely needed | Needed | No | Keep behind `backend-testing` |
| `genkit` | Remains large and unevaluated, but behind the current PR-open lane | No new assets needed | No new scripts needed | Likely needed | Needed | No | Keep behind `backend-testing` |
| `ohmg` | Still the only measured optimization lane, but it remains lower priority than finishing the active `backend-testing` review lane | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a stronger mutation or harness change exists | Keep frozen in this run |

## Locked direction

- Primary lane: review PR `#27` for `backend-testing` on the next run; if the
  review is still clean, merge it instead of reopening implementation.
- Secondary lane: after `backend-testing` resolves, refresh the packaging queue
  among large non-eval skills; current size-heavy candidates are
  `authentication-setup`, `database-schema-design`, and `genkit`.
- Secondary lane: keep `ohmg` frozen; do not reopen the mutation loop while a
  better packaging-first move remains available elsewhere.
- Keep this branch family clean by excluding unrelated docs churn, runtime
  experiments, and already-merged slices.

## Cleanup plan

1. Re-review PR `#27` for duplicate work, missing improvements, or new
   standardization gaps.
2. If the review remains clean, merge PR `#27` instead of reopening
   `backend-testing`.
3. Only reopen `backend-testing` implementation if the review finds a concrete
   standards or packaging defect.

## Run action

- Smallest bounded action for this run: package `backend-testing` for review,
  open PR `#27`, and leave the next scheduled pass in the `PR-review` lane

## Status

- Current state: PR `#27` is open for the bounded `backend-testing` packaging
  slice on `chore/skill-loop-pr-open-20260415-r28`
- Blocker: no hard blocker remains for the packaging slice itself; the next
  scheduled pass should perform the post-open review gate and check for GitHub
  review feedback before merging
- Next owner: `nanoclaw_pd` to run the PR-review gate on the next scheduled
  pass, then `nanoclaw_engine` only if that review finds a concrete follow-up
  patch
- Stage: `PR-open`
- PR-readiness note: keep the lane limited to `.god-skills/backend-testing/*`
  plus the recurring survey lock files; do not mix in merged lanes, `ohmg`, or
  the broader backlog
