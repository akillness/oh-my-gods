# Current Lock

Date: 2026-04-15

## Survey refresh

- Agent Skills still centers the shared ecosystem on `SKILL.md` plus optional
  support folders such as `references/`, `scripts/`, `assets/`, and `evals`,
  so packaging-first work remains higher leverage than prompt-only mutation for
  oversized skills.
- OpenAI Codex now treats skills and automations as reusable workflow surfaces,
  which increases the value of compact entrypoints that are safe to reuse in
  scheduled or background runs.
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
- https://developers.openai.com/codex/
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/slash-commands
- https://developers.google.com/gemini-code-assist/docs/gemini-cli
- https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://genkit.dev/docs/js/overview/
- https://genkit.dev/docs/flows/
- https://genkit.dev/docs/js/devtools/
- https://a2a-protocol.org/v0.3.0/specification/

## Live GitHub state

- PR `#29` for `database-schema-design` merged into `main` on
  `2026-04-14T20:05:52Z`, so that lane is closed.
- PR `#30` for `genkit` is now open from
  `chore/skill-loop-pr-open-20260415-r31`:
  https://github.com/akillness/oh-my-gods/pull/30

## Audit snapshot

- Repo-wide validator snapshot on this branch: `80/80` shipped skills pass with
  `0` hard errors, and the repo-wide warning count is now `72`.
- `genkit` validates at `0` errors and `0` warnings under the repo's
  `skill-standardization` validator.
- Eval coverage rises to `26/80` shipped skills because
  `.god-skills/genkit/evals/evals.json` now exists.
- `genkit` now includes the support references it was missing, so the entrypoint
  shrank from `679` lines to `178` lines while keeping setup, workflow, and
  deployment guidance bundled locally.
- `genkit` now has a corrected `SKILL.toon` support summary.
- No new assets or runtime scripts were needed for `genkit` in this run; the
  skill changes were the entrypoint, `SKILL.toon`, references, and eval
  coverage.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `genkit` | PR `#30` is open and should move to explicit review next | No | No | Added on this branch because the old entrypoint mixed setup, workflow, runtime, and deployment detail into activation | Added on this branch | No | Review PR `#30`, then reconsider mutations only if repeated measured failures appear |
| `prompt-repetition` | Remains the next high-warning packaging gap behind the active PR-open lane | No | No | Likely needed | Needed | No | Keep next in queue after `genkit` |
| `technical-writing` | Remains large and unevaluated behind the current PR-open lane | No | No | Likely needed | Needed | No | Keep behind `prompt-repetition` |
| `survey` | Remains the research surface, not the packaging target | No | No | Maybe later | Already present | Not yet | Keep for landscape refresh only |
| `skill-standardization` | Remains the repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |

## Locked direction

- Primary lane: review PR `#30` for `genkit` on the next scheduled run.
- Secondary lane: after `genkit` lands, reopen the packaging queue at
  `prompt-repetition`.
- Do not start a `skill-autoresearch` mutation loop for the large non-eval
  backlog before compact entrypoints and packaged evals exist.
- Keep the branch clean by excluding unrelated docs churn, runtime experiments,
  and already-merged slices.

## Cleanup plan

1. Refresh GitHub and validator state before touching lifecycle stage.
2. Re-review only `.god-skills/genkit/*` plus the survey lock files.
3. If the review is clean, avoid new skill edits and only move the lifecycle
   state forward.
4. Re-run the target validator, JSON parse check, and repo-wide validator
   before advancing to merge.

## Run action

- Smallest bounded action for the next run: review PR `#30` for duplicate work,
  missing improvements, and standardization gaps, then advance it to merge if
  the lane stays clean.

## Status

- Current state: the `genkit` packaging lane is open on PR `#30` from
  `chore/skill-loop-pr-open-20260415-r31`
- Blocker: none
- Next owner: `nanoclaw_pd` to complete the PR-review gate on the next run
- Stage: `PR-open`
