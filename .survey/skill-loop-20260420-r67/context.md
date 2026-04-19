# Context

## Workflow Context

- The current skill ecosystem still rewards compact entrypoints plus
  progressive-disclosure support files over long monolithic `SKILL.md` files.
- GitHub's April 16, 2026 `gh skill` launch makes publish-ready packaging more
  valuable because discovery, install, update, and publish paths are now
  first-class.
- Agent Skills still treats `name` and `description` as the activation surface,
  so broad descriptions and missing route-outs carry more cost as the catalog
  grows.
- Local repo inventory shows `80` skills total, but only `52` currently ship
  `references/` and only `57` ship `evals/`, so packaging coverage is still
  uneven even though spec compliance is clean.

## Affected Users

- Maintainers deciding the next bounded lane after `git-submodule` merged
- Agent hosts that need reliable routing between `api-documentation`,
  `api-design`, `authentication-setup`, `backend-testing`, and
  `user-guide-writing`
- Reviewers who need one focused PR per maintenance cycle

## Current Workarounds

- Leave older single-file skills technically valid but under-packaged
- Rely on human judgment when a broad docs skill does not say when to route
  work to adjacent skills
- Defer eval-backed trigger checks until after a skill has already drifted

## Adjacent Problems

- Running `skill-autoresearch` before packaging and eval assertions are in
  place still optimizes the wrong layer
- `api-design` is already closed, so the next docs-oriented lane must avoid
  re-opening contract design work
- Generic documentation requests can blur into auth implementation or backend
  testing unless route-outs are explicit

## User Voices

- GitHub `gh skill` changelog:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent Skills specification:
  https://agentskills.io/specification
- Agent Skills description tuning:
  https://agentskills.io/skill-creation/optimizing-descriptions
- OpenAI evaluation guidance:
  https://developers.openai.com/api/docs/guides/agent-evals
  https://developers.openai.com/api/docs/guides/evaluation-best-practices
- Anthropic Claude Code subagents:
  https://code.claude.com/docs/en/sub-agents
- LangChain Deep Agents skills:
  https://docs.langchain.com/oss/python/deepagents/skills
