# Current Lock

Date: 2026-04-15

## Survey refresh

- Agent Skills still centers the ecosystem on `SKILL.md` plus optional support
  folders such as `references/`, `scripts/`, and `evals/`, so packaging-first
  work remains higher leverage than prompt-only mutation for oversized skills.
- OpenAI's current Codex materials explicitly expose skills as a reusable
  workflow surface, which increases the value of compact activation prompts and
  packaged support detail.
- A2A continues to formalize capability and authentication disclosure through
  agent cards, which favors explicit support contracts over buried longform instructions.
- Eval and tracing surfaces are common enough that `skill-autoresearch` should
  start only after a skill has compact structure and packaged eval coverage.
- Durable execution and review-focused runtime patterns still support the
  staged loop of `survey -> improvement -> PR-open -> PR-review -> merge`.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/clients
- https://developers.openai.com/codex/use-cases?category=automation&category=engineering&category=front-end&category=integrations&category=ios&category=quality&team=design-engineering&team=engineering&team=operations
- https://a2a-protocol.org/dev/specification/
- https://developers.openai.com/api/docs/guides/agent-builder-safety

## Live GitHub state

- PR `#28` for `authentication-setup` merged into `main` on
  `2026-04-14T17:11:22Z`, so that lane is closed.
- PR `#29` for `database-schema-design` stayed open and merge-clean at the
  start of this run, so this pass performed the explicit review gate on
  `chore/skill-loop-pr-open-20260415-r30` before advancing the lane to merge:
  https://github.com/akillness/oh-my-gods/pull/29

## Audit snapshot

- Repo-wide validator snapshot on this branch: `80/80` shipped skills pass with
  `0` hard errors, and the repo-wide warning count is now `75`.
- `database-schema-design` validates at `0` errors and `0` warnings under the
  repo's `skill-standardization` validator.
- Eval coverage rises to `25/80` shipped skills because
  `.god-skills/database-schema-design/evals/evals.json` now exists.
- `database-schema-design` now includes the support references it was missing,
  so the entrypoint shrank from `695` lines to `151` lines while keeping
  relational, NoSQL, and migration guidance bundled locally.
- `database-schema-design` now has a corrected `SKILL.toon` support summary;
  the old summary surfaced example field names instead of the real support
  files.
- No new assets or runtime scripts were needed for `database-schema-design` in
  this run; the skill changes were the entrypoint, `SKILL.toon`, references,
  and eval coverage.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `database-schema-design` | Review pass is clean on PR `#29`; advance to merge | No | No | Added on this branch because the old entrypoint mixed detailed SQL, NoSQL, and migration guidance into activation | Added on this branch | No | Merge PR `#29`, then reopen the queue at `genkit` |
| `genkit` | Remains large and unevaluated behind the current PR-open lane | No | No | Likely needed | Needed | No | Keep behind `database-schema-design` |
| `survey` | Remains the research surface, not the packaging target | No | No | Maybe later | Already present | Not yet | Keep for landscape refresh only |
| `skill-standardization` | Remains the repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Packaged and eval-backed, but not the active repo bottleneck | No | No | Already present | Already present | Case by case | Use only after packaging-first debt is reduced |

## Locked direction

- Primary lane: merge PR `#29` for `database-schema-design` after the clean
  review pass in this run.
- Secondary lane: after `database-schema-design` lands, refresh the packaging
  queue among large non-eval skills; `genkit` remains the leading candidate.
- Do not start a `skill-autoresearch` mutation loop for the large non-eval
  backlog before compact entrypoints and packaged evals exist.
- Keep the branch clean by excluding unrelated docs churn, runtime experiments,
  and already-merged slices.

## Cleanup plan

1. Refresh GitHub and validator state before touching lifecycle stage.
2. Re-review only `.god-skills/database-schema-design/*` plus the survey lock
   files.
3. If the review is clean, avoid new skill edits and only move the lifecycle
   state forward.
4. Re-run the target validator and repo-wide validator before advancing to
   merge.

## Run action

- Smallest bounded action for this run: review PR `#29` for duplicate work,
  missing improvements, and standardization gaps, then advance it to merge if
  the lane stays clean

## Status

- Current state: the explicit PR-review pass for `database-schema-design` is
  clean; PR `#29` is ready to merge from
  `chore/skill-loop-pr-open-20260415-r30`
- Blocker: none
- Next owner: `nanoclaw_pd` to complete the merge path in this run
- Stage: `merge`
