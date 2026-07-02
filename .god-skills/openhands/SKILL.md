---
name: openhands
description: >
  Agent engineering skill for OpenHands (Agent Canvas)
license: MIT
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: OpenHands/OpenHands
  tags: openhands, agent-runtime, python, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# openhands

OpenHands (Agent Canvas) is a leading agent runtime in the 2026 AI agent engineering landscape (79.1k★).

## When to use this skill

- Self-hosted developer control center (Agent Canvas) for coding agents and automations
- Runs OpenHands agent out-of-the-box; also drives Claude Code, Codex, Gemini, or any ACP-compatible agent
- Multiple agent backends: local, Docker, VMs, company infra, OpenHands Cloud/Enterprise
- Automations: scheduled/webhook workflows integrating Slack, GitHub, Linear, Notion
- Agent/Server SDK split: OpenHands/software-agent-sdk hosts the agent + agent server source
- Bring-your-own-model via LLM profiles
- Ecosystem overlap: Complements agent-manager (tmux lifecycle) with a product-grade control center; ACP angle complements a2a-protocol/mcp-server-design

## Installation

```bash
npm install -g @openhands/agent-canvas
```

## Usage

```python
npm install -g @openhands/agent-canvas
agent-canvas            # local, no sandbox (agent has full FS access!)
# hardened: run backend on a VM/Docker per self-hosting guide, connect canvas to it
agent-canvas --frontend-only / --backend-only for split deployments
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Frontend control plane (agent-canvas) + agent server backends; agent implementations connected over Agent-Client Protocol (ACP); OpenHands agent itself from software-agent-sdk

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: The self-hosted control center lane: one UI + automations over many coding agents; alternatives: hosted dashboards (Devin), per-agent UIs; SWE-bench heritage gives it the strongest OSS dev-agent pedigree

## Examples

### Example 1: Minimal Agent Run
```python
npm install -g @openhands/agent-canvas
agent-canvas            # local, no sandbox (agent has full FS access!)
# hardened: run backend on a VM/Docker per self-hosting guide, connect canvas to it
agent-canvas --frontend-only / --backend-only for split deployments
```

## Best practices

1. Follow the primary installation commands for OpenHands (Agent Canvas) to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/OpenHands/OpenHands](https://github.com/OpenHands/OpenHands)
- [https://docs.openhands.dev](https://docs.openhands.dev)
- [https://github.com/OpenHands/software-agent-sdk](https://github.com/OpenHands/software-agent-sdk)
