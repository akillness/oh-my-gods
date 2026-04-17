# Current Lock

Date: 2026-04-18

## Survey refresh

- Agent Skills still recommends compact `SKILL.md` entrypoints, progressive
  disclosure through `references/`, and only bundling scripts when the same
  deterministic helper keeps getting reinvented across runs.
- Agent Skills best practices still warn that oversized or over-comprehensive
  skills hurt invocation quality and context efficiency, which increases the
  value of collapsing duplicate principles skills into one canonical entrypoint:
  https://agentskills.io/skill-creation/best-practices
- Agent Skills eval guidance still recommends starting with a small realistic
  prompt set and adding objective assertions after the first pass, which
  supports adding evals to the next standards lane before any mutation loop.
- Claude Code still separates reusable instructions from isolated subagent
  execution, which reinforces explicit routing between always-on project rules,
  packaged skills, and delegated agents.
- Gemini CLI extensions still package prompts, MCP servers, and custom
  commands together, which keeps concise reusable packaging high leverage:
  https://google-gemini.github.io/gemini-cli/docs/extensions/
- OpenAI's latest Agents SDK update continues to push standardized long-horizon
  agent infrastructure, which strengthens the case for compact, well-routed
  reusable instructions instead of duplicated prose-heavy skills:
  https://openai.com/index/the-next-evolution-of-the-agents-sdk
- GitHub Copilot now exposes custom agents as a named reusable packaging
  surface, which reinforces the same market direction toward concise,
  specialized, non-overlapping agent packages:
  https://docs.github.com/en/copilot/concepts/agents/coding-agent/about-custom-agents
- Inference for this repo: after the `agent-configuration` merge, the
  highest-value remaining gap is duplicated collaboration-principles guidance
  split across `agent-development-principles` and `agent-principles`.
- `skill-autoresearch` is still not justified for the next lane because the
  stronger move is to canonicalize the duplicate pair first, then measure any
  remaining failures.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/best-practices
- https://agentskills.io/skill-creation/evaluating-skills
- https://code.claude.com/docs/en/sub-agents
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://openai.com/index/the-next-evolution-of-the-agents-sdk
- https://docs.github.com/en/copilot/concepts/agents/coding-agent/about-custom-agents

## Live GitHub state

- PR `#37` for `git-workflow` merged at `2026-04-15T11:09:19Z`:
  https://github.com/akillness/oh-my-gods/pull/37
- PR `#38` for `responsive-design` merged at `2026-04-15T13:09:48Z`:
  https://github.com/akillness/oh-my-gods/pull/38
- PR `#39` for `agent-workflow` merged at `2026-04-17T12:04:16Z`:
  https://github.com/akillness/oh-my-gods/pull/39
- PR `#40` for `agent-configuration` merged at `2026-04-17T14:06:40Z`:
  https://github.com/akillness/oh-my-gods/pull/40
- PR `#41` for the principles canonicalization lane is open:
  https://github.com/akillness/oh-my-gods/pull/41

## Audit snapshot

- Fresh repo-wide validation still passes at `0` errors and `43` warnings.
- `agent-configuration` is closed; reopening it in this run would be duplicate
  work.
- Remaining warning leaders are `bmad` (`5`), `bmad-idea` (`5`),
  `agent-development-principles` (`4`), `agent-principles` (`4`), and
  `opencontext` (`4`).
- `agent-development-principles` and `agent-principles` are the strongest next
  bounded lane because they overlap heavily on the same six-principle job while
  competing as peer defaults.
- Both principles skills currently have warning-level packaging debt: weak
  trigger phrasing plus missing `Instructions`, `Examples`, and `Best
  practices`.
- `agent-development-principles` and `agent-principles` also have no packaged
  `references/` or `evals/`, which makes them poor candidates for any later
  optimization loop until they are standardized.
- The sharper move is not to standardize both as peers. It is to make
  `agent-principles` the canonical skill and convert
  `agent-development-principles` into a compatibility alias.
- `scripts/` and `assets/` remain intentionally out of scope because this lane
  shows no repeated deterministic helper or reusable template need.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-workflow` | Merged lane | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `agent-configuration` | Merged lane via PR `#40` | No | No | Added in this run | Added in this run, including conflict-set coverage | Not yet | Keep closed unless measured routing failures or review feedback reopen it |
| `agent-principles` | Active canonicalization lane | No | No | Yes | Yes | Not yet | Package as the canonical collaboration-principles skill |
| `agent-development-principles` | Active alias lane | No | No | No | Yes | Not yet | Convert into a compatibility alias for `agent-principles` |
| `bmad` | Higher warning count but broader scope | No | Maybe later | Likely | Maybe later | Not yet | Keep deferred while narrower high-leverage lanes remain |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit after review feedback or failing eval runs |

## Locked direction

- Primary lane is open for this run: canonicalize the duplicate principles pair
  without widening into unrelated warning cleanup.
- Explicit support-surface decision:
  - `assets`: no; the lane needs guidance, not reusable media or templates
  - `scripts`: no; no repeated deterministic helper is showing up yet
  - `references`: yes for `agent-principles`; move the six-principle detail
    behind progressive disclosure instead of duplicating it in two entrypoints
  - `evals`: yes for both skills; the next review cycle needs canonical and
    alias-routing checks
- Do not start a mutation loop for the principles lane before the canonical
  packaging exists and review feedback or measured eval failures justify one.

## Status

- Current state: principles canonicalization lane packaged and recorded on open
  PR `#41`
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` improvement pass
- Stage: `pr-open`
