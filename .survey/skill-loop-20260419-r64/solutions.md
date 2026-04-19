# Solutions

## Solutions

- *Compact contract-first skill packaging*
  - Keep `SKILL.md` small and decisive.
  - Move edge-case guidance into `references/`.
  - Add `evals/` that prove trigger quality and route-outs.
- *Route-out-first sibling boundaries*
  - Treat docs, auth implementation, testing, and schema/storage work as
    neighboring jobs with explicit handoffs.
- *Artifact-first API output*
  - Prefer OpenAPI outlines, GraphQL SDL sketches, endpoint tables, or design
    memos over implementation code.

## Frequency Ranking

1. Compact skill entrypoint plus support files
2. Explicit sibling-skill route-outs
3. Eval-backed trigger and boundary assertions
4. Mutation loops only after standardization leaves measured failures

## Categories

- Packaging and discoverability
- Contract boundary clarity
- Downstream handoff quality
- Eval-backed maintenance

## Curated Sources

- Agent Skills specification:
  https://agentskills.io/specification
- GitHub `gh skill` launch:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Claude Code subagents:
  https://docs.anthropic.com/en/docs/claude-code/sub-agents

## Key Insight

- For `oh-my-gods`, the highest-value remaining API-design improvement is not a
  bigger tutorial. It is the same packaging move that has already closed recent
  lanes successfully: sharpen the entrypoint, add focused references, add evals,
  sync `SKILL.toon`, and defer `skill-autoresearch` until the packaged lane
  still misses objective checks.
