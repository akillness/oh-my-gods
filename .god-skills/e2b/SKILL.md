---
name: e2b
description: >
  Agent engineering skill for E2B
license: Apache-2.0
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: e2b-dev/E2B
  tags: e2b, agent-sandbox, python + typescript, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# e2b

E2B is a leading agent sandbox in the 2026 AI agent engineering landscape (12.8k★).

## When to use this skill

- Cloud sandboxes for AI-generated code — Firecracker microVM isolation
- JS/TS and Python SDKs: Sandbox.create(), commands.run(), filesystem API
- Code Interpreter SDK (e2b-code-interpreter) with stateful run_code
- Custom sandbox templates from Dockerfiles
- Pause/resume persistence; desktop sandbox variant for GUI agents
- Self-hostable infra (open source) or hosted cloud
- Ecosystem overlap: agent-guardrails covers policy; e2b covers the isolation infrastructure those policies assume; smolagents skill references E2B executor

## Installation

```bash
pip install e2b   # code interpreter: pip install e2b-code-interpreter / npm i @e2b/code-interpreter
```

## Usage

```python
import Sandbox from 'e2b'

const sandbox = await Sandbox.create()
const result = await sandbox.commands.run('echo "Hello from E2B!"')
console.log(result.stdout)
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python + TypeScript installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Sandbox-as-a-service: agents get ephemeral isolated VMs with ~150ms start; SDK is framework-agnostic (used by smolagents executor, many frameworks)

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Default OSS sandbox SDK for agent code-exec; alternatives: daytona (broader workspace features), modal (batch compute), local Docker (weaker isolation)

## Examples

### Example 1: Minimal Agent Run
```python
import Sandbox from 'e2b'

const sandbox = await Sandbox.create()
const result = await sandbox.commands.run('echo "Hello from E2B!"')
console.log(result.stdout)
```

## Best practices

1. Follow the primary installation commands for E2B to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/e2b-dev/E2B](https://github.com/e2b-dev/E2B)
- [https://e2b.dev/docs](https://e2b.dev/docs)
