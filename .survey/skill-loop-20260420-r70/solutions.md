# Solutions: recurring oh-my-gods skill loop

## Solutions

### Candidate lanes reviewed

1. `performance-optimization`
2. `monitoring-observability`
3. `skill-autoresearch`

### Frequency Ranking

1. `performance-optimization`
   - still ships as a generic single-file entrypoint with no focused
     `references/` or `evals/`
   - contains React-heavy recipe material even though `react-best-practices`
     already owns the React/Next performance lane
   - offers the cleanest next bounded repair: make it the cross-stack,
     measurement-led tuning skill and route stack-specific work out
2. `monitoring-observability`
   - external platform signal is strong, especially around tracing and agent
     observability
   - still missing support files and boundary guidance
   - kept second because the repo-local contradiction is less urgent than the
     current performance-lane overlap
3. `skill-autoresearch`
   - still not justified because the next target lacks baseline support
     packaging and eval coverage

## Categories

- Closed lane: `debugging` after PR `#67` merged
- Next improvement lane: `performance-optimization`
- Next survey candidate after that: `monitoring-observability`
- Deferred mutation lane: `skill-autoresearch` only after packaged review-clean
  targets still miss objective checks

## Curated Sources

- Agent Skills specification: https://agentskills.io/specification
- GitHub `gh skill` launch: https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- GitHub agent skills docs: https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- OpenAI Agents tracing: https://openai.github.io/openai-agents-python/tracing/
- LangSmith observability concepts: https://docs.langchain.com/langsmith/observability-concepts
- Claude sub-agents: https://code.claude.com/docs/en/sub-agents

## Key Insight

External signal still argues for stronger observability packaging, but the next
best *repo-local* bounded lane is `performance-optimization` because it has a
clear overlap conflict with `react-best-practices` and no support files yet.
That conflict is easier to fix in one PR than trying to solve the broader
observability surface first.
