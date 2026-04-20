# Solutions

- Keep the active lane on `pattern-detection` only long enough to review the
  open PR against the locked packaging goals
- Advance directly to merge when repo validation, skill validation, and diff
  review stay clean
- Defer `skill-autoresearch` again because no measured failure remains after the
  packaging pass

# Frequency Ranking

1. Review the open bounded PR and merge if clean
2. Avoid reopening the same lane without fresh evidence
3. Keep `skill-autoresearch` reserved for measured post-review failures

# Categories

- PR review hygiene
- standardization gatekeeping
- bounded recurring-loop progression

# Curated Sources

- Agent Skills specification: https://agentskills.io/specification
- GitHub skills overview: https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- GitHub `gh skill` launch: https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- OpenAI agent evals guidance: https://platform.openai.com/docs/guides/agent-evals
