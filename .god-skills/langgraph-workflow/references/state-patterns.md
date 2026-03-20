# LangGraph State Patterns

## Reducers for append-only fields

```python
from typing import Annotated
from typing_extensions import TypedDict
from langgraph.graph.message import add_messages

class State(TypedDict):
    messages: Annotated[list, add_messages]
    artifacts: list[str]
```

Use reducers only for fields that truly accumulate. Most state keys should be replaced by the latest node output.

## Persistence modes

Use the persistence mode that matches the workflow:

- `checkpointer=None`: per-invocation state only
- `checkpointer=True` or concrete saver: per-thread persistence
- `checkpointer=False` on subgraphs: stateless subgraph invocation with no durable resume

Guideline:
- Use persistent checkpointers for HITL, multi-turn workflows, and crash recovery
- Use stateless subgraphs when the same compiled subgraph is called repeatedly from one parent node

## Static vs dynamic interrupts

Static pause:

```python
app = graph.compile(
    checkpointer=checkpointer,
    interrupt_before=["deploy"],
)
```

Dynamic pause:

```python
from langgraph.types import Command, interrupt

def approval_node(state: State) -> State:
    approved = interrupt(
        {"kind": "approval", "target": state["artifact_id"]}
    )
    return {"approved": approved}

config = {"configurable": {"thread_id": "artifact-1"}}
first = app.invoke(state, config=config, version="v2")
second = app.invoke(Command(resume=True), config=config, version="v2")
```

Use dynamic interrupts when:
- approval depends on runtime-calculated risk
- the payload shown to reviewers must include live arguments
- one node can pause under some conditions but not others

## Durable execution rules

- Reuse the same `thread_id` to resume work
- Expect nodes containing `interrupt()` to restart from the top on resume
- Keep side effects idempotent or isolate them so replay is safe
- Store explicit decision state instead of inferring it from logs

## Subgraph composition

```python
subgraph = sub_builder.compile(checkpointer=False)

def run_subgraph(state: ParentState) -> ParentState:
    child = subgraph.invoke({"task": state["task"]})
    return {"child_result": child["result"]}
```

Prefer `checkpointer=False` for a subgraph invoked like a plain function from inside a node. That avoids checkpoint namespace collisions when a node invokes the same subgraph multiple times.

## Hybrid pattern: Deep agent inside LangGraph

```python
from deepagents import create_deep_agent

specialist = create_deep_agent()

def specialist_node(state: State) -> State:
    response = specialist.invoke(
        {"messages": [{"role": "user", "content": state["task"]}]}
    )
    return {"draft": response["messages"][-1].content}
```

Use this pattern when:
- routing and persistence belong to the outer graph
- tool-heavy reasoning belongs to a specialist harness
- you want to replace the specialist without rewriting supervisor edges

## Parallel fan-out

```python
from langgraph.types import Send

def fan_out(state: State) -> list[Send]:
    return [Send("worker", {"item": item}) for item in state["items"]]
```

Fan-out is appropriate when each branch is independent and aggregation can happen in a later node.
