---
name: goose
description: >
  Agent engineering skill for Goose
license: Apache-2.0
compatibility: Requires Rust environment. Verified on 2026-07-02.
metadata:
  version: "1.0"
  source: aaif-goose/goose
  tags: goose, agent-runtime, rust, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# goose

Goose is a leading agent runtime in the 2026 AI agent engineering landscape (50.6k★).

## When to use this skill

- Local, extensible AI agent as desktop app, CLI, and API
- MCP-native extension system — any MCP server becomes a goose extension
- Recipes: shareable, parameterized agent task definitions
- Headless automation via goose run for CI and scripts
- Provider-agnostic model configuration incl. local models
- Sessions with resume; .goosehints for project context
- Ecosystem overlap: Complements mcp-server-design (goose consumes MCP servers); no runtime overlap in catalog

## Installation

```bash
curl -fsSL https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh | bash
```

## Usage

```bash
curl -fsSL https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh | bash
goose configure   # choose provider + extensions
goose session     # interactive
goose run -t "update deps and run tests"   # headless
```

## Instructions

### Step 1: Initialize the environment
Verify you have Rust installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Rust core agent loop; capabilities added exclusively through MCP extensions; desktop app and CLI share the same engine; recipes parameterize tasks

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Leading vendor-neutral local agent under Linux Foundation governance; alternatives: OpenClaw (personal assistant focus), Claude Code/opencode (coding products); goose is the neutral MCP-native workhorse

## Examples

### Example 1: Minimal Agent Run
```bash
curl -fsSL https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh | bash
goose configure   # choose provider + extensions
goose session     # interactive
goose run -t "update deps and run tests"   # headless
```

## Best practices

1. Follow the primary installation commands for Goose to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/aaif-goose/goose](https://github.com/aaif-goose/goose)
- [https://aaif.io/](https://aaif.io/)
- [https://block.github.io/goose/](https://block.github.io/goose/)
