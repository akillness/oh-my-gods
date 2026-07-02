---
name: mem0
description: >
  Agent engineering skill for Mem0
license: Apache-2.0
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: mem0ai/mem0
  tags: mem0, agent-memory, python, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# mem0

Mem0 is a leading agent memory in the 2026 AI agent engineering landscape (59.9k★).

## When to use this skill

- Universal memory layer: Memory().add/search/get_all/update/delete
- Scoping by user_id / agent_id / run_id
- Graph memory (Neo4j/Memgraph) alongside vector memory
- Configurable vector store + LLM + embedder matrix
- mem0 CLI + OpenMemory local server (docker compose) + hosted platform
- Agent skills shipped in-repo (npx skills add mem0ai/mem0 --skill mem0 / mem0-integrate)
- Hybrid search with BM25 + entity extraction (mem0ai[nlp])
- Ecosystem overlap: agent-memory-architecture covers design/selection concepts and references mem0 — this skill covers operating it (API, CLI, OpenMemory MCP)

## Installation

```bash
pip install mem0ai   # or: npm install mem0ai; CLI: npm i -g @mem0/cli
```

## Core API

```python
from mem0 import Memory
memory = Memory()
memory.add("I prefer dark mode", user_id="alice")
relevant = memory.search(query="what are my preferences?", filters={"user_id": "alice"}, top_k=3)
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Extraction pipeline: LLM distills conversations into memories, deduplicates/updates, retrieves by relevance; sits beside any agent framework

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Default OSS memory layer; alternatives: graphiti (temporal KG), letta (memory inside agent runtime), zep (hosted)

## Examples

### Example 1: Minimal Agent Run
```python
from mem0 import Memory
memory = Memory()
memory.add("I prefer dark mode", user_id="alice")
relevant = memory.search(query="what are my preferences?", filters={"user_id": "alice"}, top_k=3)
```

## Best practices

1. Follow the primary installation commands for Mem0 to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/mem0ai/mem0](https://github.com/mem0ai/mem0)
- [https://docs.mem0.ai](https://docs.mem0.ai)
