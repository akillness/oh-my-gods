# Solutions

## Solution Inventory

1. Treat skill quality as a registry/search problem, not only a writing problem
   - Registry/MCP surfaces increasingly search by intent and fetch files progressively.
   - Evidence:
     - Tech Leads Club MCP server exposes `list_skills`, `search_skills`, `read_skill`, and `fetch_skill_files`: https://github.com/tech-leads-club/agent-skills
     - Microsoft Learn documents the standard directory structure with `references/`, `scripts/`, and `assets/`: https://learn.microsoft.com/en-us/agent-framework/agents/skills

2. Use validation plus evals as the maintenance baseline
   - Strong repos now pair frontmatter validation with eval or reference expectations.
   - Evidence:
     - LambdaTest publishes a validator that checks YAML, line counts, reference files, and cross-references: https://github.com/LambdaTest/agent-skills
     - `skills-best-practices` recommends moving detail into references and keeping SKILL entrypoints lean and triggerable: https://github.com/mgechev/skills-best-practices

3. Prioritize security-sensitive skills for modernization
   - Security/hardening skills now carry higher value because the ecosystem itself is under supply-chain scrutiny.
   - Evidence:
     - Microsoft Learn's security section explicitly says to treat skills like third-party code dependencies: https://learn.microsoft.com/en-us/agent-framework/agents/skills
     - Recent empirical work reports widespread vulnerabilities in agent-skill ecosystems and higher risk when scripts are bundled: https://arxiv.org/abs/2601.10338

## Frequency Ranking

Highest-value directions for `oh-my-gods` right now:

1. Upgrade old-style, high-frequency skills that still lack `references/` and `evals/`
2. Tighten trigger descriptions and route-out boundaries for neighboring skill collisions
3. Keep `SKILL.toon` aligned after material changes
4. Add security/governance framing where the ecosystem now expects it

## Categories

- Discovery quality: trigger wording, negative triggers, aliases
- Progressive disclosure quality: move dense guidance out of `SKILL.md`
- Evaluation quality: add realistic prompts and binary assertions
- Governance quality: security reviewability, provenance, and trust-boundary guidance

## Curated Sources

- Microsoft Learn Agent Skills: https://learn.microsoft.com/en-us/agent-framework/agents/skills
- Addy Osmani `agent-skills` guide: https://github.com/addyosmani/agent-skills/blob/main/docs/getting-started.md
- `skills-best-practices`: https://github.com/mgechev/skills-best-practices
- LambdaTest `agent-skills`: https://github.com/LambdaTest/agent-skills
- Tech Leads Club `agent-skills`: https://github.com/tech-leads-club/agent-skills
- "Agent Skills in the Wild" security study: https://arxiv.org/abs/2601.10338

## Key Insight

For this cycle, `security-best-practices` is the strongest target because it is broad, central, still uses an older code-dump style, lacks both `references/` and `evals/`, and sits directly in a part of the ecosystem where governance and review quality now matter more.
