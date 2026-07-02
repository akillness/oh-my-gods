---
name: stagehand
description: >
  Agent engineering skill for Stagehand
license: MIT
compatibility: Requires Node.js >=18.
metadata:
  version: "1.0"
  source: browserbase/stagehand
  tags: stagehand, browser-agent, typescript, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# stagehand

Stagehand is a leading browser agent in the 2026 AI agent engineering landscape (23.3k★).

## When to use this skill

- act(): natural-language single actions on the page
- extract(): schema-validated (zod) structured data extraction
- observe(): discover/cache candidate actions before acting
- agent(): multi-step autonomous execution when needed
- Full Playwright interop as deterministic escape hatch (stagehand.context.pages())
- TypeScript + Python SDKs; local browser or Browserbase cloud
- Ecosystem overlap: Pairs with browser-use as the two browser-agent lanes (autonomous vs deterministic-mix)

## Installation

```bash
npx create-browser-app   # scaffold; or: npm i @browserbasehq/stagehand
```

## Core API

```typescript
const page = stagehand.context.pages()[0];
await page.goto("https://github.com/browserbase");
await stagehand.act("click on the stagehand repo");
const agent = stagehand.agent();
await agent.execute("Get to the latest PR");
const { author, title } = await stagehand.extract("extract the author and title of the PR", z.object({ author: z.string(), title: z.string() }));
```

## Instructions

### Step 1: Initialize the environment
Verify you have TypeScript installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Hybrid determinism ladder: plain code -> act/extract/observe (LLM-assisted primitives) -> agent (autonomous); CDP engine underneath

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Production/deterministic lane of browser automation vs browser-use's autonomy lane; backed by Browserbase infra

## Examples

### Example 1: Minimal Agent Run
```typescript
const page = stagehand.context.pages()[0];
await page.goto("https://github.com/browserbase");
await stagehand.act("click on the stagehand repo");
const agent = stagehand.agent();
await agent.execute("Get to the latest PR");
const { author, title } = await stagehand.extract("extract the author and title of the PR", z.object({ author: z.string(), title: z.string() }));
```

## Best practices

1. Follow the primary installation commands for Stagehand to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/browserbase/stagehand](https://github.com/browserbase/stagehand)
- [https://docs.stagehand.dev](https://docs.stagehand.dev)
