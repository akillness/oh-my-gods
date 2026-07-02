---
name: crewai
description: >
  Agent engineering skill for CrewAI
license: MIT
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: crewAIInc/crewAI
  tags: crewai, agent-framework, python, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# crewai

CrewAI is a leading agent framework in the 2026 AI agent engineering landscape (54.8k★).

## When to use this skill

- Role-based multi-agent crews: Agent (role/goal/backstory) + Task + Crew + Process
- Flows: event-driven orchestration with @start/@listen/@router decorators for production pipelines
- YAML-first configuration (agents.yaml / tasks.yaml) scaffolded by the crewai CLI
- Memory and knowledge stores per agent/crew
- crewai-tools package + MCP tool support
- Official CrewAI Skills for coding agents (npx skills add crewaiinc/skills)
- Standalone — no LangChain dependency
- Ecosystem overlap: langgraph-workflow covers graph orchestration; crewai covers role/crew paradigm — complementary; langchain-bmad routes between framework skills

## Installation

```bash
uv pip install crewai   # extras: 'crewai[tools]'
```

## Core API

```python
crewai create crew my_crew
cd my_crew && crewai install
# edit src/my_crew/config/agents.yaml + tasks.yaml
crewai run
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Two-layer: Crews (autonomous role-based collaboration, sequential/hierarchical process) and Flows (deterministic event-driven control flow that can embed crews)

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Most-adopted role-based multi-agent framework; alternatives: agno (perf/platform focus), langgraph (graph control), autogen (maintenance mode)

## Examples

### Example 1: Minimal Agent Run
```python
crewai create crew my_crew
cd my_crew && crewai install
# edit src/my_crew/config/agents.yaml + tasks.yaml
crewai run
```

## Best practices

1. Follow the primary installation commands for CrewAI to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/crewAIInc/crewAI](https://github.com/crewAIInc/crewAI)
- [https://docs.crewai.com](https://docs.crewai.com)
