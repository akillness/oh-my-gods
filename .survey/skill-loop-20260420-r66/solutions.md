# Solutions

## Solutions

- *Keep the merge-complete lane closed*
  - `api-design` is already merged, so the loop should stop spending review
    budget there.
- *Package the next measurable support-gap lane*
  - Prefer a large workflow-critical skill that still lacks focused
    `references/` and `evals/`.
- *Defer mutation loops until packaging leaves objective misses*
  - `skill-autoresearch` should stay gated until the packaged lane still fails
    trigger, boundary, or execution checks.

## Frequency Ranking

1. Compact skill entrypoints plus support files
2. Review-first PR lanes before merge
3. Eval-backed trigger and boundary clarity
4. Mutation loops only after standardization is already in place

## Categories

- Packaging and discoverability
- Trigger quality and route clarity
- Git workflow boundary repair
- PR discipline for recurring maintenance lanes

## Curated Sources

- GitHub `gh skill`:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent Skills specification:
  https://agentskills.io/specification
- OpenAI developer docs:
  https://developers.openai.com/
- Anthropic Claude Code subagents:
  https://code.claude.com/docs/en/sub-agents
- LangChain Deep Agents skills:
  https://docs.langchain.com/oss/python/deepagents/skills

## Key Insight

- `git-submodule` is now the best next lane because it is still one of the
  larger general-purpose skills, still uses an older single-file structure, and
  still lacks route-focused `references/` and measurable `evals/`. The right
  bounded move is packaging and boundary repair, not a mutation loop.
