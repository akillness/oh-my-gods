---
name: langchain-bmad
description: >
  Combines LangChain/LangGraph/Deep Agents skills with the BMAD structured
  development methodology. Install both langchain-ai/langchain-skills and bmad
  together, then follow the BMAD phase workflow (Analysis → Planning →
  Solutioning → Implementation) with LangChain framework-aware guidance at
  each phase gate. Triggers on: langchain bmad, bmad langchain, langchain
  workflow, langgraph bmad, deep agents bmad, structured agent development,
  framework-aware bmad.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: langchain, langgraph, deep-agents, bmad, workflow, structured-development, framework-selection
  platforms: Claude, Gemini, Codex, OpenCode
  keyword: langchain-bmad
  version: 1.0.0
  source: akillness/oh-my-gods
---

# langchain-bmad — BMAD × LangChain Unified Workflow

Bridge the BMAD structured development methodology with the official LangChain/LangGraph/Deep Agents skill collection. Each BMAD phase gets framework-aware guidance so the right LangChain primitive is chosen at the right time.

## When to use this skill

- Starting a new LangChain/LangGraph/Deep Agents project and wanting structured phase gates
- Applying BMAD (Analysis → Planning → Solutioning → Implementation) to agent framework development
- Installing both `langchain-ai/langchain-skills` and `bmad` in one step
- Mapping BMAD phase deliverables (PRD, Architecture, Sprint Plan) to LangChain architecture decisions

---

## Installation

Install both skill sets together:

```bash
# 1. Install BMAD from oh-my-gods
npx skills add https://github.com/akillness/oh-my-gods --skill bmad

# 2. Install all 11 official LangChain skills
npx skills add langchain-ai/langchain-skills --skill '*' --yes
```

Or as part of the full oh-my-gods install, add `--skill langchain-bmad` to the existing `npx skills add` command.

---

## BMAD × LangChain Phase Map

```
┌─────────────────────────────────────────────────────────────────────┐
│              BMAD × LangChain Workflow                              │
├──────────────┬──────────────────────────────────────────────────────┤
│  PHASE 1     │  Analysis                                            │
│              │  → Run: framework-selection                          │
│              │  → Output: framework choice (LangChain / LangGraph   │
│              │    / Deep Agents)                                     │
├──────────────┼──────────────────────────────────────────────────────┤
│  PHASE 2     │  Planning                                            │
│              │  → Run: langchain-dependencies                       │
│              │  → PRD captures: model provider, package versions,   │
│              │    persistence requirements                           │
├──────────────┼──────────────────────────────────────────────────────┤
│  PHASE 3     │  Solutioning                                         │
│              │  → Run: langgraph-fundamentals OR langchain-          │
│              │    fundamentals OR deep-agents-core                   │
│              │  → Architecture doc: StateGraph schema, middleware    │
│              │    stack, HITL interrupt points                       │
├──────────────┼──────────────────────────────────────────────────────┤
│  PHASE 4     │  Implementation                                      │
│              │  → Run: langgraph-persistence, langchain-middleware,  │
│              │    deep-agents-memory, langchain-rag (as needed)      │
│              │  → Deliver: production agent with checkpointer,       │
│              │    human-in-the-loop, RAG pipeline                   │
└──────────────┴──────────────────────────────────────────────────────┘
```

---

## Phase 1 — Analysis: Choose Your Framework

Run `/workflow-init` (BMAD), then invoke `framework-selection` before writing any agent code:

| If you need... | Choose |
|---|---|
| Multi-step tasks, file management, on-demand skills, persistent memory | **Deep Agents** |
| Complex control flow — loops, branching, parallel workers, HITL approval | **LangGraph** |
| Single-purpose agent with tools | **LangChain** `create_agent()` |
| Pure model call / retrieval pipeline | **LangChain LCEL** |

Framework decision goes into your BMAD product brief as a technical constraint.

---

## Phase 2 — Planning: Lock Dependencies

Use `langchain-dependencies` to pin package versions in the PRD:

```bash
# Python (recommended)
pip install -qU langchain-openai langgraph langchain-core

# TypeScript
npm install @langchain/core @langchain/openai @langchain/langgraph
```

