---
name: livekit-agents
description: >
  Agent engineering skill for LiveKit Agents
license: Apache-2.0
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: livekit/agents
  tags: livekit-agents, voice-agent, python, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# livekit-agents

LiveKit Agents is a leading voice agent in the 2026 AI agent engineering landscape (11.2k★).

## When to use this skill

- Realtime voice AI agents over LiveKit WebRTC rooms
- AgentServer + AgentSession composing VAD/STT/LLM/TTS or realtime speech models
- @function_tool tools callable mid-conversation
- Semantic turn detection model; interruption handling
- Telephony (SIP) integration; avatar integrations
- Deploy to LiveKit Cloud or self-host; Node.js SDK sibling; official Agent Skill (npx skills add livekit/agent-skills)
- Ecosystem overlap: None — voice/realtime is an uncovered category

## Installation

```bash
pip install "livekit-agents[openai,deepgram,cartesia]"
```

## Core API

```python
from livekit.agents import Agent, AgentServer, AgentSession, JobContext, cli, function_tool, inference

server = AgentServer()

@server.rtc_session()
async def entrypoint(ctx: JobContext):
    session = AgentSession(vad=inference.VAD(), stt=..., llm=..., tts=...)
    await session.start(agent=Agent(instructions="You are a helpful assistant"), room=ctx.room)

if __name__ == "__main__":
    cli.run_app(server)
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Worker/job model: AgentServer registers entrypoints, jobs join rooms; pipeline nodes swappable (any STT/LLM/TTS combo or realtime API); LiveKit Infer provides hosted inference

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Infrastructure-grade voice-agent lane (powers ChatGPT voice); alternatives: pipecat (pipeline flexibility), vapi/retell (managed SaaS)

## Examples

### Example 1: Minimal Agent Run
```python
from livekit.agents import Agent, AgentServer, AgentSession, JobContext, cli, function_tool, inference

server = AgentServer()

@server.rtc_session()
async def entrypoint(ctx: JobContext):
    session = AgentSession(vad=inference.VAD(), stt=..., llm=..., tts=...)
    await session.start(agent=Agent(instructions="You are a helpful assistant"), room=ctx.room)

if __name__ == "__main__":
    cli.run_app(server)
```

## Best practices

1. Follow the primary installation commands for LiveKit Agents to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/livekit/agents](https://github.com/livekit/agents)
- [https://docs.livekit.io/agents/](https://docs.livekit.io/agents/)
