# Context: oh-my-gods recurring skill improvement loop

## Workflow Context

The repo sits in the middle of a fast-moving agent-tooling ecosystem where official platforms now expose reusable skills, subagents, hooks, and automation surfaces as core product features rather than side patterns. That raises the bar for skill quality: descriptions need to trigger reliably, instructions need to be compact and loadable, and high-value workflow skills need evals before mutation-based optimization is worth the cost.

## Affected Users

| Role | Responsibility | Skill Level |
|------|----------------|-------------|
| Skill maintainer | Curate and evolve reusable skills across platforms | Advanced |
| Agent operator | Invoke skills during planning, research, and execution | Intermediate |
| Platform integrator | Port workflows between Claude, Codex, Gemini, and custom runtimes | Advanced |

## Current Workarounds

1. Maintainers manually patch descriptions and sections based on intuition, then rely on sparse real-world usage to discover trigger failures later.
2. Large workflow skills drift when the entrypoint duplicates operational detail that should live in supporting references or scripts.
3. Optimization work gets delayed because most skills lack evals, so there is no deterministic baseline for a mutation loop.

## Adjacent Problems

- Cross-platform concepts map imperfectly: one platform may expose hooks or rules directly while another pushes them into permissions or extensions.
- Large skill bodies compete with the same context budgets they are supposed to save.
- Repo-level inconsistency makes it hard to know whether a failure comes from weak instructions, weak triggers, or missing supporting files.

## User Voices

- OpenAI documents Codex as a workflow surface with reusable skills and automations: https://developers.openai.com/codex/
- Anthropic documents slash commands and subagents as first-class Claude Code features: https://code.claude.com/docs/en/slash-commands and https://code.claude.com/docs/en/sub-agents
- Google frames Gemini CLI extensions and custom commands as the packaging layer for prompts, MCP servers, and commands: https://google-gemini.github.io/gemini-cli/docs/extensions/ and https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html
- Agent Skills describes skills as folders of instructions, scripts, and resources that agents discover and load on demand: https://agentskills.io/home
- The open `skills` ecosystem keeps broadening the portability target; the current `vercel-labs/skills` README advertises support for Codex plus 40+ other agent surfaces and released `v1.5.0` on 2026-04-12: https://github.com/vercel-labs/skills
