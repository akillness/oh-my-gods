---
name: langgraph-workflow
description: >
  Design and implement durable, stateful AI workflows with LangGraph StateGraph.
  Use when building branching or retrying agents, adding persistence with
  thread_id + checkpointers, pausing for human approval with interrupt() or
  interrupt_before, composing subgraphs, or orchestrating deepagents inside a
  custom supervisor graph. Triggers on: langgraph, state graph, stateful agent,
  checkpoint, thread_id, interrupt, Command resume, conditional edges, subgraph,
  durable execution, long-running workflow, hybrid deep agent supervisor.
allowed-tools: Bash Read Write Edit Glob Grep
compatibility: >
  Requires Python >=3.11. Install with `pip install -qU langgraph` and add
  LangChain provider packages for your model. Optional: LangSmith tracing,
  LangGraph Studio, persistent checkpointer backends.
metadata:
  tags: langgraph, stategraph, multi-agent, persistence, interrupt, hitl, workflow, python
  version: "1.1"
  source: akillness/oh-my-gods
---

# langgraph-workflow

Use this skill to move from prompt chains to explicit graph control flow. LangGraph is the right tool when state, resumability, routing, and human approval need to be first-class instead of hand-wired around LLM calls.

## When to use this skill

- Building a workflow that must branch, loop, or retry based on state
- Adding durable execution with checkpointers and stable `thread_id` values
- Pausing for approval before risky actions with `interrupt()` or `interrupt_before`
- Streaming long-running node progress back to a UI or worker
- Composing subgraphs or embedding a prebuilt deep agent inside a supervisor graph
- Separating deterministic orchestration from tool-calling agent behavior

## Instructions

### Step 1: Define a typed state schema

Prefer `TypedDict` plus reducers only where accumulation is required:

```python
from typing import Annotated
from typing_extensions import TypedDict
from langgraph.graph.message import add_messages

class WorkflowState(TypedDict):
    messages: Annotated[list, add_messages]
    draft: str
    quality_score: float
    retry_count: int
    approved: bool | None
```

Rules:
- Keep top-level fields explicit
- Track retry counters and decision flags in state
- Add reducers only for fields that must merge across nodes

### Step 2: Keep nodes deterministic

Nodes should return partial updates, not rebuild the whole state. If a node includes side effects or non-deterministic behavior, isolate that logic so replay after resume is safe.

```python
from langgraph.graph import StateGraph, START, END

def plan_node(state: WorkflowState) -> WorkflowState:
    return {"draft": f"Plan for: {state['messages'][-1].content}"}

def review_node(state: WorkflowState) -> WorkflowState:
    score = 0.82 if len(state["draft"]) > 20 else 0.55
    return {"quality_score": score}
```

### Step 3: Model routing explicitly

Use `add_conditional_edges()` for retries and state-dependent fan-out:

```python
def route_after_review(state: WorkflowState) -> str:
    if state["quality_score"] < 0.7 and state["retry_count"] < 3:
        return "rewrite"
    return "finalize"

graph = StateGraph(WorkflowState)
graph.add_node("plan", plan_node)
graph.add_node("review", review_node)
graph.add_edge(START, "plan")
graph.add_edge("plan", "review")
graph.add_conditional_edges(
    "review",
    route_after_review,
    {
        "rewrite": "plan",
        "finalize": END,
    },
)
```

### Step 4: Add persistence before HITL or long runs

If the graph must resume later, compile with a checkpointer and always invoke with a stable `thread_id`:

```python
from langgraph.checkpoint.memory import MemorySaver

checkpointer = MemorySaver()
app = graph.compile(checkpointer=checkpointer)

config = {"configurable": {"thread_id": "draft-42"}}
result = app.invoke(initial_state, config=config, version="v2")
```

Use a durable checkpointer in production. `MemorySaver` is a development default, not a deployment strategy.

### Step 5: Choose the right interrupt pattern

Use static pauses when the node boundary itself is the approval gate:

```python
app = graph.compile(
    checkpointer=checkpointer,
    interrupt_before=["deploy"],
)
```

Use dynamic interrupts when approval depends on runtime data:

