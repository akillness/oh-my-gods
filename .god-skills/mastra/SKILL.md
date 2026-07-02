---
name: mastra
description: >
  Agent engineering skill for Mastra
license: Elastic-2.0 (NOASSERTION on GitHub)
compatibility: Requires Node.js >=18.
metadata:
  version: "1.0"
  source: mastra-ai/mastra
  tags: mastra, agent-framework, typescript, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# mastra

Mastra is a leading agent framework in the 2026 AI agent engineering landscape (25.7k★).

## When to use this skill

- TypeScript agent framework: Agent class with tools, memory, voice
- Workflows: durable graph-based step engine with suspend/resume
- RAG pipeline: chunk/embed/store/query across pgvector, Pinecone, Qdrant
- Scorers/evals: model-graded and rule-based
- Mastra Studio: local playground UI (mastra dev) to build/test/manage agents
- Vercel AI SDK interop; deploy via mastra build to serverless (Vercel/CF/Netlify)
- Ecosystem overlap: None — catalog is Python-heavy; fills the TS framework gap

## Installation

```bash
npm create mastra@latest
```

## Core API

```typescript
npm create mastra@latest   # scaffold project
cd my-app && npm run dev   # Mastra Studio at localhost:4111
# code: new Agent({ name, instructions, model: openai('gpt-5'), tools })
```

## Instructions

### Step 1: Initialize the environment
Verify you have TypeScript installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Agents own tools/memory; workflows provide deterministic graph orchestration around LLM calls; storage/vector adapters pluggable; studio drives dev loop

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Leading dedicated TypeScript agent framework (Gatsby team, YC W25); alternatives: voltagent (smaller), vercel/ai (lower-level SDK), langgraph-js

## Examples

### Example 1: Minimal Agent Run
```typescript
npm create mastra@latest   # scaffold project
cd my-app && npm run dev   # Mastra Studio at localhost:4111
# code: new Agent({ name, instructions, model: openai('gpt-5'), tools })
```

## Best practices

1. Follow the primary installation commands for Mastra to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/mastra-ai/mastra](https://github.com/mastra-ai/mastra)
- [https://mastra.ai/docs](https://mastra.ai/docs)
