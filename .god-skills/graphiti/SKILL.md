---
name: graphiti
description: >
  Agent engineering skill for Graphiti
license: Apache-2.0
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: getzep/graphiti
  tags: graphiti, agent-memory, python, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# graphiti

Graphiti is a leading agent memory in the 2026 AI agent engineering landscape (28.3k★).

## When to use this skill

- Real-time temporal knowledge graphs for agent memory
- Episodes (text/message/json) incrementally ingested — no batch recompute
- Bi-temporal model: event time + ingest time, edge invalidation on contradiction
- Hybrid retrieval: semantic + BM25 + graph traversal, with rerankers
- Custom entity/edge types via Pydantic models
- Backends: Neo4j, FalkorDB (+embedded falkordblite), Kuzu, Amazon Neptune; MCP server included
- Ecosystem overlap: agent-memory-architecture references Zep/Graphiti conceptually; this covers building on graphiti-core directly

## Installation

```bash
pip install graphiti-core   # extras: [falkordb], [kuzu], [neptune], [anthropic], [google-genai]...
```

## Core API

```python
from graphiti_core import Graphiti

graphiti = Graphiti("bolt://localhost:7687", "neo4j", "password")
await graphiti.build_indices_and_constraints()
await graphiti.add_episode(name="conv-1", episode_body="Alice moved to Paris", source_description="chat")
results = await graphiti.search("Where does Alice live?")
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Graph-as-memory service; agents write episodes and query facts; communities cluster entities; powers Zep's hosted memory

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Temporal-KG lane of memory; alternatives: mem0 (extraction pipeline), plain RAG (no time model); complements agent-memory-architecture's temporal-vs-snapshot tradeoff

## Examples

### Example 1: Minimal Agent Run
```python
from graphiti_core import Graphiti

graphiti = Graphiti("bolt://localhost:7687", "neo4j", "password")
await graphiti.build_indices_and_constraints()
await graphiti.add_episode(name="conv-1", episode_body="Alice moved to Paris", source_description="chat")
results = await graphiti.search("Where does Alice live?")
```

## Best practices

1. Follow the primary installation commands for Graphiti to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/getzep/graphiti](https://github.com/getzep/graphiti)
- [https://help.getzep.com/graphiti](https://help.getzep.com/graphiti)
