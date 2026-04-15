# Current Lock

Date: 2026-04-15

## Survey refresh

- Agent Skills still centers reusable skill packages on `SKILL.md` plus
  optional support directories such as `references/`, `scripts/`, `assets`,
  and `evals`.
- OpenAI Codex guidance still favors reusable skills and automations, which
  reinforces compact workflow entrypoints and explicit follow-on execution
  surfaces instead of monolithic prompt files.
- Claude sub-agents plus Gemini custom commands and extensions still reward
  concise trigger text and packaged support files rather than buried longform
  instructions.
- A2A `1.0` continues to push explicit capability disclosure and clearer
  interoperability contracts between agent surfaces.
- `skill-autoresearch` is still justified only after a target skill is compact,
  eval-backed, and showing measured failures or clear review feedback.
- Inference for this repo: packaging-first work remains higher leverage than
  prompt mutation because `git-workflow` was still the largest remaining
  monolith after PR `#36` merged, while `responsive-design` remains queued
  behind it and already-under-500-line skills are lower urgency.
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
- https://a2a-protocol.org/latest/announcing-1.0/

## Live GitHub state

- PR `#36` for `ui-component-patterns` merged at
  `2026-04-15T10:07:04Z`:
  https://github.com/akillness/oh-my-gods/pull/36
- PR `#37` for `git-workflow` is open, non-draft, and based on branch
  `chore/skill-loop-pr-open-20260415-r38`:
  https://github.com/akillness/oh-my-gods/pull/37

## Audit snapshot

- Latest live GitHub state confirms `ui-component-patterns` is closed upstream
  after PR `#36` merged and `git-workflow` is the next active lane on PR `#37`.
- On `main`, `git-workflow` was the largest remaining monolith at `526` lines
  with no packaged `references/`, `evals/`, `scripts/`, or `assets`.
- This branch shrinks `git-workflow` to a `177` line entrypoint, adds focused
  `references/` and `evals/`, and keeps scripts and assets intentionally out
  of scope.
- This run validated `git-workflow`, re-ran repo-wide validation, opened
  PR `#37`, and confirmed the branch stays bounded to the packaged
  `git-workflow` lane plus survey-lock files.
- Target validation now passes at `0` errors and `0` warnings for
  `git-workflow`.
- Repo-wide validation now stays at `0` hard errors and drops from `62` to
  `61` warnings.
- `responsive-design` is now the next queued monolith at `515`, while
  `code-refactoring` is already below the 500-line guidance threshold.
- The missing bridge wrapper target
  (`/Users/jang_jennie/Documents/JYJ/nanoclaw/scripts/agent-bridge.py`) blocks
  fanout orchestration, but it does not block local repo execution.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `deployment-automation` | Closed after PR `#33` merge | No | No | Merged | Merged | No | Keep closed unless later defects reopen it |
| `state-management` | Closed after PR `#34` merge | No | No | Merged | Merged | Not yet | Keep closed unless later defects reopen it |
| `codebase-search` | Closed after PR `#35` merge | No | No in that pass | Added | Added | Not yet | Keep closed unless later review feedback or measured failures reopen it |
| `ui-component-patterns` | Closed after PR `#36` merge | No | No | Added | Added | Not yet | Keep closed unless later review feedback reopens it |
| `git-workflow` | Active PR-open lane on `r38` / PR `#37` | No | No | Added in this run | Added in this run | Not yet | Review PR `#37` next run; only reopen implementation if that review finds a bounded gap |
| `responsive-design` | Queued behind `git-workflow` | No | Not yet | Likely needed | Needed | Not yet | Re-open after `#37` lands unless review finds a defect in the active lane |
| `survey` | Research surface only | No | No | Maybe later | Already present | Not yet | Keep for landscape refresh only |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only for compact eval-backed skills | Revisit only after measured failures or review feedback |

## Locked direction

- Primary lane: review PR `#37` for `git-workflow` next run and move it to
  merge if the review stays clean.
- Secondary lane: reopen the queue at `responsive-design` only after PR `#37`
  lands.
- Do not start a mutation loop for `git-workflow` before post-review feedback
  or measured failures justify one.

## Status

- Current state: `git-workflow` is packaged, standards-clean, and opened on
  PR `#37`
- Blocker: team fanout is unavailable because the NanoClaw bridge wrapper has
  no underlying `scripts/agent-bridge.py`, but the PR lane itself is not
  blocked
- Next owner: `nanoclaw_pd` to review PR `#37` on the next scheduled run and
  either merge it or apply one bounded follow-up
- Stage: `pr-open`