```python
from langgraph.types import Command, interrupt

def approval_node(state: WorkflowState) -> WorkflowState:
    approved = interrupt(
        {
            "kind": "approval",
            "summary": "Deploy migration to production?",
            "retry_count": state["retry_count"],
        }
    )
    return {"approved": approved}

first = app.invoke(initial_state, config=config, version="v2")
second = app.invoke(Command(resume=True), config=config, version="v2")
```

### Step 6: Compose subgraphs and deep agents deliberately

Use raw LangGraph for orchestration boundaries and call a compiled deep agent only for tool-heavy local reasoning:

```python
from deepagents import create_deep_agent

deep_agent = create_deep_agent()

def specialist_node(state: WorkflowState) -> WorkflowState:
    result = deep_agent.invoke(
        {"messages": [{"role": "user", "content": state["draft"]}]}
    )
    return {"draft": result["messages"][-1].content}
```

Use this hybrid when:
- supervisor state and routing must remain inspectable
- a subtask benefits from deepagents’ built-in tool harness
- you want to swap specialist implementations without changing the graph contract

### Step 7: Stream and trace

For long-running graphs, prefer streaming and attach LangSmith before production rollout:

```python
for event in app.stream(initial_state, config=config, version="v2"):
    print(event)
```

## Examples

### Example 1: Quality-gated writer

```python
from typing_extensions import TypedDict
from langgraph.graph import StateGraph, START, END

class WriterState(TypedDict):
    topic: str
    draft: str
    quality: float
    retries: int

def write_node(state: WriterState) -> WriterState:
    return {"draft": f"Draft about {state['topic']}"}

def review_node(state: WriterState) -> WriterState:
    return {"quality": 0.6 if state["retries"] == 0 else 0.85}

def route(state: WriterState) -> str:
    if state["quality"] < 0.7 and state["retries"] < 2:
        return "rewrite"
    return "done"

graph = StateGraph(WriterState)
graph.add_node("write", write_node)
graph.add_node("review", review_node)
graph.add_edge(START, "write")
graph.add_edge("write", "review")
graph.add_conditional_edges("review", route, {"rewrite": "write", "done": END})
```

### Example 2: Runtime approval with `interrupt()`

```python
from langgraph.types import Command, interrupt

def approval_node(state):
    approved = interrupt({"action": "delete_file", "path": state["path"]})
    return {"approved": approved}

result = app.invoke(state, config={"configurable": {"thread_id": "cleanup-1"}}, version="v2")
if result.interrupts:
    app.invoke(Command(resume=True), config={"configurable": {"thread_id": "cleanup-1"}}, version="v2")
```

### Example 3: LangGraph supervisor with a deep agent specialist

```python
from deepagents import create_deep_agent
from langgraph.graph import StateGraph, START, END

researcher = create_deep_agent()

class ResearchState(TypedDict):
    question: str
    answer: str

def specialist(state: ResearchState) -> ResearchState:
    result = researcher.invoke(
        {"messages": [{"role": "user", "content": state["question"]}]}
    )
    return {"answer": result["messages"][-1].content}

graph = StateGraph(ResearchState)
graph.add_node("specialist", specialist)
graph.add_edge(START, "specialist")
graph.add_edge("specialist", END)
```

## Best practices

1. Type state first, then build nodes around it.
2. Always cap retries in state instead of implicit loops.
3. Treat `thread_id` as part of the contract for any resumable workflow.
4. Use persistent checkpointers for production HITL and fault recovery.
5. Prefer `interrupt()` when approval is data-dependent and `interrupt_before` when the node boundary is enough.
6. Keep subgraphs stateless if you will call the same compiled subgraph multiple times inside one parent node.
7. Use LangGraph for orchestration, not as a dumping ground for all prompt logic.

## References

- [LangGraph Graph API](https://docs.langchain.com/oss/python/langgraph/use-graph-api)
- [LangGraph Persistence](https://docs.langchain.com/oss/python/langgraph/persistence)
- [LangGraph Interrupts](https://docs.langchain.com/oss/python/langgraph/interrupts)
- [LangGraph Durable Execution](https://docs.langchain.com/oss/python/langgraph/durable-execution)
- See `references/state-patterns.md` for reducers, subgraphs, interrupts, and hybrid patterns
