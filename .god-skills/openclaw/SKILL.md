---
name: openclaw
description: >
  Agent engineering skill for OpenClaw
license: MIT
compatibility: Requires Node.js >=18.
metadata:
  version: "1.0"
  source: openclaw/openclaw
  tags: openclaw, agent-runtime, typescript, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# openclaw

OpenClaw is a leading agent runtime in the 2026 AI agent engineering landscape (381.4k★).

## When to use this skill

- Personal AI assistant running on your own devices, answering on 20+ chat channels (WhatsApp, Telegram, Slack, Discord, Signal, iMessage, Teams, Matrix, WeChat...)
- Gateway control plane with onboarding wizard (openclaw onboard) managing workspace, channels, skills, and daemon install
- Voice (speak/listen) on macOS/iOS/Android plus live controllable Canvas rendering
- AgentSkills-format skills platform for extending assistant behavior
- Node companions: desktop/mobile companion apps connect as nodes to the gateway
- Multi-provider model support incl. OAuth subscriptions (OpenAI ChatGPT/Codex) and flagship API models
- Plugin/extension system (bundled extensions load from extensions/* in the pnpm workspace)
- Ecosystem overlap: None in oh-my-gods; jeo-skills has clawteam (multi-agent teams on Claude Code) — different product; frouter previously referenced OpenClaw for model config but is being removed

## Installation

```bash
npm install -g openclaw@latest && openclaw onboard --install-daemon
```

## Usage

```typescript
npm install -g openclaw@latest
openclaw onboard --install-daemon
# wizard walks through gateway, workspace, channels, skills; Node 24 recommended (>=22.19)
```

## Instructions

### Step 1: Initialize the environment
Verify you have TypeScript installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Gateway daemon (control plane) + channel adapters + agent loop descended from the pi-mono coding-agent lineage; skills injected per AgentSkills spec; companion nodes attach over the gateway protocol

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: The dominant self-hosted personal-assistant agent runtime; alternatives: hosted assistants (ChatGPT/Claude apps) or DIY frameworks; complements coding agents rather than competing with them

## Examples

### Example 1: Minimal Agent Run
```typescript
npm install -g openclaw@latest
openclaw onboard --install-daemon
# wizard walks through gateway, workspace, channels, skills; Node 24 recommended (>=22.19)
```

## Best practices

1. Follow the primary installation commands for OpenClaw to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/openclaw/openclaw](https://github.com/openclaw/openclaw)
- [https://docs.openclaw.ai](https://docs.openclaw.ai)
- [https://docs.openclaw.ai/start/getting-started](https://docs.openclaw.ai/start/getting-started)
