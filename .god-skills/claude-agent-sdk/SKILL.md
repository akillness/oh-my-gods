---
name: claude-agent-sdk
description: >
  Agent engineering skill for Claude Agent SDK
license: MIT
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: anthropics/claude-agent-sdk-python
  tags: claude-agent-sdk, agent-sdk, python, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# claude-agent-sdk

Claude Agent SDK is a leading agent sdk in the 2026 AI agent engineering landscape (7.5k★).

## When to use this skill

- Build agents on the Claude Code harness programmatically (query() one-shot / ClaudeSDKClient interactive)
- ClaudeAgentOptions: allowed_tools, permission_mode, cwd, mcp_servers, system_prompt
- In-process custom tools via @tool + create_sdk_mcp_server (no subprocess MCP needed)
- Hooks (PreToolUse/PostToolUse...) for deterministic control of the agent loop
- Subagents (agents option) and session resume/fork
- Bundled Claude Code CLI in the wheel; also drives an existing CLI install
- Ecosystem overlap: Complements agent-configuration (covers CLAUDE.md/hooks at product level) — SDK-level engineering is uncovered; jeo-skills has openai-agents-python for the OpenAI equivalent

## Installation

```bash
pip install claude-agent-sdk
```

## Core API

```python
import anyio
from claude_agent_sdk import query

async def main():
    async for message in query(prompt="What is 2 + 2?"):
        print(message)

anyio.run(main)
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: SDK wraps the Claude Code agent loop; tools are MCP servers (external or in-process SDK servers); hooks intercept lifecycle events; permission modes gate tool execution

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Official Anthropic path to embed the Claude Code harness in apps; alternatives: deepagents (LangGraph), openai-agents SDK (different model vendor), pi-agent-core (vendor-neutral minimal)

## Examples

### Example 1: Minimal Agent Run
```python
import anyio
from claude_agent_sdk import query

async def main():
    async for message in query(prompt="What is 2 + 2?"):
        print(message)

anyio.run(main)
```

## Best practices

1. Follow the primary installation commands for Claude Agent SDK to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/anthropics/claude-agent-sdk-python](https://github.com/anthropics/claude-agent-sdk-python)
- [https://docs.claude.com/en/api/agent-sdk/overview](https://docs.claude.com/en/api/agent-sdk/overview)
