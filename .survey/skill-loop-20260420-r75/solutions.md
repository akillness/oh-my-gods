# Solutions

- Portable agent-skill packaging continues to center on small entrypoints plus
  optional `references/`, `scripts/`, `assets/`, and `evals/`.
- Host platforms increasingly reuse the same skill-directory model rather than
  bespoke prompt blobs, which raises the value of compact and verifiable skill
  packages.
- Repo-local evidence still points to the same highest-leverage move: standardize
  one bounded high-usage skill at a time instead of broad catalog rewrites.

# Frequency Ranking

1. Compact `SKILL.md` plus optional support files
2. Eval-backed trigger and route-out checks
3. Alias or compatibility layers kept thin
4. Mutation loops only after measured failures remain

# Categories

- Packaging and progressive disclosure
- Trigger quality and boundary repair
- Measurable eval surfaces
- Deferred optimization loops

# Curated Sources

- Agent Skills specification: https://agentskills.io/specification
- GitHub Copilot agent skills docs: https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- GitHub Copilot changelog: https://github.blog/changelog/2025-12-18-github-copilot-now-supports-agent-skills

# Key Insight

- `environment-setup` is the strongest remaining bounded lane because it is
  both widely reusable and still packaged like a generic snippet dump rather
  than a route-clean, eval-backed skill.
