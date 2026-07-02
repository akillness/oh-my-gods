---
name: agno
description: >
  Agent engineering skill for Agno
license: Apache-2.0
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: agno-agi/agno
  tags: agno, agent-framework, python, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# agno

Agno is a leading agent framework in the 2026 AI agent engineering landscape (41.0k★).

## When to use this skill

- SDK for building agent platforms: agents, teams, workflows
- AgentOS: production runtime (FastAPI-based) with tracing, scheduling, RBAC and a control-plane UI
- Run agents from any framework under one control plane; own your data/context/tools/permissions
- Memory, storage, knowledge (vector DB integrations) built in
- Multimodal agents (text, image, audio, video)
- Human-review loops and pre-hooks/guardrails
- Ecosystem overlap: agent-system-design covers SLA discipline conceptually; agno is a concrete platform implementing those controls

## Installation

```bash
pip install agno
```

## Core API

```python
from agno.agent import Agent
from agno.models.openai import OpenAIChat

agent = Agent(model=OpenAIChat(id="gpt-5"), tools=[], markdown=True)
agent.print_response("Share a 2 sentence horror story")
# platform: agno.os AgentOS app -> serve with FastAPI
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Agent/Team/Workflow primitives compiled onto AgentOS runtime; control plane UI manages deployed agents; framework-agnostic hosting posture (2026 repositioning from pure framework to platform SDK)

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Performance-and-platform lane of Python agent frameworks; alternatives: crewai (roles), langgraph (graphs); differentiates on instantiation speed and self-hosted control plane

## Examples

### Example 1: Minimal Agent Run
```python
from agno.agent import Agent
from agno.models.openai import OpenAIChat

agent = Agent(model=OpenAIChat(id="gpt-5"), tools=[], markdown=True)
agent.print_response("Share a 2 sentence horror story")
# platform: agno.os AgentOS app -> serve with FastAPI
```

## Best practices

1. Follow the primary installation commands for Agno to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/agno-agi/agno](https://github.com/agno-agi/agno)
- [https://docs.agno.com](https://docs.agno.com)
