---
name: google-adk
description: >
  Agent engineering skill for Google Agent Development Kit (ADK)
license: Apache-2.0
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: google/adk-python
  tags: google-adk, agent-sdk, python, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# google-adk

Google Agent Development Kit (ADK) is a leading agent sdk in the 2026 AI agent engineering landscape (20.4k★).

## When to use this skill

- Code-first Python framework for building, evaluating, and deploying agents (ADK 2.0)
- LlmAgent + workflow agents (Sequential, Parallel, Loop) for deterministic orchestration
- Multi-agent hierarchies with delegation and transfer
- Rich tool ecosystem: built-in tools, OpenAPI, MCP, third-party libraries
- adk web dev UI, adk run CLI, adk eval built-in evaluation
- Deploy to Vertex AI Agent Engine, Cloud Run, GKE; A2A integration for cross-agent calls
- Ecosystem overlap: agents-cli (this repo) covers the Google Cloud deploy/eval CLI toolchain around agents — google-adk covers the framework/programming model itself; pairs like SDK vs CLI

## Installation

```bash
pip install google-adk
```

## Core API

```python
from google.adk import Agent

root_agent = Agent(
    name="greeting_agent",
    model="gemini-2.5-flash",
    instruction="You are a helpful assistant. Greet the user warmly.",
)
# adk web  -> dev UI; adk run  -> CLI; adk eval -> evaluation
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Composable agent tree: LLM agents for reasoning, workflow agents for control flow; model-agnostic via LiteLLM though optimized for Gemini; events/sessions/state services pluggable

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Google's canonical agent SDK, powering Agentspace and Vertex agents; alternatives: openai-agents-python, microsoft agent-framework (both covered in jeo-skills)

## Examples

### Example 1: Minimal Agent Run
```python
from google.adk import Agent

root_agent = Agent(
    name="greeting_agent",
    model="gemini-2.5-flash",
    instruction="You are a helpful assistant. Greet the user warmly.",
)
# adk web  -> dev UI; adk run  -> CLI; adk eval -> evaluation
```

## Best practices

1. Follow the primary installation commands for Google Agent Development Kit (ADK) to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/google/adk-python](https://github.com/google/adk-python)
- [https://google.github.io/adk-docs/](https://google.github.io/adk-docs/)
