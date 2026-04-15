# Current Lock

Date: 2026-04-15

## Survey refresh

- Agent Skills still centers reusable skill packages on `SKILL.md` plus
  optional support directories such as `references/`, `scripts/`, `assets/`,
  and `evals`, so packaging-first work remains higher leverage than prompt-only
  mutation for oversized skills.
- OpenAI's current Codex guidance keeps pushing reusable skills and
  automations, which reinforces small workflow entrypoints plus explicit
  follow-on execution surfaces instead of monolithic prompt files.
- Anthropic and Gemini both continue to formalize packaged subagents,
  commands, and extensions, which rewards concise trigger text and bundled
  support references.
- A2A reached a `1.0` release with stronger interoperability disclosure, which
  further favors explicit contracts over buried longform instructions.
- `skill-autoresearch` is still justified only after a skill has compact
  structure plus baseline eval coverage and either measured failures or clear
  review feedback.
- Durable execution still works best as
  `survey -> improvement -> PR-open -> PR-review -> merge`.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/using-scripts
- https://openai.com/codex/
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/slash-commands
- https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://a2a-protocol.org/blog/a2a-v1.0-release

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
- PR `#35` for `codebase-search` is open, non-draft, clean, and ready to
  merge on branch `chore/skill-loop-pr-open-20260415-r36` after this run's
  re-review against `origin/main`:
  https://github.com/akillness/oh-my-gods/pull/35

## Audit snapshot

- Latest live GitHub state confirms `state-management` is closed upstream after
  PR `#34` merged.
- On `main`, `codebase-search` was the largest remaining monolith at `534`
  lines with no packaged `references/`, `evals/`, `scripts/`, or `assets`,
  which made it the strongest next bounded packaging gap.
- This branch shrinks `codebase-search` to a `150` line entrypoint, adds the
  missing `references/` and `evals/`, and keeps scripts and assets
  intentionally out of scope.
- This run re-validated `codebase-search`, re-ran repo-wide validation,
  checked the live PR metadata, and confirmed the branch stays bounded to the
  packaged `codebase-search` lane plus survey-lock files when diffed against
  `origin/main`.
- Target validation now passes at `0` errors and `0` warnings for
  `codebase-search`.
- Repo-wide validation now stays at `0` hard errors and drops from `64` to
  `63` warnings.
- `ui-component-patterns` is now the next queued monolith at `530` lines,
  followed by `git-workflow` at `526`.
- The missing bridge wrapper target
  (`/Users/jang_jennie/Documents/JYJ/nanoclaw/scripts/agent-bridge.py`) blocks
  fanout orchestration, but it does not block local repo execution.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `deployment-automation` | Closed after PR `#33` merge | No | No | Merged | Merged | No | Keep closed unless later defects reopen it |
| `state-management` | Closed after PR `#34` merge | No | No | Merged | Merged | Not yet | Keep closed unless later defects reopen it |
| `codebase-search` | Active merge lane on `r36` / PR `#35` | No | No in this pass | Added | Added | Not yet | Merge PR `#35`; only reopen later if measured failures or review feedback appear |
| `ui-component-patterns` | Queued behind `codebase-search` | No | Not yet | Likely needed | Needed | Not yet | Re-open after `#35` lands unless review finds a defect in the active lane |
| `survey` | Research surface only | No | No | Maybe later | Already present | Not yet | Keep for landscape refresh only |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only for compact eval-backed skills | Revisit only after measured failures or review feedback |

## Locked direction

- Primary lane: merge PR `#35` for `codebase-search` now that the re-review
  pass stayed clean.
- Secondary lane: reopen the queue at `ui-component-patterns` after PR `#35`
  lands.
- Do not start a mutation loop for the large non-eval backlog before the
  active packaging PR resolves.

## Status

- Current state: `state-management` is closed upstream after merge, and
  `codebase-search` is now packaged, re-reviewed, and ready to merge on
  PR `#35`
- Blocker: team fanout is unavailable because the NanoClaw bridge wrapper has
  no underlying `scripts/agent-bridge.py`, but the merge path itself is not
  blocked
- Next owner: `nanoclaw_pd` to reopen the queue at `ui-component-patterns`
  after PR `#35` lands
- Stage: `merge`
