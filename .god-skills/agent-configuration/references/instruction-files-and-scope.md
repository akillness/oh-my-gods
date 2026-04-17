# Instruction Files And Scope

Use the smallest surface that matches how often the guidance must load.

## Scope defaults

- Always-on repo rules: `AGENTS.md`, `CLAUDE.md`, or the platform's
  project-level instruction file
- Reusable task guidance: skill package
- User-local preferences: local settings, aliases, editor choice, local paths
- External capability setup: plugin, extension, MCP, or custom command config

## Scope questions

Answer these before writing config:

1. Must this be loaded on every task?
2. Is it repo-specific or user-specific?
3. Does it require a tool or service connection?
4. Would duplicating it across surfaces create drift?

## Practical rules

- Put coding standards, repo layout, and safety warnings in the project
  instruction file.
- Put step-by-step reusable procedures in skills.
- Keep personal shell aliases, editor preferences, and machine-specific paths
  out of team-shared repo files unless the team explicitly standardizes them.
- If the same detail makes the project instruction file too long, move the
  detail into `references/` and keep only the routing sentence in `SKILL.md`.

## Cross-platform mapping

Normalize configuration choices into:

- `settings`: model choice, permissions, local defaults, tool access
- `rules`: always-on repo instructions, safety policy, routing boundaries
- `hooks`: pre/post action automation, notifications, policy checks

This mapping keeps the skill portable across Claude, Codex, Gemini, and other
agent clients even when exact filenames differ.
