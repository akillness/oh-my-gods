# Current Lock

Date: 2026-04-15

## Survey refresh

- Agent Skills still centers the shared ecosystem on `SKILL.md` plus optional
  support folders such as `references/`, `scripts/`, `assets/`, and `evals`,
  so packaging-first work remains higher leverage than prompt-only mutation for
  oversized skills.
- OpenAI Codex now treats skills and automations as reusable workflow surfaces,
  and its current skills guidance explicitly favors focused entrypoints plus
  scripts only when deterministic behavior is needed.
- Anthropic and Gemini both keep formalizing packaged commands, subagents, and
  extension surfaces, which rewards concise trigger text and support files over
  monolithic skill bodies.
- A2A continues to formalize capability and authentication disclosure through
  agent cards, which favors explicit contracts and support references instead of
  buried longform instructions.
- Eval and tracing surfaces are common enough that `skill-autoresearch` should
  start only after a skill has compact structure and packaged eval coverage.
- Durable execution still works best as
  `survey -> improvement -> PR-open -> PR-review -> merge`.

Source links:

- https://agentskills.io/specification
- https://developers.openai.com/codex/skills
- https://developers.openai.com/codex/automations
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/slash-commands
- https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://a2a-protocol.org/v0.3.0/specification/

## Live GitHub state

- PR `#29` for `database-schema-design` merged into `main` on
  `2026-04-14T20:05:52Z`, so that lane is closed.
- PR `#30` for `genkit` merged into `main` at commit
  `34482161d18a27f057434e7c3523cc732734d2a1` on
  `2026-04-15T07:07:40+09:00`:
  https://github.com/akillness/oh-my-gods/pull/30
- PR `#31` for `prompt-repetition` merged into `main` at
  `2026-04-15T00:07:59Z`:
  https://github.com/akillness/oh-my-gods/pull/31
- PR `#32` for `technical-writing` opened at `2026-04-15T01:08:24Z` from
  `chore/skill-loop-pr-open-20260415-r33`:
  https://github.com/akillness/oh-my-gods/pull/32

## Audit snapshot

- Repo-wide validator snapshot on this branch: `80/80` shipped skills pass with
  `0` hard errors, and the repo-wide warning count is now `66`.
- `technical-writing` validates at `0` errors and `0` warnings under the repo's
  `skill-standardization` validator.
- Eval coverage rises to `28/80` shipped skills because
  `.god-skills/technical-writing/evals/evals.json` now exists.
- `technical-writing` now includes the support files it was missing, so the
  entrypoint shrank from `581` lines to `164` lines while keeping reusable
  templates and review guidance bundled locally.
- `technical-writing` now has a corrected `SKILL.toon` support summary.
- Assets and scripts stayed unnecessary for this lane; the justified support
  changes were the entrypoint, `SKILL.toon`, `references/`, and `evals/`.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `genkit` | Merged and closed via PR `#30` | No | No | Added on merged PR `#30` | Added on merged PR `#30` | No | Closed unless later measured failures reopen it |
| `prompt-repetition` | Merged and closed via PR `#31` | No | Added on merged PR `#31` | Added on merged PR `#31` | Added on merged PR `#31` | No | Closed unless new measured failures reopen it |
| `technical-writing` | Packaged and opened as PR `#32` | No | No | Added on PR `#32` | Added on PR `#32` | No | Review PR `#32`, then reopen the queue at `deployment-automation` |
| `deployment-automation` | Still large and unevaluated behind the active PR-open lane | No | Not yet | Likely needed | Needed | No | Keep next after `technical-writing` lands |
| `survey` | Remains the research surface, not the packaging target | No | No | Maybe later | Already present | Not yet | Keep for landscape refresh only |
| `skill-standardization` | Remains the repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |

## Locked direction

- Primary lane: review PR `#32` for `technical-writing` on the next run.
- Secondary lane: after `technical-writing` lands, reopen the packaging queue
  at `deployment-automation`.
- Do not start a `skill-autoresearch` mutation loop for the large non-eval
  backlog before compact entrypoints and packaged evals exist.
- Keep the branch clean by excluding unrelated docs churn, runtime experiments,
  and unrelated skill slices.

## Cleanup plan

1. Refresh GitHub and validator state before touching the next lifecycle stage.
2. Review only `.god-skills/technical-writing/*` plus the survey lock files.
3. If the review is clean, avoid new skill edits and move the lifecycle state
   from `PR-open` to `merge`.
4. Re-run the target validator, JSON parse check, and the repo-wide validator
   before advancing the lane.

## Run action

- Smallest bounded action for the next run: review PR `#32` for duplicate work,
  missing improvements, and standardization gaps, then advance it to merge if
  the lane stays clean.

## Status

- Current state: the `technical-writing` lane is packaged and opened as PR
  `#32` from `chore/skill-loop-pr-open-20260415-r33`
- Blocker: none
- Next owner: `nanoclaw_pd` to perform the explicit `PR-review` pass on the
  next scheduled run
- Stage: `PR-open`
