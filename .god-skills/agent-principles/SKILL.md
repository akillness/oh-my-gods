---
name: agent-principles
description: >
  Use this skill when a user needs the baseline habits for working effectively
  with AI coding agents: break work into smaller steps, keep context clean,
  choose the right plan-versus-execute depth, spot repeatable automation, and
  verify outputs before trusting them. Triggers on: agent principles, AI
  collaboration principles, working with AI agents, context management, divide
  and conquer, plan vs execute, verify AI output, AI workflow habits.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: agentic-development, principles, context-management, automation, multi-agent
  platforms: Claude, Gemini, ChatGPT, Codex
  version: 2.1.0
  source: "Claude Code Complete Guide: 70 Tips (ykdojo + Ado Kukic)"
---

# Core Principles for AI-Agent Collaboration (Agentic Development Principles)

> **"AI is the copilot; you are the pilot."**
> AI agents amplify a developer's thinking and take over repetitive work, but final decisions and responsibility always remain with the developer.

## When to use this skill

- Confirm the baseline principles at the start of an AI-agent session
- Decide an approach before starting complex work
- Establish a context-management strategy
- Review workflows to improve productivity
- Onboard teammates on how to use AI agents

## Do not use this skill when

- The user needs day-to-day tooling tactics, shortcuts, session choreography, or Git/MCP habits; route to `agent-workflow`
- The user needs instruction-file, hooks, permissions, plugin, or team-sharing setup; route to `agent-configuration`
- The user needs a platform-specific implementation recipe instead of cross-platform collaboration principles

## Instructions

### Step 1: Confirm this is a principles question

- Use `agent-principles` when the user is asking how to work well with AI agents in general, not how to configure one platform or execute one daily workflow.
- If the request is really about runtime configuration or workflow mechanics, hand off early to the narrower sibling skill.

### Step 2: Apply the six-principle checklist

Use the principles below as a compact operating checklist:

1. Divide and conquer
2. Keep context fresh
3. Choose the right abstraction level
4. Automate repeated work
5. Balance plan mode and execute mode
6. Verify outputs and reflect

For detailed examples, templates, and platform notes, use the reference file in `references/core-principles.md`.

### Step 3: Recommend the smallest useful adjustment

- Point to the one or two principles that matter most for the current situation.
- Give a concrete next step, such as splitting the task, starting a fresh session, or switching from direct execution to a plan-first pass.
- Prefer corrective guidance over a generic motivational lecture.

### Step 4: Route adjacent jobs out explicitly

- If the user needs workflow choreography, session rituals, or Git/MCP habits, route to `agent-workflow`.
- If the user needs hooks, permissions, instruction files, or shared team setup, route to `agent-configuration`.
- If the user needs verification depth or evaluation system design, route to `agent-evaluation`.

## Principles Summary

| Principle | Core question | Immediate correction |
|-----------|---------------|----------------------|
| Divide and conquer | Is the task too broad? | Split it into independently checkable steps |
| Context hygiene | Is stale context hurting focus? | Start a fresh session or write a handoff |
| Abstraction choice | Am I too shallow or too deep? | Switch between overview and line-level review deliberately |
| Automation | Have I repeated this enough to encode it? | Turn repetition into a command, skill, or rule |
| Plan vs execute | Is this safe to do directly? | Use plan-first for risky or wide-scope work |
| Verification | Have I proved the output works? | Add tests, diff review, or self-checks before trusting it |

## Examples

### Example 1: Broad request before implementation

Input:
```text
How should I work with an AI coding agent on a messy refactor?
```

Output shape:
- surfaces divide-and-conquer, plan-vs-execute, and verification as the main principles
- recommends a staged plan instead of one monolithic prompt
- routes workflow-specific mechanics elsewhere if needed

### Example 2: Route a workflow question away

Input:
```text
What slash commands and MCP habits should I use in Claude Code?
```

Output shape:
- states that the request belongs to `agent-workflow`, not `agent-principles`
- briefly explains why the issue is workflow-specific rather than principle-level
- keeps the route-out explicit instead of trying to answer both skills at once

## Best practices

- Keep the entrypoint focused on durable collaboration habits, not platform trivia
- Prefer one or two relevant principles over dumping the whole checklist every time
- Route adjacent jobs out early so this skill stays distinct from workflow and configuration surfaces
- Keep deep examples, templates, and platform notes in references instead of bloating the main file

## References

- [references/core-principles.md](references/core-principles.md)
- [Claude Code Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)
- [ykdojo claude-code-tips](https://github.com/ykdojo/claude-code-tips)
- [Ado's Advent of Claude](https://adocomplete.com/advent-of-claude-2025/)
