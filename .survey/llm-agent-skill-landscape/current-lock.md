# Current Lock

Date: 2026-04-19

## Survey refresh

- No newer ecosystem signal displaced the packaging direction already locked in
  this survey: portable, standards-clean skill directories with progressive
  disclosure still outrank broad rewrites.
- GitHub launched `gh skill` on April 16, 2026, which strengthens the value of
  compact, provenance-friendly skill packaging:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent Skills still centers directory structure, progressive disclosure, and
  optional `references/`, `scripts/`, and `assets/` support files:
  https://agentskills.io/specification
- OpenAI's current developer surface continues to position Codex around
  agentic workflows, and OpenAI's current model guide explicitly highlights
  coding, computer use, and subagents:
  https://developers.openai.com/
  https://developers.openai.com/api/docs/models
- Anthropic and LangChain still reinforce subagents and packaged skill
  patterns as core workflow surfaces:
  https://docs.anthropic.com/en/docs/claude-code/sub-agents
  https://docs.langchain.com/oss/python/deepagents/skills

## Live GitHub state

- PR `#51` for `langextract` is merged:
  https://github.com/akillness/oh-my-gods/pull/51
- PR `#52` for `marketing-automation` is merged:
  https://github.com/akillness/oh-my-gods/pull/52
- PR `#53` for `agent-evaluation` is merged:
  https://github.com/akillness/oh-my-gods/pull/53
- PR `#54` for `survey` is merged:
  https://github.com/akillness/oh-my-gods/pull/54
- PR `#55` for `playwriter` is merged:
  https://github.com/akillness/oh-my-gods/pull/55
- PR `#56` for the React guidance lane is merged:
  https://github.com/akillness/oh-my-gods/pull/56

## Audit snapshot

- Repo-wide validation still passes with `0` errors and `8` warnings before
  this run's edits.
- `agent-evaluation` is closed after PR `#53` merged, so the loop should not
  keep re-reviewing that lane.
- `survey` is closed after PR `#54` merged, so the loop should not keep
  advertising it as active work.
- `playwriter` is closed after PR `#55` merged, so the loop should not keep
  treating it as active work.
- `react-best-practices` and `vercel-react-best-practices` are now closed after
  PR `#56` merged: the alias no longer carries its own duplicate `AGENTS.md`,
  the public README catalog matches the compatibility-alias wording, and the
  canonical/alias split keeps eval coverage on both sides.
- Official and primary-source signal keeps favoring this lane:
  - GitHub's new `gh skill` flow increases the value of compact,
    provenance-friendly skill packaging:
    https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
  - Agent Skills explicitly recommends canonical skills with optional support
    files instead of duplicated peers:
    https://agentskills.io/specification
  - OpenAI and Anthropic both keep emphasizing reusable skills plus subagents
    as first-class workflow surfaces:
    https://openai.com/codex/
    https://docs.anthropic.com/en/docs/claude-code/sub-agents

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `langextract` | Merged via PR `#51` after a bounded review follow-up | No | Existing helper refreshed | Added | Refreshed | No | Keep closed unless review feedback or new measured failures appear |
| `marketing-automation` | Merged via PR `#52` after a bounded standards pass | No | No | Added | Added | No | Keep closed unless review feedback or new measured failures appear |
| `agent-evaluation` | Merged via PR `#53` | No | No | Added | Added | Not yet | Keep the lane closed unless review feedback or new measured failures appear |
| `survey` | Merged via PR `#54` | No | No | Added | Refreshed | Not yet | Keep closed unless review feedback or new measured failures appear |
| `playwriter` | Merged via PR `#55` | No | No | Added install/session and MCP/security recovery support files | Refreshed | Not yet | Keep closed unless review feedback or new measured failures appear |
| `react-best-practices` | Merged via PR `#56` after a bounded review follow-up | No | No | Reuse bundled `AGENTS.md` | Added | Not yet | Keep closed unless review feedback or failing evidence reopens the lane |
| `vercel-react-best-practices` | Merged via PR `#56` after a bounded review follow-up | No | No | Point to canonical skill only | Added | Not yet | Keep closed unless review feedback or failing evidence reopens the lane |
| `ralphmode` | Active high-leverage warning lane | No | No | Existing permission profile reference is enough | Add now | Not yet | Tighten trigger wording and add evals before any mutation loop |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Move the active run to `ralphmode`, because current official surfaces from
  OpenAI, Anthropic, and GitHub keep increasing the value of safe automation,
  repo-scoped autonomy, and portable skill packaging.
- Fix the standards and trigger-quality gaps on `ralphmode` before considering
  `skill-autoresearch`; there is still no measured failure baseline to justify a
  mutation loop.

## Packaging decision for the active lane

- Active lane: `ralphmode`
  - Assets: no
  - Scripts: no
  - References: keep the existing `references/permission-profiles.md`
  - Evals: yes, add trigger and safety-boundary coverage for repo mode,
    sandbox-only YOLO mode, and Codex checkpoint behavior
  - Skill-autoresearch: still deferred until a standardized, eval-backed
    `ralphmode` shows measured failures

## Current state

- Current state: React guidance is closed after PR `#56` merged; the active
  `ralphmode` lane is now in PR review
- PR: https://github.com/akillness/oh-my-gods/pull/57
- Blocker: none
- Next owner: PR review path
- Stage: `pr-open`
