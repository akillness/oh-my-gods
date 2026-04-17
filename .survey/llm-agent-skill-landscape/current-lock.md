# Current Lock

Date: 2026-04-18

## Survey refresh

- Agent Skills still recommends compact `SKILL.md` entrypoints, progressive
  disclosure through `references/`, and only bundling scripts when the same
  deterministic helper keeps getting reinvented across runs.
- Agent Skills best practices still warn that oversized or over-comprehensive
  skills hurt invocation quality and context efficiency, which keeps
  standards-clean packaging high leverage:
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
- GitHub Copilot exposes custom agents as a named reusable packaging surface,
  which reinforces the same market direction toward concise, specialized,
  non-overlapping agent packages:
  https://docs.github.com/en/copilot/concepts/agents/coding-agent/about-custom-agents
- Inference for this repo: after the principles lane merged, the highest-value
  remaining bounded gap is `opencontext`, not a broader BMAD pass.
- `skill-autoresearch` is still not justified for the next lane because the
  stronger move is to standardize `opencontext` first, then measure any
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
- PR `#41` for the principles canonicalization lane merged at `2026-04-17T16:02:27Z`:
  https://github.com/akillness/oh-my-gods/pull/41

## Audit snapshot

- Fresh repo-wide validation still passes at `0` errors and `43` warnings.
- `agent-configuration` is closed; reopening it in the next run would be
  duplicate work.
- Remaining warning leaders are `bmad` (`5`), `bmad-idea` (`5`), and
  `opencontext` (`4`).
- The principles lane is now merged, so reopening it in the next run would be
  duplicate work unless measured failures appear.
- `opencontext` is the strongest next bounded lane because it still has a weak
  trigger description and is missing `Instructions`, `Examples`, and `Best
  practices`.
- `opencontext` also has no packaged `references/` or `evals/`, which makes it
  a better next standardization target than starting a broader BMAD lane.
- `bmad` and `bmad-idea` remain larger warning leaders, but they are broader
  orchestration surfaces and therefore worse fits for the next bounded hourly
  pass.
- `scripts/` and `assets/` remain intentionally out of scope for
  `opencontext` unless repeated validation work proves a deterministic helper
  or reusable template is actually needed.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-workflow` | Merged lane | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `agent-configuration` | Merged lane via PR `#40` | No | No | Added in this run | Added in this run, including conflict-set coverage | Not yet | Keep closed unless measured routing failures or review feedback reopen it |
| `agent-principles` | Merged canonical lane via PR `#41` | No | No | Added | Added | Not yet | Keep closed unless measured failures or review feedback reopen it |
| `agent-development-principles` | Merged alias lane via PR `#41` | No | No | No | Added | Not yet | Keep closed as a compatibility alias unless routing failures appear |
| `opencontext` | Next bounded standards candidate | No | No by default | Likely | Yes | Not yet | Standardize the main entrypoint, then add support files only if they reduce ambiguity |
| `bmad` | Higher warning count but broader scope | No | Maybe later | Likely | Maybe later | Not yet | Keep deferred while narrower high-leverage lanes remain |
| `bmad-idea` | Higher warning count but broader scope | No | Maybe later | Likely | Maybe later | Not yet | Keep deferred while narrower high-leverage lanes remain |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit after review feedback or failing eval runs |

## Locked direction

- The merge lane is complete for this run.
- The next bounded lane is `opencontext`, without widening into unrelated
  warning cleanup.
- Explicit support-surface decision:
  - `assets`: no; the next lane needs guidance, not reusable media or templates
  - `scripts`: no by default; only add one if repeated deterministic helper
    work appears during the `opencontext` pass
  - `references`: likely yes for `opencontext`; move detailed setup and
    provider-specific guidance behind progressive disclosure if the main file
    remains too broad
  - `evals`: yes for `opencontext`; add trigger-quality and routing coverage
    before any mutation loop
- Do not start a mutation loop for `opencontext` before the standardized
  packaging exists and review feedback or measured eval failures justify one.

## Status

- Current state: principles canonicalization lane merged via PR `#41`; next
  bounded lane locked to `opencontext`
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` improvement pass
- Stage: `merge`
