# Solutions

## Solutions

- *Keep merged lanes closed*
  - `git-submodule` is already merged, so the loop should stop spending review
    budget there.
- *Prioritize packaging and trigger-quality over mutation loops*
  - The biggest repo-wide gap is still uneven `references/` and `evals/`
    coverage, not missing skill count.
- *Open the next bounded docs lane*
  - Package one broad single-file skill that still lacks route-outs and
    measurable coverage.

## Frequency Ranking

1. Compact skill entrypoints with support files
2. Trigger-focused descriptions and route-outs
3. Eval-backed distribution quality before publish or reuse
4. Mutation loops only after packaging leaves measurable failures

## Categories

- Packaging and progressive disclosure
- Trigger quality and route clarity
- Publish-ready skill distribution
- Eval-backed maintenance

## Curated Sources

- GitHub `gh skill`:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent Skills specification:
  https://agentskills.io/specification
- Agent Skills description tuning:
  https://agentskills.io/skill-creation/optimizing-descriptions
- OpenAI eval guidance:
  https://developers.openai.com/api/docs/guides/agent-evals
  https://developers.openai.com/api/docs/guides/evaluation-best-practices
- LangChain Deep Agents skills:
  https://docs.langchain.com/oss/python/deepagents/skills

## Key Insight

- `api-documentation` is the strongest next lane because it remains a large
  single-file legacy skill with no `references/` or `evals/`, and it sits next
  to the already-closed `api-design` lane. The highest-value bounded move is a
  packaging and boundary-repair pass, not a mutation loop.
