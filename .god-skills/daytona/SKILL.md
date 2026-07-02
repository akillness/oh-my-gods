---
name: daytona
description: >
  Agent engineering skill for Daytona
license: AGPL-3.0 (platform) / Apache-2.0 (SDKs)
compatibility: Requires Node.js >=18.
metadata:
  version: "1.0"
  source: daytonaio/daytona
  tags: daytona, agent-sandbox, typescript (platform: go/ts), ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# daytona

Daytona is a leading agent sandbox in the 2026 AI agent engineering landscape (72.3k★).

## When to use this skill

- Sandboxes: full composable computers — dedicated kernel, filesystem, network stack, vCPU/RAM/disk
- Sub-90ms cold start; OCI/Docker-compatible images; unlimited persistence
- Python + TypeScript SDKs, REST API, CLI
- Process & code execution, filesystem ops, git ops, LSP, computer use, PTY
- Snapshots (stateful), volumes, declarative image builder, preview URLs
- Org/RBAC platform layer, audit logs, webhooks, OpenTelemetry
- Ecosystem overlap: Pairs with e2b as the two sandbox lanes (platform vs SDK); agent-system-design consumes both conceptually

## Installation

```bash
pip install daytona   # or: npm install @daytona/sdk
```

## Usage

```typescript
from daytona import Daytona

daytona = Daytona()  # DAYTONA_API_KEY env
sandbox = daytona.create()
response = sandbox.process.code_run('print("Hello from sandbox")')
print(response.result)
```

## Instructions

### Step 1: Initialize the environment
Verify you have TypeScript (platform: Go/TS) installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Three planes: interface (SDK/API/CLI/dashboard), control (orchestration), compute (sandbox runners); sandboxes are the persistent stateful unit for agent workflows

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Enterprise-grade sandbox platform lane vs E2B's lightweight SDK lane; ex dev-environment manager pivoted fully to agent infra

## Examples

### Example 1: Minimal Agent Run
```typescript
from daytona import Daytona

daytona = Daytona()  # DAYTONA_API_KEY env
sandbox = daytona.create()
response = sandbox.process.code_run('print("Hello from sandbox")')
print(response.result)
```

## Best practices

1. Follow the primary installation commands for Daytona to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/daytonaio/daytona](https://github.com/daytonaio/daytona)
- [https://www.daytona.io/docs](https://www.daytona.io/docs)
