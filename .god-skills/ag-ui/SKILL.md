---
name: ag-ui
description: >
  Agent engineering skill for AG-UI
license: MIT
compatibility: Requires Node.js >=18.
metadata:
  version: "1.0"
  source: ag-ui-protocol/ag-ui
  tags: ag-ui, agent-protocol, typescript, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# ag-ui

AG-UI is a leading agent protocol in the 2026 AI agent engineering landscape (14.5k★).

## When to use this skill

- Open, event-based protocol standardizing agent <-> frontend interaction
- ~16 standard event types: lifecycle, text streaming, tool calls, state patches
- Transport-agnostic: SSE, WebSocket, webhooks
- Bidirectional state sync (snapshots + JSON-patch deltas)
- Generative UI + human-in-the-loop collaboration patterns
- First-party/partner integrations: LangGraph, CrewAI, Mastra, Pydantic AI, ADK, Agno...; TS + Python SDKs; CopilotKit client
- Ecosystem overlap: a2a-protocol (this repo) covers agent<->agent; ag-ui covers agent<->user — explicit protocol-suite completion

## Installation

```bash
npx create-ag-ui-app my-agent-app
```

## Core API

```typescript
npx create-ag-ui-app my-agent-app   # scaffold client+agent
# server: emit RUN_STARTED, TEXT_MESSAGE_CONTENT, STATE_DELTA, RUN_FINISHED events
# client: @ag-ui/client HttpAgent subscribes and renders
```

## Instructions

### Step 1: Initialize the environment
Verify you have TypeScript installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Protocol layer: agent emits typed event stream, client renders and can send input/state back; middleware adapts existing frameworks; completes MCP (tools) + A2A (agent<->agent) with UI lane

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: The agent-frontend protocol lane; complements a2a-protocol skill exactly as its user-facing counterpart

## Examples

### Example 1: Minimal Agent Run
```typescript
npx create-ag-ui-app my-agent-app   # scaffold client+agent
# server: emit RUN_STARTED, TEXT_MESSAGE_CONTENT, STATE_DELTA, RUN_FINISHED events
# client: @ag-ui/client HttpAgent subscribes and renders
```

## Best practices

1. Follow the primary installation commands for AG-UI to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/ag-ui-protocol/ag-ui](https://github.com/ag-ui-protocol/ag-ui)
- [https://docs.ag-ui.com](https://docs.ag-ui.com)
