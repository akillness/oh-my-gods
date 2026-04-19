# Workflow Context

The current agent-skill ecosystem treats `SKILL.md` packages as lightweight capability bundles, but the practical quality bar has moved beyond frontmatter compliance alone.

- Microsoft Learn's Agent Skills docs explicitly position skills as code-like dependencies that need review, sandboxing, and audit logging, especially when scripts are bundled: https://learn.microsoft.com/en-us/agent-framework/agents/skills
- Addy Osmani's `agent-skills` guide frames skills as process surfaces with verification, anti-patterns, and exit criteria rather than reference dumps: https://github.com/addyosmani/agent-skills/blob/main/docs/getting-started.md
- `skills-best-practices` emphasizes that `name` and `description` are the only routing metadata visible before activation, and recommends keeping `SKILL.md` lean while moving detailed material to `references/`: https://github.com/mgechev/skills-best-practices

## Affected Users

- Repo maintainers deciding what to standardize next
- Agent users who depend on accurate skill triggering
- Teams reusing `oh-my-gods` as a curated, production-oriented skills pack

## Current Workarounds

- Fix frontmatter/spec issues with repository scripts such as `validate_frontmatter.py`
- Add evals ad hoc only after a skill is already under review
- Use manual branch naming and PR loops to track recurring improvements

## Adjacent Problems

- Missing evals make `skill-autoresearch` loops hard to justify or freeze
- Inline-heavy skills create token bloat and reduce progressive disclosure quality
- High-sensitivity skills without references or checklists are harder to audit consistently

## User Voices

The public ecosystem is converging on the same themes:

- `LambdaTest/agent-skills` bakes validation and evals into repository structure, including a shared validator and top-level eval inventory: https://github.com/LambdaTest/agent-skills
- `tech-leads-club/agent-skills` exposes skills through an MCP registry, which raises the value of precise routing metadata, provenance, and reusable support files: https://github.com/tech-leads-club/agent-skills
