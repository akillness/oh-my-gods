# Current Lock

Date: 2026-04-17

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
- Agent Skills eval guidance still recommends starting with a few realistic
  prompts and bundling scripts only when repeated work keeps showing up, which
  supports leaving `responsive-design` script-free for now.
- Inference for this repo: packaging-first remains the right posture, but now
  that the largest remaining responsive-layout monolith has been packaged and
  reviewed cleanly, the next highest-leverage gap shifts toward warning-heavy
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
- PR `#38` for `responsive-design` merged at `2026-04-15T15:03:25Z`:
  https://github.com/akillness/oh-my-gods/pull/38
- PR `#39` for `agent-workflow` is now the active open lane on branch
  `chore/skill-loop-pr-open-20260417-r40`:
  https://github.com/akillness/oh-my-gods/pull/39

## Audit snapshot

- Fresh repo-wide validation now passes at `0` errors and `55` warnings.
- `responsive-design` no longer blocks the queue because PR `#38` is merged.
- On `main`, `agent-workflow` was a `289` line command catalog with `5`
  warnings, weak trigger phrasing, and no packaged `references/`, `evals/`,
  `scripts/`, or `assets`.
- PR `#39` rewrites `agent-workflow` into a `194` line entrypoint with
  imperative triggering, sibling routing, workflow-triage instructions,
  examples, and a bounded references surface.
- This branch adds three focused `references/` files plus `evals/` for
  session/context hygiene, repo-delivery loops, and MCP plus multi-agent
  patterns.
- Target validation now passes at `0` errors and `0` warnings for
  `agent-workflow`.
- `scripts/` and `assets/` remain intentionally out of scope because the audit
  still shows no repeated deterministic helper or bundled template need.
- Targeted audit checks still show `agent-configuration` at `4` warnings, which
  makes it the next queued standards lane unless PR review or eval evidence
  reopens `agent-workflow`.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `responsive-design` | Merged lane | No | No | Already added | Already added | Not yet | Keep closed unless review feedback or future failures reopen it |
| `agent-workflow` | Active PR-open lane on `r40` / PR `#39` | No | No | Added in this run | Added in this run | Not yet | Review PR `#39` for duplicate work, missing improvements, or standardization gaps |
| `agent-configuration` | Queued follow-up standards lane | No | No | Likely needed | Maybe later | Not yet | Keep behind `agent-workflow` |
| `code-refactoring` | Clean, below line-cap guidance | No | No | Not urgent | Not urgent | Not yet | Keep deferred unless a review or usage issue reopens it |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only for compact eval-backed skills with measured failures | Revisit after PR review feedback or failing eval runs |

## Locked direction

- Primary lane: review PR `#39`; the packaging pass is complete and the next run
  should check for duplicate work, missing improvements, or remaining
  standardization gaps before any merge action.
- Next queued improvement lane after `agent-workflow`: `agent-configuration`.
- Do not start a mutation loop for `agent-workflow` before review feedback or
  measured eval failures justify one.

## Status

- Current state: `agent-workflow` is packaged, validated, and open on PR `#39`
- Blocker: none; the active task is now PR review rather than more packaging
- Next owner: `nanoclaw_pd` to review PR `#39`, then either apply one bounded
  follow-up update or move the lane to merge
- Stage: `pr-open`
