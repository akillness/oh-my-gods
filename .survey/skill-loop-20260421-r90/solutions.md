# Solutions

## Solutions

1. Package `web-design-guidelines` as a bounded audit skill with route-outs,
   references, and evals.
2. Leave the skill as-is and rely on the upstream Vercel command plus user
   judgment.
3. Replace the skill with a narrower accessibility-only surface.
4. Start a `skill-autoresearch` loop before packaging support files.

## Frequency Ranking

1. Package the skill with support files and bounded routing
2. Leave it thin and depend on live fetches only
3. Narrow it into accessibility-only review
4. Start measured mutation before packaging

## Categories

- Packaging and standardization: support files, route-outs, progressive
  disclosure
- Trigger quality: clearer description and neighboring-skill boundaries
- Validation: evals that preserve the broad-audit lane without swallowing
  narrower skills
- Optimization readiness: defer `skill-autoresearch` until the boundary is
  packaged and objective checks exist

## Curated Sources

- Agent Skills support-surface model:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- GitHub CLI skill authoring and optional resources:
  https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills
- Upstream Vercel review command:
  https://raw.githubusercontent.com/vercel-labs/web-interface-guidelines/main/command.md
- Agent Skills specification:
  https://agentskills.io/specification

## Key Insight

- `web-design-guidelines` is the strongest next lane because it sits on a live,
  externally maintained review ruleset but still lacks the local packaging that
  keeps the trigger boundary truthful and testable across hosts.
