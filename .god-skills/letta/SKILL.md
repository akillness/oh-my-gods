---
name: letta
description: >
  Agent engineering skill for Letta
license: Apache-2.0
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: letta-ai/letta
  tags: letta, agent-framework, python, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# letta

Letta is a leading agent framework in the 2026 AI agent engineering landscape (23.6k★).

## When to use this skill

- Stateful agents with self-editing memory (MemGPT research lineage)
- Memory blocks (e.g. human/persona) the agent rewrites via memory tools
- Letta Code CLI: local terminal agent with skills + subagents + continual learning (npm i -g @letta-ai/letta-code)
- Letta API/server: REST + Python/TS SDKs for app integration
- Model-agnostic; model leaderboard published (leaderboard.letta.com)
- Agent File (.af) portable agent format; sleep-time compute for background memory maintenance
- Ecosystem overlap: agent-memory-architecture (this repo) covers memory design concepts and already references Letta as a backend — letta skill covers operating it concretely

## Installation

```bash
npm install -g @letta-ai/letta-code   # CLI; server SDKs: pip install letta-client / npm i @letta-ai/letta-client
```

## Core API

```python
import Letta from "@letta-ai/letta-client";
const client = new Letta({ apiKey: process.env.LETTA_API_KEY });
const agentState = await client.agents.create({
  model: "openai/gpt-5.2",
  memory_blocks: [{ label: "human", value: "Name: Timber..." }],
  tools: ["web_search", "fetch_webpage"],
});
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Agent = model + memory blocks + tools persisted server-side; memory edited by the agent itself (self-improving); ADE (Agent Development Environment) for inspection

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: The stateful-memory agent lane; alternatives: mem0/graphiti (memory layers without agent runtime), deepagents (harness without self-editing memory)

## Examples

### Example 1: Minimal Agent Run
```python
import Letta from "@letta-ai/letta-client";
const client = new Letta({ apiKey: process.env.LETTA_API_KEY });
const agentState = await client.agents.create({
  model: "openai/gpt-5.2",
  memory_blocks: [{ label: "human", value: "Name: Timber..." }],
  tools: ["web_search", "fetch_webpage"],
});
```

## Best practices

1. Follow the primary installation commands for Letta to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/letta-ai/letta](https://github.com/letta-ai/letta)
- [https://docs.letta.com](https://docs.letta.com)
