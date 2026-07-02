---
name: pi-agent
description: >
  Agent engineering skill for Pi (Pi Agent Harness)
license: MIT
compatibility: Requires Node.js >=18.
metadata:
  version: "1.0"
  source: earendil-works/pi
  tags: pi-agent, agent-runtime, typescript, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# pi-agent

Pi (Pi Agent Harness) is a leading agent runtime in the 2026 AI agent engineering landscape (67.1k★).

## When to use this skill

- Self-extensible interactive coding agent CLI (@earendil-works/pi-coding-agent)
- pi-agent-core: reusable agent runtime with tool calling and state management
- pi-ai: unified multi-provider LLM API (OpenAI, Anthropic, Google, ...)
- pi-tui: terminal UI library with differential rendering
- Extensions, themes, and custom tools — the agent can extend itself
- Session trees with branching state
- Sibling project pi-chat for Slack/chat automation
- Ecosystem overlap: None; oh-my-gods agent-workflow covers day-to-day loops on other runtimes; pi-agent covers building on/with the pi harness itself

## Installation

```bash
npm install -g @earendil-works/pi-coding-agent
```

## Usage

```typescript
npm install -g @earendil-works/pi-coding-agent
pi              # interactive coding agent
# library use:
#   import { ... } from '@earendil-works/pi-ai' (unified LLM API)
#   import { ... } from '@earendil-works/pi-agent-core' (agent runtime)
```

## Instructions

### Step 1: Initialize the environment
Verify you have TypeScript installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Minimal agent loop over pi-agent-core; deliberately no built-in RAG or permission system; everything beyond the loop is an extension; monorepo of composable npm packages

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: The minimal hackable coding-agent harness — the anti-framework; OpenClaw's agent lineage derives from it; alternatives: Claude Code (product), opencode (product); pi is the one you read and modify

## Examples

### Example 1: Minimal Agent Run
```typescript
npm install -g @earendil-works/pi-coding-agent
pi              # interactive coding agent
# library use:
#   import { ... } from '@earendil-works/pi-ai' (unified LLM API)
#   import { ... } from '@earendil-works/pi-agent-core' (agent runtime)
```

## Best practices

1. Follow the primary installation commands for Pi (Pi Agent Harness) to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/earendil-works/pi](https://github.com/earendil-works/pi)
- [https://pi.dev](https://pi.dev)
- [https://pi.dev/docs/latest](https://pi.dev/docs/latest)
