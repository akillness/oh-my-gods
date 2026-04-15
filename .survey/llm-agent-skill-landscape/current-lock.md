# Current Lock

Date: 2026-04-15

## Survey refresh

- Agent Skills best practices still recommend keeping `SKILL.md` under
  `500` lines and moving detailed guidance into `references/` through
  progressive disclosure.
- OpenAI Codex docs still expose `skills`, `rules`, and `hooks` as
  first-class configuration and workflow surfaces, which reinforces compact,
  reusable skill entrypoints instead of monolithic prompt files.
- Claude sub-agents, Gemini custom commands and extensions, and OpenClaw
  skills all continue to reward shareable packaged instruction surfaces over
  one-off prompt mutation.
- A2A `1.0` still increases pressure toward explicit capability disclosure and
  durable interoperability contracts.
- Inference for this repo: packaging-first remains the right posture, but now
  that the largest remaining responsive-layout monolith has been packaged into
  a PR-open lane, the next highest-leverage gap shifts toward warning-heavy
  workflow skills with weak trigger phrasing and missing standard sections.
- `skill-autoresearch` is still justified only after a compact eval-backed
  skill shows measured failures or attracts review feedback.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/best-practices
- https://agentskills.io/skill-creation/evaluating-skills
- https://developers.openai.com/codex/noninteractive
- https://code.claude.com/docs/en/sub-agents
- https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://a2a-protocol.org/latest/announcing-1.0/
- https://docs.openclaw.ai/zh-CN/tools/creating-skills

## Live GitHub state

- PR `#37` for `git-workflow` merged at `2026-04-15T12:09:48Z`:
  https://github.com/akillness/oh-my-gods/pull/37
- PR `#38` for `responsive-design` is open, non-draft, and based on branch
  `chore/skill-loop-pr-open-20260415-r39`:
  https://github.com/akillness/oh-my-gods/pull/38

## Audit snapshot

- Fresh repo-wide validation now passes at `0` errors and `60` warnings.
- On `main`, `responsive-design` was a `514` line monolith with no packaged
  `references/`, `evals/`, `scripts/`, or `assets`.
- This branch reduces `responsive-design` to a `194` line entrypoint, adds
  three focused `references/` files plus `evals/`, and keeps `scripts/` and
  `assets` intentionally out of scope.
- Target validation now passes at `0` errors and `0` warnings for
  `responsive-design`.
- Targeted audit checks show `agent-workflow` still carries `5` warnings and
  `agent-configuration` still carries `4`, while `code-refactoring` is already
  standards-clean at `496` lines with `0` warnings.
- Inference for the next queued lane: after PR `#38` is reviewed and merged,
  `agent-workflow` should move ahead of clean sub-500 skills because trigger
  quality and missing progressive-disclosure sections now represent the
  sharper remaining standards debt.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `responsive-design` | Active PR-open lane on `r39` / PR `#38` | No | No | Added in this run | Added in this run | Not yet | Review PR `#38`; merge if clean |
| `agent-workflow` | Queued standards lane | No | No | Likely needed | Likely needed | Not yet | Re-open after `responsive-design` review or merge |
| `agent-configuration` | Queued follow-up standards lane | No | No | Likely needed | Maybe later | Not yet | Keep behind `agent-workflow` |
| `code-refactoring` | Clean, below line-cap guidance | No | No | Not urgent | Not urgent | Not yet | Keep deferred unless a review or usage issue reopens it |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only for compact eval-backed skills with measured failures | Revisit after PR review feedback or failing eval runs |

## Locked direction

- Primary lane: review PR `#38` for duplicate work, missing improvements, and
  remaining standardization gaps.
- Secondary lane: merge PR `#38` if the review is clean.
- Next queued improvement lane after merge: `agent-workflow`.
- Do not start a mutation loop for `responsive-design` before review feedback
  or measured eval failures justify one.

## Status

- Current state: `responsive-design` is packaged and opened on PR `#38`
- Blocker: none on the active lane beyond pending review outcome
- Next owner: `nanoclaw_pd` to review PR `#38` on the next scheduled run, then
  merge or patch as needed
- Stage: `pr-open`
