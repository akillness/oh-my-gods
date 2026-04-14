# Current Lock

Date: 2026-04-14

## Survey refresh

- Agent Skills still defines skills as directories centered on `SKILL.md` with
  optional `scripts/`, `references/`, and `assets/`, and still recommends
  keeping the main entrypoint under 500 lines through progressive disclosure.
  That keeps packaging-first work higher leverage than prompt-mutation work for
  under-packaged skills in this repo.
- Agent Skills still treats the frontmatter `description` as the primary
  trigger mechanism and recommends user-intent-focused imperative phrasing.
  `ralph` already met that bar, so description rewrites were lower value than
  adding eval coverage and standard sections.
- Agent Skills evaluation guidance still centers objective assertions in
  `evals/evals.json`, which made missing eval coverage the clearest gap for
  `ralph`.
- Agent Skills script guidance still says to add scripts when commands become
  too complex or unreliable inline. `ralph` already ships the setup and state
  scripts it needs, so no new scripts were justified in this run.
- Vercel's official skill directory still frames skills as packaged, verified,
  installable capabilities that span many agent clients, which continues to
  favor small reviewable packaging slices over broad rewrites.
- OpenAI Codex cloud still emphasizes background parallel work and creating
  pull requests from delegated work, which matches the recurring
  `PR-open -> PR-review -> merge` loop this repo uses.
- Gemini CLI still foregrounds custom commands and `GEMINI.md` context files
  rather than a first-party Agent Skills trigger contract, so it does not
  change the current packaging-first prioritization.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/optimizing-descriptions
- https://agentskills.io/skill-creation/evaluating-skills
- https://agentskills.io/skill-creation/using-scripts
- https://vercel.com/docs/agent-resources/skills
- https://developers.openai.com/codex/cloud
- https://github.com/google-gemini/gemini-cli

## Audit snapshot

- PR `#25` for `plannotator` is no longer merely merge-ready; it merged into
  `origin/main` on `2026-04-14T12:11:12Z`.
- Before this run there were no open pull requests in the repo, so opening the
  next bounded lane did not duplicate an active review path.
- Repo-wide validator snapshot on this branch: `80/80` shipped skills still
  pass with `0` hard errors; the warning count drops to `78`.
- `skill-standardization` now validates `.god-skills/ralph/` at `0` errors and
  `0` warnings.
- Eval coverage rises to `22/80` shipped skills because
  `.god-skills/ralph/evals/evals.json` now exists.
- `ralph` now includes the missing standard sections and stays within the
  progressive-disclosure target at `482` lines while reusing its existing
  references and scripts.
- No new assets, scripts, or references were needed for `ralph` in this run;
  the only repo change inside the skill was the entrypoint structure plus eval
  coverage.
- New review lane registered as PR `#26`:
  `https://github.com/akillness/oh-my-gods/pull/26`
- `skill-autoresearch` remains a decision gate only; this run found no reason
  to start scored mutations for `ralph` before the new eval baseline is
  reviewed on the open PR.
- `omg`, `vibe-kanban`, and `plannotator` are already merged on `origin/main`,
  so reopening any of those lanes now would be duplicate work.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `plannotator` | Already merged on `origin/main` via PR `#25`; no follow-up change is needed in this run | No new assets needed | Existing scripts are already sufficient | Already present | Already present | No | Keep merged and do not reopen |
| `ralph` | PR `#26` is open; the skill is now standards-clean and eval-backed on `chore/skill-loop-pr-open-20260414-r27` | No | Existing scripts are already sufficient | Existing references are already sufficient | Added on this branch | No | Re-review PR `#26` on the next run and merge it if it stays clean |
| `ohmg` | Still the only measured optimization lane, but it remains lower priority than finishing the active `ralph` review lane | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a stronger mutation or harness change exists | Keep frozen in this run |
| `skill-standardization` | Standards-clean and already eval-backed | No | Existing validator script is already sufficient | No extra references needed | Already present | No | Keep as an audit surface only |
| `skill-autoresearch` | Standards-clean and already eval-backed | No | No new scripts needed | Existing reference guide is already sufficient | Already present | No | Keep as the decision gate, not an edit target, in this run |

## Locked direction

- Primary lane: review PR `#26` for `ralph` on the next run; if the review is
  still clean, merge it instead of reopening implementation.
- Secondary lane: after `ralph` resolves, refresh the packaging queue among
  large non-eval skills; current size-heavy candidates are
  `authentication-setup`, `backend-testing`, and `database-schema-design`.
- Secondary lane: keep `ohmg` frozen; do not reopen the mutation loop while a
  better packaging-first move remains available elsewhere.
- Keep this branch family clean by excluding unrelated docs churn, runtime
  experiments, and already-merged slices.

## Cleanup plan

1. Re-review PR `#26` for duplicate work, missing improvements, or new
   standardization gaps.
2. If the review remains clean, merge PR `#26` instead of reopening `ralph`.
3. Only reopen `ralph` implementation if the review finds a concrete standards
   or packaging defect.

## Run action

- Smallest bounded action for this run: package `ralph` for review, open PR
  `#26`, and leave the next scheduled pass in the `PR-review` lane

## Status

- Current state: PR `#26` is open for the bounded `ralph` packaging slice on
  `chore/skill-loop-pr-open-20260414-r27`
- Blocker: no hard blocker remains for the packaging slice itself; the next
  scheduled pass should perform the post-open review gate and check for GitHub
  review feedback before merging
- Next owner: `nanoclaw_pd` to run the PR-review gate on the next scheduled
  pass, then `nanoclaw_engine` only if that review finds a concrete follow-up
  patch
- Stage: `PR-open`
- PR-readiness note: keep the lane limited to `.god-skills/ralph/*` plus the
  recurring survey lock files; do not mix in `ohmg`, merged lanes, or the
  broader long-skill backlog
