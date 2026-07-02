---
name: browser-use
description: >
  Agent engineering skill for Browser Use
license: MIT
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: browser-use/browser-use
  tags: browser-use, browser-agent, python, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# browser-use

Browser Use is a leading browser agent in the 2026 AI agent engineering landscape (102.1k★).

## When to use this skill

- Autonomous browser agent: Agent(task=..., llm=...) drives real Chrome
- DOM serialization + vision for robust element targeting
- BrowserProfile: headless, allowed_domains, profiles, CDP connection
- Structured output extraction; sensitive-data handling
- Cloud API + optimized in-house model (ChatBrowserUse); MCP server mode
- Templates via uvx browser-use init
- Ecosystem overlap: None in oh-my-gods (harness Browser tool ≠ engineering agents); jeo-skills browser-harness/playwriter are session tools, not agent SDKs

## Installation

```bash
uv add browser-use   # or: pip install browser-use
```

## Core API

```python
import asyncio
from browser_use import Agent, BrowserProfile, ChatBrowserUse

async def main():
    agent = Agent(
        task="Find the number of stars of the browser-use repo",
        llm=ChatBrowserUse(model='openai/gpt-5.5'),
        browser_profile=BrowserProfile(headless=False, allowed_domains=["*.github.com"]),
    )
    history = await agent.run()
asyncio.run(main())
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Perception-action loop over serialized DOM/screenshots; actions are typed browser primitives; model-agnostic LLM adapter layer

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Default OSS browser-agent; alternatives: stagehand (SDK-style, deterministic mix), skyvern (workflow focus)

## Examples

### Example 1: Minimal Agent Run
```python
import asyncio
from browser_use import Agent, BrowserProfile, ChatBrowserUse

async def main():
    agent = Agent(
        task="Find the number of stars of the browser-use repo",
        llm=ChatBrowserUse(model='openai/gpt-5.5'),
        browser_profile=BrowserProfile(headless=False, allowed_domains=["*.github.com"]),
    )
    history = await agent.run()
asyncio.run(main())
```

## Best practices

1. Follow the primary installation commands for Browser Use to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/browser-use/browser-use](https://github.com/browser-use/browser-use)
- [https://docs.browser-use.com](https://docs.browser-use.com)
