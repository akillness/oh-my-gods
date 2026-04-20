# Solutions

- Cross-host skill systems continue to reinforce compact `SKILL.md`
  entrypoints plus optional `references/`, `scripts/`, `assets/`, and `evals/`
  instead of oversized inline cookbook prompts.
- GitHub's `gh skill` workflow and Copilot skill docs raise the value of
  portable, provenance-friendly directories with clear support-file boundaries.
- OpenAI's agent-evals guidance reinforces the value of reproducible evaluation
  gates before deeper optimization loops.
- Repo-local evidence now points to `data-analysis` as the strongest bounded
  next move because it remains generic and unpackaged while adjacent skills
  have already been standardized.

# Frequency Ranking

1. Compact `SKILL.md` plus focused references and evals
2. Clear route-outs between adjacent data, BI, observability, and log lanes
3. Eval-backed trigger and ownership checks
4. Optimization loops only after packaging and measured residual failures

# Categories

- Progressive-disclosure packaging
- Trigger precision and sibling-skill boundaries
- Eval-backed quality gates
- Deferred optimization loops

# Curated Sources

- Agent Skills specification: https://agentskills.io/specification
- GitHub agent skills docs: https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- GitHub Copilot CLI skill docs: https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills
- GitHub CLI `gh skill` launch: https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- OpenAI agent evals guide: https://platform.openai.com/docs/guides/agent-evals

# Key Insight

- `data-analysis` is now the strongest bounded lane because it is still a broad
  single-file skill with no local references or evals, and its overlap with BI,
  logs, anomaly hunting, and observability makes route-clean packaging
  immediately valuable.
