---
name: smolagents
description: >
  Agent engineering skill for smolagents
license: Apache-2.0
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: huggingface/smolagents
  tags: smolagents, agent-framework, python, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# smolagents

smolagents is a leading agent framework in the 2026 AI agent engineering landscape (28.1k★).

## When to use this skill

- ~1k-line core: CodeAgent writes actions as Python code instead of JSON tool calls
- ToolCallingAgent for classic JSON tool calling when preferred
- Sandboxed execution: local, Docker, E2B, WebAssembly executors
- Model-agnostic: InferenceClientModel, LiteLLM, Transformers, OpenAI/Azure, Bedrock
- Tool sharing/loading via HF Hub; MCP tool import
- Multi-agent via managed_agents; CLI entrypoints smolagent/webagent
- Ecosystem overlap: agent-tool-routing covers registry concepts; smolagents' code-as-action is a distinct execution paradigm not covered anywhere

## Installation

```bash
pip install "smolagents[toolkit]"
```

## Core API

```python
from smolagents import CodeAgent, WebSearchTool, InferenceClientModel

model = InferenceClientModel()
agent = CodeAgent(tools=[WebSearchTool()], model=model, stream_outputs=True)
agent.run("How many seconds would it take for a leopard at full speed to run through Pont des Arts?")
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: ReAct loop where the action space is executable Python (code-as-action); executor abstraction isolates side effects; agents composable as managed tools

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: The minimal code-first agent framework; research shows code-actions cut steps ~30%; alternatives: langgraph (graphs), pi (TS minimal harness)

## Examples

### Example 1: Minimal Agent Run
```python
from smolagents import CodeAgent, WebSearchTool, InferenceClientModel

model = InferenceClientModel()
agent = CodeAgent(tools=[WebSearchTool()], model=model, stream_outputs=True)
agent.run("How many seconds would it take for a leopard at full speed to run through Pont des Arts?")
```

## Best practices

1. Follow the primary installation commands for smolagents to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/huggingface/smolagents](https://github.com/huggingface/smolagents)
- [https://huggingface.co/docs/smolagents](https://huggingface.co/docs/smolagents)
