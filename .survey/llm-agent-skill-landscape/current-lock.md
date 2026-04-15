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
- PR `#34` for `state-management` is open, non-draft, and clean on branch
  `chore/skill-loop-pr-open-20260415-r35`:
  https://github.com/akillness/oh-my-gods/pull/34

## Audit snapshot

- Latest `origin/main` already includes the `deployment-automation` merge and
  still passes repo-wide validation with `0` hard errors.
- On `origin/main`, `state-management` is still a `553` line monolith with no
  packaged `references/` or `evals/`, which makes it the strongest active
  packaging gap.
- This branch shrinks `state-management` to a compact entrypoint, adds the
  missing support files, and keeps scripts and assets intentionally out of
  scope.
- This branch now passes target validation at `0` errors and `0` warnings for
  `state-management`.
- This branch passes repo-wide validation with `0` hard errors and `64`
  warnings, improving the prior `65` warning total by one.
- `codebase-search` remains the next queued monolith behind it at `534` lines,
  followed closely by `ui-component-patterns` at `530`.
- The missing bridge wrapper target
  (`/Users/jang_jennie/Documents/JYJ/nanoclaw/scripts/agent-bridge.py`) blocks
  fanout orchestration, but it does not block local repo execution.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `deployment-automation` | Closed after PR `#33` merge | No | No | Merged | Merged | No | Keep closed unless later defects reopen it |
| `state-management` | Active PR-open lane on `r35` | No | No in this pass | Added | Added | Not yet | Review PR `#34` and only then decide on merge or fixes |
| `codebase-search` | Queued behind the active state-management PR | No | Not yet | Likely needed | Needed | Not yet | Re-open as the next bounded packaging lane after `#34` review resolves |
| `ui-component-patterns` | Queued behind `codebase-search` | No | Not yet | Likely needed | Needed | Not yet | Keep queued unless the survey lock changes |
| `survey` | Research surface only | No | No | Maybe later | Already present | Not yet | Keep for landscape refresh only |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only for compact eval-backed skills | Revisit only after measured failures or review feedback |

## Locked direction

- Primary lane: review PR `#34` for `state-management` now that the packaging
  pass is clean and registered.
- Secondary lane: reopen the queue at `codebase-search` if the state-management
  PR merges cleanly.
- Do not start a mutation loop for the large non-eval backlog before the
  current PR-review lane resolves.

## Status

- Current state: `state-management` has moved from improvement into PR-open on
  PR `#34`, while `deployment-automation` is now closed upstream after merge
- Blocker: team fanout is unavailable because the NanoClaw bridge wrapper has
  no underlying `scripts/agent-bridge.py`, but the current PR-review path is
  not blocked
- Next owner: `nanoclaw_pd` to run the PR-review pass on `#34` in the next
  scheduled cycle
- Stage: `pr-open`
