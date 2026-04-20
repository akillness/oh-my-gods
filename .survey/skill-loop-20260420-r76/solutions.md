# Solutions

- Cross-host skill systems continue to converge on compact `SKILL.md`
  entrypoints plus optional `references/`, `scripts/`, `assets/`, and `evals/`
  instead of giant inline prompt blobs.
- Current platform guidance keeps reinforcing discoverable, reusable skills
  with route-clean instructions and durable update paths.
- Repo-local evidence points to the next highest-value move being another
  workflow-critical skill that is still generic and unpackaged rather than
  reworking already-merged lanes.

# Frequency Ranking

1. Compact `SKILL.md` plus focused references and evals
2. Clear route-outs between overlapping sibling skills
3. Eval-backed trigger and output-shape checks
4. Optimization loops only after packaging and measured failures

# Categories

- Progressive-disclosure packaging
- Trigger precision and sibling-skill boundaries
- Eval-backed quality gates
- Deferred optimization loops

# Curated Sources

- Agent Skills specification: https://agentskills.io/specification
- GitHub agent skills docs: https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- GitHub CLI `gh skill` launch: https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Claude subagents docs: https://code.claude.com/docs/en/sub-agents
- OpenAI Agents SDK guide: https://platform.openai.com/docs/guides/agents-sdk/

# Key Insight

- `user-guide-writing` is now the strongest bounded lane because it is both
  broad and overlap-heavy, yet still lacks the support files and route-clean
  trigger surface already added to other high-reuse skills.
