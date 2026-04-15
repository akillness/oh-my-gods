# Current Lock

Date: 2026-04-15

## Survey refresh

- Agent Skills still centers reusable skill packages on `SKILL.md` plus
  optional support directories such as `references/`, `scripts/`, `assets/`,
  and `evals`.
- OpenAI's Codex guidance keeps pushing reusable skills and automations, which
  reinforces small workflow entrypoints plus explicit follow-on execution
  surfaces instead of monolithic prompt files.
- Anthropic and Gemini both continue to formalize packaged subagents,
  commands, and extensions, which rewards concise trigger text and bundled
  support references.
- A2A reached a `1.0` release with stronger interoperability disclosure, which
  further favors explicit contracts over buried longform instructions.
- React guidance continues to frame `memo`, `useMemo`, and `useCallback` as
  targeted tools for manual optimization rather than default component design,
  which increases the value of a cleaner `ui-component-patterns` API and
  review surface.
- `skill-autoresearch` is still justified only after a skill has compact
  structure plus baseline eval coverage and either measured failures or clear
  review feedback.
- Inference for this repo: packaging-first work remains higher leverage than
  prompt-only mutation on the largest remaining skills because `git-workflow`
  and `responsive-design` still exceed the 500-line guidance threshold while
  `ui-component-patterns` already has a compact, eval-backed package in active
  review.
- Durable execution still works best as
  `survey -> improvement -> PR-open -> PR-review -> merge`.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/using-scripts
- https://agentskills.io/skill-creation/evaluating-skills
- https://developers.openai.com/api/docs/guides/tools-skills
- https://developers.openai.com/codex/noninteractive
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/cli-reference
- https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://react.dev/blog/2024/02/15/react-labs-what-we-have-been-working-on-february-2024
- https://a2a-protocol.org/latest/announcing-1.0/

## Live GitHub state

- PR `#29` for `database-schema-design` remains closed and merged.
- PR `#30` for `genkit` remains closed and merged:
  https://github.com/akillness/oh-my-gods/pull/30
- PR `#31` for `prompt-repetition` remains closed and merged:
  https://github.com/akillness/oh-my-gods/pull/31
- PR `#32` for `technical-writing` remains closed and merged:
  https://github.com/akillness/oh-my-gods/pull/32
- PR `#33` for `deployment-automation` merged at
  `2026-04-15T04:06:39Z`:
  https://github.com/akillness/oh-my-gods/pull/33
- PR `#34` for `state-management` merged at
  `2026-04-15T06:07:47Z`:
  https://github.com/akillness/oh-my-gods/pull/34
- PR `#35` for `codebase-search` merged at
  `2026-04-15T08:06:59Z`:
  https://github.com/akillness/oh-my-gods/pull/35
- PR `#36` for `ui-component-patterns` is open, non-draft, and based on branch
  `chore/skill-loop-pr-open-20260415-r37`:
  https://github.com/akillness/oh-my-gods/pull/36

## Audit snapshot

- Latest live GitHub state confirms `codebase-search` is closed upstream after
  PR `#35` merged.
- On `main`, `ui-component-patterns` was the largest remaining monolith at
  `530` lines with no packaged `references/`, `evals/`, `scripts/`, or
  `assets`, which made it the strongest next bounded packaging gap.
- This branch shrinks `ui-component-patterns` to a `172` line entrypoint, adds
  the missing `references/` and `evals/`, and keeps scripts and assets
  intentionally out of scope.
- This run validated `ui-component-patterns`, re-ran repo-wide validation,
  opened PR `#36`, and confirmed the branch stays bounded to the packaged
  `ui-component-patterns` lane plus survey-lock files.
- Target validation now passes at `0` errors and `0` warnings for
  `ui-component-patterns`.
- Repo-wide validation now stays at `0` hard errors and drops from `63` to
  `62` warnings.
- `git-workflow` is now the next queued monolith at `526`, followed by
  `responsive-design` at `514`.
- The missing bridge wrapper target
  (`/Users/jang_jennie/Documents/JYJ/nanoclaw/scripts/agent-bridge.py`) blocks
  fanout orchestration, but it does not block local repo execution.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `deployment-automation` | Closed after PR `#33` merge | No | No | Merged | Merged | No | Keep closed unless later defects reopen it |
| `state-management` | Closed after PR `#34` merge | No | No | Merged | Merged | Not yet | Keep closed unless later defects reopen it |
| `codebase-search` | Closed after PR `#35` merge | No | No in that pass | Added | Added | Not yet | Keep closed unless later review feedback or measured failures reopen it |
| `ui-component-patterns` | Active PR-open lane on `r37` / PR `#36` | No | No | Added | Added | Not yet | Review PR `#36` next run; only reopen implementation if that review finds a bounded gap |
| `git-workflow` | Queued behind `ui-component-patterns` | No | Not yet | Likely needed | Needed | Not yet | Re-open after `#36` lands unless review finds a defect in the active lane |
| `survey` | Research surface only | No | No | Maybe later | Already present | Not yet | Keep for landscape refresh only |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only for compact eval-backed skills | Revisit only after measured failures or review feedback |

## Locked direction

- Primary lane: advance PR `#36` for `ui-component-patterns` into merge now
  that the re-review pass stayed clean.
- Secondary lane: reopen the queue at `git-workflow` only after PR `#36`
  lands.
- Do not start a mutation loop for the large non-eval backlog before the
  active packaging PR resolves.

## Status

- Current state: `codebase-search` is closed upstream after merge, and
  `ui-component-patterns` is now packaged, re-reviewed clean, and ready to
  merge on PR `#36`
- Blocker: team fanout is unavailable because the NanoClaw bridge wrapper has
  no underlying `scripts/agent-bridge.py`, but the merge path itself is not
  blocked
- Next owner: `nanoclaw_pd` to merge PR `#36` and reopen the queue at
  `git-workflow`
- Stage: `merge`
