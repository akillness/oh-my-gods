# Context: recurring oh-my-gods skill loop

## Workflow Context

The recurring loop had already closed `performance-optimization` after PR `#68`
merged on April 20, 2026. That left `monitoring-observability` as the sharpest
remaining repo-local contradiction: it still shipped as a large generic recipe
dump while adjacent packaged lanes had moved to compact routing-first entry
points with `references/` and `evals/`.

## Affected Users

- skill-pack maintainers deciding which lane to package next
- agent hosts that rely on concise trigger text for correct skill activation
- end users who need telemetry design, dashboards, alerting, or tracing advice
  without being dropped into vendor-specific setup snippets

## Current Workarounds

- rely on a long inline `SKILL.md` with Prometheus/Grafana examples
- infer boundaries from neighboring skills instead of from this skill itself
- skip measurable trigger checks because the skill has no local evals

## Adjacent Problems

- route confusion with `log-analysis`, `debugging`, and
  `performance-optimization`
- weak progressive disclosure because no focused references existed
- no clear gate for when `skill-autoresearch` is worth the extra loop cost

## User Voices

- Agent Skills keeps reinforcing compact entrypoints plus on-demand support
  files as the preferred packaging model: https://agentskills.io/specification
- GitHub's `gh skill` launch raises the value of portable, provenance-friendly
  skills that can be installed and updated cleanly:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Official docs from GitHub, OpenAI, and LangChain all keep observability and
  tracing visible as core operator surfaces:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
  https://openai.github.io/openai-agents-python/tracing/
  https://docs.langchain.com/langsmith/observability-concepts
