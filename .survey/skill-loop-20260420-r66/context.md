# Context

## Workflow Context

- The current ecosystem still rewards compact skill entrypoints with
  progressive-disclosure support files instead of large inline instructions.
- GitHub's April 16, 2026 `gh skill` launch increases the value of portable,
  provenance-friendly skills that can be installed and updated cleanly across
  hosts.
- Agent Skills continues to emphasize directory structure, optional
  `references/`, `scripts/`, `assets/`, and eval-friendly packaging.
- OpenAI, Anthropic, and LangChain still treat skills, reusable workflows, and
  subagent routing as first-class agent surfaces, so vague trigger boundaries
  now carry more cost than before.

## Affected Users

- Maintainers deciding the next bounded lane after `api-design`
- Agent hosts that need reliable routing between `git-submodule`,
  `git-workflow`, and package-manager delivery skills
- Reviewers who need one focused PR per loop run

## Current Workarounds

- Leave older single-file skills technically valid but under-packaged.
- Rely on human judgment for route clarity when a skill has no focused
  references or eval assertions.
- Let survey lock files drift behind GitHub merge state until the next manual
  pass.

## Adjacent Problems

- Starting `skill-autoresearch` before a lane has basic packaging discipline
  still optimizes the wrong layer.
- Generic Git help can over-trigger into submodule help unless the boundary to
  `git-workflow` is explicit.
- CI and private-repo submodule setup keep showing up as operational edge cases
  even when the core add/update commands are already known.

## User Voices

- GitHub `gh skill` changelog:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent Skills specification:
  https://agentskills.io/specification
- OpenAI developer docs:
  https://developers.openai.com/
- Anthropic Claude Code subagents:
  https://code.claude.com/docs/en/sub-agents
- LangChain Deep Agents skills:
  https://docs.langchain.com/oss/python/deepagents/skills
