# Solutions

## Solutions

- *Merge the clean lane promptly*
  - If the active PR is review-clean and validator-clean, move it to merge
    instead of reopening packaged files unnecessarily.
- *Queue the next support-gap lane from measured repo evidence*
  - Prefer the largest remaining workflow-critical skill with no focused
    `references/` and no `evals/`.
- *Keep `skill-autoresearch` gated behind measured misses*
  - Use it only after a packaged lane still fails objective trigger or boundary
    checks.

## Frequency Ranking

1. Portable skill packaging with compact entrypoints and support files
2. Review-first PR workflows before merge
3. Eval-backed routing and boundary clarity
4. Mutation loops only after standardization leaves measurable failures

## Categories

- Packaging and discoverability
- PR review and merge discipline
- Trigger quality and route clarity
- Next-lane prioritization

## Curated Sources

- GitHub `gh skill` launch:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent Skills specification:
  https://agentskills.io/specification
- OpenAI developer surface:
  https://developers.openai.com/
- Anthropic Claude Code subagents:
  https://docs.anthropic.com/en/docs/claude-code/sub-agents
- LangChain Deep Agents skills:
  https://docs.langchain.com/oss/javascript/deepagents/skills
- GitHub Copilot PR review guidance:
  https://docs.github.com/copilot/how-tos/use-copilot-agents/coding-agent/review-copilot-prs

## Key Insight

- The active `api-design` lane does not need more packaging work on this run.
  The bounded change set is already review-clean. The next highest-value gap is
  `git-submodule`: it is still a large general-purpose skill with generic
  wording, no focused `references/`, and no `evals/`, which makes it the best
  candidate for the next improvement run after PR `#64` merges.
