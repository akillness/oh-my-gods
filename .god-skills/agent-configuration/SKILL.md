---
name: agent-configuration
description: >
  Configure how AI coding agents are instructed, constrained, and shared across
  a project: instruction files, settings scope, hooks or permission guardrails,
  skills, plugins, tool-server setup, and team defaults. Use when the user
  needs to decide where configuration should live or how to make it safe and
  reusable, even if they ask in shorthand like CLAUDE.md, AGENTS.md, hooks,
  permissions, plugin setup, shared config, or team settings. Do not use this
  skill for day-to-day execution flow, runtime verification, or general MCP
  usage questions.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: agent-configuration, superwork, spw, security, hooks, skills, plugins, multi-agent
  platforms: Claude, Gemini, ChatGPT, Codex
  version: 2.0.0
  source: Claude Code Complete Guide 70 Tips (ykdojo + Ado Kukic)
---

# AI Agent Configuration

## When to use this skill

- Set up agent configuration for a new repo or team
- Decide whether guidance belongs in `AGENTS.md`, `CLAUDE.md`, settings, hooks,
  skills, plugins, or MCP
- Tighten permission and safety guardrails without over-approving commands
- Share reusable agent defaults across a team without creating prompt sprawl

Prefer a narrower sibling skill when the main job is more specific:

- `agent-workflow` for day-to-day execution loops, handoffs, and runtime flow
- `skill-standardization` for auditing or rewriting a specific `SKILL.md`
- `security-best-practices` for broader application hardening beyond agent
  configuration

## Instructions

### Step 1: Classify the configuration job before changing files

Sort the request into one or two lanes:

- instruction-scope: always-on project rules, repo context, coding standards
- guardrails: permissions, hooks, approvals, dangerous-command blocking
- capability-packaging: skills, plugins, extensions, MCP, custom commands
- team-sharing: defaults, checked-in config, local override boundaries

Do not jump straight to file creation. First decide what must always be loaded,
what should stay on demand, and what must remain local to one machine.

### Step 2: Choose the smallest correct configuration surface

Use these defaults unless the environment proves otherwise:

- always-on repo instructions belong in project instruction files such as
  `AGENTS.md`, `CLAUDE.md`, or equivalent repo guidance
- reusable task-specific guidance belongs in skills
- external integrations belong in plugins, extensions, or MCP configuration
- safety controls belong in settings, permission rules, and hooks
- personal preferences stay local unless the team explicitly wants them shared

Keep the main project instructions concise. Move detailed procedures and
platform-specific examples into `references/`.

### Step 3: Configure guardrails with least privilege

When the request touches approvals, hooks, or permissions:

- default to narrow allowlists over broad wildcard approval
- block destructive commands explicitly
- separate safe automation from risky human-review steps
- document where host-only or secret-bearing settings must stay out of the repo

Avoid recommending blanket auto-approval, unrestricted host execution, or
unknown MCP endpoints as defaults.

### Step 4: Package reusable capability cleanly

When the request is about extending what the agent can do:

- use skills for reusable instructions and decision procedures
- use plugins, extensions, or MCP when external tools or services are required
- keep overlap explicit so users know when to route to a sibling skill instead
- add references or evals when the configuration surface is likely to be reused
  or reviewed

Do not create a new package surface when a smaller edit to existing project
guidance would solve the problem.

### Step 5: Verify the resulting configuration

Before claiming the configuration is good:

- check that the chosen surface matches the actual need
- confirm the scope is correct: global, project, repo, or user-local
- review for over-broad permissions, duplicated instructions, or secret risk
- run validation or linting where the repo provides it

If the output is a team-shared configuration, leave an explicit note about what
is intentionally shared and what must remain local.

## Examples

### Example 1: Decide where instructions belong

Input:

```text
Should this repo guidance live in AGENTS.md, a skill, or local settings?
```

Expected shape:

- distinguishes always-on rules from on-demand guidance
- keeps repo-specific policy in project instruction files
- avoids turning every repeated note into a new skill

### Example 2: Tighten safety settings

Input:

```text
I want the agent to run tests automatically but never approve dangerous shell
commands. How should I configure that?
```

Expected shape:

- uses least-privilege approval guidance
- separates safe test automation from risky commands
- recommends explicit deny or warning patterns for destructive actions

### Example 3: Choose between skills and integrations

Input:

```text
We need reusable prompts, browser access, and external service connections
across the team. Should this be a skill, plugin, or MCP setup?
```

Expected shape:

- routes reusable guidance to skills
- routes external integrations to plugins, extensions, or MCP
- keeps the answer scoped to what must be shared vs what stays local

### Example 4: Share team defaults safely

Input:

```text
How should we share our agent configuration in the repo without leaking local
machine preferences or secrets?
```

Expected shape:

- defines repo-shared vs local-only boundaries
- recommends checking in only the stable team defaults
- calls out secrets and user-specific overrides as local

## Best practices

1. Start with scope: global, user-local, project, or repo-shared
2. Keep always-on instructions short and move details behind references
3. Prefer narrow approval patterns over broad wildcard trust
4. Use skills for reusable guidance and integrations only when a tool surface is
   actually required
5. Avoid duplicating the same rule across project files, skills, and settings
6. Add evals before considering an optimization loop for a newly packaged skill

## References

- `references/instruction-files-and-scope.md`
- `references/guardrails-and-permissions.md`
- `references/skills-plugins-and-team-sharing.md`
- [Agent Skills specification](https://agentskills.io/specification)
- [Agent Skills best practices](https://agentskills.io/skill-creation/best-practices)
- [Claude Code subagents](https://code.claude.com/docs/en/sub-agents)
- [Gemini CLI extensions](https://google-gemini.github.io/gemini-cli/docs/extensions/)
- [OpenAI Codex](https://developers.openai.com/codex)