Add to PRD:
- Model provider (OpenAI / Anthropic / Google)
- Persistence backend (MemorySaver for dev, PostgresSaver for prod)
- Memory store (InMemoryStore for dev, external for prod)

---

## Phase 3 — Solutioning: Architecture Design

### LangGraph path

Use `langgraph-fundamentals` + `langgraph-persistence` to design the StateGraph:

```python
from typing import Annotated
from typing_extensions import TypedDict
from langgraph.graph.message import add_messages

class AgentState(TypedDict):
    messages: Annotated[list, add_messages]
    phase: str          # current BMAD phase
    approved: bool | None
```

Document in Architecture doc:
- Node functions and their phase responsibilities
- Conditional edges (routing logic)
- `interrupt_before` points for plannotator phase gate reviews

### Deep Agents path

Use `deep-agents-core` to design the middleware stack:

```python
from deepagents import create_deep_agent
from deepagents.middleware import FileMiddleware, TodoListMiddleware

agent = create_deep_agent(
    middleware=[FileMiddleware(), TodoListMiddleware()],
    skills=["bmad", "framework-selection"],
)
```

---

## Phase 4 — Implementation

### Add persistence (LangGraph)

Use `langgraph-persistence` — never use MemorySaver in production:

```python
from langgraph.checkpoint.memory import MemorySaver   # dev only
# from langgraph.checkpoint.postgres import PostgresSaver  # production

app = graph.compile(checkpointer=MemorySaver())
config = {"configurable": {"thread_id": "bmad-session-001"}}
result = app.invoke(initial_state, config=config, version="v2")
```

### Add HITL for BMAD phase gates

Use `langgraph-human-in-the-loop` — pause at each phase boundary with `interrupt()`:

```python
from langgraph.types import Command, interrupt

def phase_gate_node(state: AgentState) -> AgentState:
    approved = interrupt({
        "kind": "phase_gate",
        "phase": state["phase"],
        "summary": f"Approve transition from {state['phase']}?",
    })
    return {"approved": approved}

# Resume after human approval
second = app.invoke(Command(resume=True), config=config, version="v2")
```

### Add RAG (optional)

Use `langchain-rag` to ground the agent in project documentation:

```python
from langchain_community.vectorstores import FAISS
from langchain_openai import OpenAIEmbeddings

vectorstore = FAISS.from_documents(docs, OpenAIEmbeddings())
retriever = vectorstore.as_retriever()
```

---

## plannotator Phase Gate Integration

After each BMAD phase document is complete, run plannotator review before advancing:

```bash
# Phase 2 → 3 gate: review PRD
bash scripts/phase-gate-review.sh docs/prd-*.md "PRD Review"

# Phase 3 → 4 gate: review Architecture
bash scripts/phase-gate-review.sh docs/architecture-*.md "Architecture Review"
```

In LangGraph terms, each gate corresponds to an `interrupt_before` node:

```python
app = graph.compile(
    checkpointer=checkpointer,
    interrupt_before=["architecture_gate", "implementation_gate"],
)
```

---

## Quick Reference

| BMAD Phase | LangChain Skill | Command |
|---|---|---|
| Analysis | `framework-selection` | Invoke at start of any project |
| Planning | `langchain-dependencies` | Lock package versions in PRD |
| Solutioning (LangGraph) | `langgraph-fundamentals`, `langgraph-persistence` | Design StateGraph + checkpointer |
| Solutioning (Deep Agents) | `deep-agents-core`, `deep-agents-memory` | Design middleware stack |
| Implementation | `langchain-middleware`, `langgraph-human-in-the-loop`, `langchain-rag` | Build HITL, persistence, RAG |

---

## References

- [BMAD Method](https://github.com/bmad-dev/BMAD-METHOD)
- [langchain-ai/langchain-skills](https://github.com/langchain-ai/langchain-skills)
- [LangGraph Docs](https://langchain-ai.github.io/langgraph/)
- [Deep Agents](https://github.com/langchain-ai/deepagents)
- See `bmad` skill for full phase gate workflow
- See `langgraph-workflow` skill for advanced LangGraph patterns
