# Context

## Workflow Context

- The ecosystem signal strengthened again around portable skill packaging, not
  oversized inline instructions. GitHub's April 16, 2026 `gh skill` launch
  makes installation, updates, and publication more visible, which raises the
  value of well-scoped skill directories with support files.
- Agent Skills still centers progressive disclosure: compact `SKILL.md`
  entrypoints, on-demand `references/`, optional `scripts/` and `assets/`, and
  validation-friendly packaging.
- OpenAI, Anthropic, and LangChain all continue to position reusable skills,
  subagents, and review-centric agent workflows as first-class surfaces. That
  increases the cost of vague routing descriptions and under-packaged legacy
  skills.

## Affected Users

- Maintainers choosing the next bounded lane after `api-design`
- Agents that need predictable routing between neighboring workflow skills
- Reviewers who need PR-ready, provenance-friendly skill packaging

## Current Workarounds

- Keep relying on large legacy single-file skills that technically validate but
  still lack route clarity and measurable support files.
- Re-run survey work manually each cycle because the lock state drifts behind
  GitHub PR state.
- Defer trigger tuning decisions to human judgment when a skill has no focused
  references or eval assertions.

## Adjacent Problems

- A clean open PR can still leave the repo's survey lock stale if the next run
  is not queued explicitly.
- Starting `skill-autoresearch` before a lane has basic packaging discipline
  still optimizes the wrong layer.
- The remaining highest-risk legacy skills are now the large general-purpose
  ones with no `references/` or `evals/` at all.

## User Voices

- GitHub CLI skill support:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent Skills specification:
  https://agentskills.io/specification
- OpenAI developer surface for Codex:
  https://developers.openai.com/
- Anthropic Claude Code subagents:
  https://docs.anthropic.com/en/docs/claude-code/sub-agents
- LangChain Deep Agents skills:
  https://docs.langchain.com/oss/javascript/deepagents/skills
- GitHub Copilot review guidance:
  https://docs.github.com/copilot/how-tos/use-copilot-agents/coding-agent/review-copilot-prs
