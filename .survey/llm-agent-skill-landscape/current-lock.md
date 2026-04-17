# Current Lock

Date: 2026-04-17

## Survey refresh

- Agent Skills still recommends compact `SKILL.md` entrypoints, progressive
  disclosure through `references/`, and only bundling scripts when the same
  deterministic helper keeps getting reinvented across runs.
- Agent Skills eval guidance still recommends starting with a small realistic
  prompt set and adding objective assertions after the first pass, which
  supports adding evals to the next standards lane before any mutation loop.
- Claude Code still separates reusable instructions from isolated subagent
  execution, which reinforces explicit routing between always-on project rules,
  packaged skills, and delegated agents.
- Gemini CLI extensions still package prompts, MCP servers, and custom
  commands together, which raises the value of a configuration skill that helps
  users choose the right packaging surface instead of treating every request as
  a monolithic prompt-file edit.
- OpenAI Codex docs still position skills and agent-team workflows as durable
  learning surfaces, which keeps configuration hygiene and scope selection high
  leverage for this repo.
- Inference for this repo: after the `agent-workflow` merge, the highest-value
  remaining gap is no longer workflow packaging. It is configuration guidance
  that still lacks strong trigger phrasing, standard sections, and packaged
  support files for scope, guardrails, and team sharing.
- `skill-autoresearch` is still not justified for the next lane until the
  compact packaged version exists and either eval evidence or review feedback
  shows measured failures.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/best-practices
- https://agentskills.io/skill-creation/evaluating-skills
- https://developers.openai.com/codex
- https://code.claude.com/docs/en/sub-agents
- https://google-gemini.github.io/gemini-cli/docs/extensions/

## Live GitHub state

- PR `#37` for `git-workflow` merged at `2026-04-15T11:09:19Z`:
  https://github.com/akillness/oh-my-gods/pull/37
- PR `#38` for `responsive-design` merged at `2026-04-15T13:09:48Z`:
  https://github.com/akillness/oh-my-gods/pull/38
- PR `#39` for `agent-workflow` merged at `2026-04-17T12:04:16Z`:
  https://github.com/akillness/oh-my-gods/pull/39
- PR `#40` for `agent-configuration` merged at `2026-04-17T14:06:40Z`:
  https://github.com/akillness/oh-my-gods/pull/40

## Audit snapshot

- Fresh repo-wide validation still passes at `0` errors and `55` warnings.
- `agent-workflow` is now closed; reopening it in this run would be duplicate
  work.
- Remaining warning leaders are `bmad` (`5`), `bmad-idea` (`5`),
  `agent-configuration` (`4`), `agent-development-principles` (`4`),
  `agent-principles` (`4`), and `opencontext` (`4`).
- `agent-configuration` is the strongest next bounded lane because it sits in a
  high-leverage cross-platform surface: instruction files, hooks/permissions,
  skills/plugins/extensions, and team sharing.
- On `main`, `agent-configuration` is a `368` line guide with `4` warnings:
  weak trigger phrasing plus missing `Examples`, `Best practices`, and
  `References`.
- `agent-configuration` also has no packaged `references/` or `evals/`, which
  makes it weaker than the recently standardized workflow skills.
- PR `#40` rewrites `agent-configuration` into a `180` line entrypoint with
  imperative triggering, sibling routing, scope-first configuration triage,
  and packaged references plus evals.
- Target validation now passes at `0` errors and `0` warnings for
  `agent-configuration`.
- Repo-wide validation remains at `0` errors and drops from `55` to
  `51` warnings.
- Review found one bounded discovery gap: `agent-configuration` still overlapped
  too much with `agent-workflow` around shorthand such as shared config, daily
  flow, and MCP usage.
- This run tightened the `agent-configuration` description, synced
  `SKILL.toon` with the sibling boundary and least-privilege framing, and added
  a conflict-set eval that separates configuration scope from day-to-day
  workflow questions.
- `scripts/` and `assets/` remain intentionally out of scope because this lane
  still shows no repeated deterministic helper or reusable template need.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-workflow` | Merged lane | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `agent-configuration` | Merged lane via PR `#40` | No | No | Added in this run | Added in this run, including conflict-set coverage | Not yet | Keep closed unless measured routing failures or review feedback reopen it |
| `agent-development-principles` | Queued follow-up lane | No | No | Likely | Maybe later | Not yet | Keep behind `agent-configuration` |
| `agent-principles` | Queued follow-up lane | No | No | Likely | Maybe later | Not yet | Keep behind `agent-configuration` |
| `bmad` | Higher warning count but broader scope | No | Maybe later | Likely | Maybe later | Not yet | Keep deferred while narrower high-leverage lanes remain |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit after review feedback or failing eval runs |

## Locked direction

- Primary lane is closed: PR `#40` merged after the review pass fixed the only
  bounded overlap gap without widening scope.
- Explicit support-surface decision:
  - `assets`: no; the lane needs guidance, not reusable media or templates
  - `scripts`: no; no repeated deterministic helper is showing up yet
  - `references`: yes; scope, guardrails, and team-sharing details should move
    behind progressive disclosure
  - `evals`: yes; the next review cycle needs trigger and routing checks
- Do not start a mutation loop for `agent-configuration` before PR review
  feedback or measured eval failures justify one. The new overlap eval makes
  that future decision easier if the skill still misroutes.

## Status

- Current state: `agent-configuration` is packaged, reviewed, and merged on
  `#40`
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` improvement pass
- Stage: `merge`
