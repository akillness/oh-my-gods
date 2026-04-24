---
name: agents-cli
description: >
  Build, evaluate, and deploy enterprise-grade AI agents on Google Cloud using Google's agents-cli toolkit.
  Use when you need to scaffold a new agent project, run evaluation suites, deploy to Agent Runtime / Cloud Run / GKE,
  register agents with Gemini Enterprise, or integrate observability with Cloud Trace.
  Triggers on: agents-cli, google agents cli, agent scaffold, agent eval, deploy agent, gemini enterprise agent,
  adk, google adk, google cloud agent, agents-cli deploy, agents-cli eval, uvx google-agents-cli.
allowed-tools: Bash Read Write Edit Glob Grep WebFetch
compatibility: Requires Python 3.11+, uv package manager, and Node.js. Google Cloud credentials (gcloud auth) required for deployment steps. Works with any coding assistant (Claude Code, Gemini CLI, Codex, OpenCode).
license: Apache-2.0
metadata:
  tags: agents-cli, google-cloud, adk, agent-development-kit, gemini-enterprise, eval, deploy, scaffold, ci-cd, observability
  version: "1.0"
  source: https://github.com/google/agents-cli
---

# agents-cli — Google Cloud Agent Development & Deployment

> **Keyword**: `agents-cli` · `google agents cli` · `agent scaffold` · `agents-cli eval` · `deploy agent`
>
> agents-cli extends your coding assistant with Google Cloud agent expertise — from local development to enterprise deployment.

agents-cli is a command-line toolkit by Google that covers the full AI agent lifecycle: scaffold, develop locally, evaluate, deploy to Google Cloud (Agent Runtime / Cloud Run / GKE), and register with Gemini Enterprise. It works as a standalone CLI and as a coding-assistant skill.

## When to use this skill

- Bootstrap a new agent project with structured scaffolding
- Run local evaluation suites with built-in metrics and LLM-based scoring
- Deploy an agent to Google Cloud (Agent Runtime, Cloud Run, or GKE)
- Register an agent with Gemini Enterprise for governance and discovery
- Set up CI/CD pipelines for automated evaluation and deployment
- Integrate Cloud Trace and logging for agent observability
- Choose the right Google Cloud deployment target for your agent

## Instructions

### Step 1: Install agents-cli

**Option A — Standalone CLI (recommended)**

```bash
# Requires Python 3.11+ and uv
pip install uv          # if uv is not installed
uvx google-agents-cli setup
```

Verify installation:

```bash
agents-cli --version
```

**Option B — As a coding-assistant skill**

```bash
npx skills add google/agents-cli
```

**Prerequisites**

- Python 3.11+
- `uv` package manager
- Node.js (for skill installation path)
- `gcloud` CLI authenticated for deployment steps

### Step 2: Scaffold a new agent project

Create a new agent project with the official template:

```bash
agents-cli scaffold my-agent
cd my-agent
```

The scaffold generates:
- Project structure and dependencies
- Agent entrypoint with ADK (Agent Development Kit) wiring
- Evaluation fixtures and test sets
- Deployment configuration files
- CI/CD pipeline templates

To enhance an existing project or upgrade to the latest template version:

```bash
agents-cli scaffold --enhance .
agents-cli scaffold --upgrade .
```

### Step 3: Develop and test locally

Run an agent locally with a prompt:

```bash
agents-cli run "What is the current weather in Tokyo?"
```

Install project dependencies:

```bash
agents-cli install
```

Lint and enforce code quality:

```bash
agents-cli lint
```

### Step 4: Evaluate agent performance

Run the full evaluation suite:

```bash
agents-cli eval run
```

Compare two evaluation runs:

```bash
agents-cli eval compare run-a run-b
```

Evaluation includes:
- Deterministic metrics (latency, token usage, tool call success)
- LLM-based scoring (coherence, relevance, goal completion)
- Test set management with expected vs. actual output comparison

Add custom evaluation fixtures in `evals/` to cover domain-specific scenarios before deploying.

### Step 5: Choose the right deployment target

| Target | Best For | Command |
|--------|----------|---------|
| **Agent Runtime** | Managed, serverless agent hosting | `agents-cli deploy --target agent-runtime` |
| **Cloud Run** | Containerized, event-driven agents | `agents-cli deploy --target cloud-run` |
| **GKE** | Complex, long-running or high-scale agents | `agents-cli deploy --target gke` |

Authenticate with Google Cloud before deploying:

```bash
gcloud auth login
gcloud config set project YOUR_PROJECT_ID
```

Deploy:

```bash
agents-cli deploy
# Or specify target explicitly
agents-cli deploy --target agent-runtime
```

### Step 6: Register with Gemini Enterprise

Publish your agent to the Gemini Enterprise platform for enterprise governance and discovery:

```bash
agents-cli publish gemini-enterprise
```

This registers metadata, governance policies, and endpoint information with the enterprise agent catalog.

### Step 7: Set up CI/CD and observability

Generate a CI/CD pipeline scaffold:

```bash
agents-cli scaffold --ci
```

Observability is built in:
- Cloud Trace integration for distributed tracing
- Structured logging via Google Cloud Logging
- Use `agents-cli run --trace` to emit spans locally for inspection

Add evaluation as a CI gate:

```bash
# In CI — fail pipeline on evaluation regression
agents-cli eval run --fail-on-regression
```

## Examples

### Example 1: New agent from scratch

```bash
uvx google-agents-cli setup
agents-cli scaffold my-support-agent
cd my-support-agent
agents-cli run "How do I reset my password?"
agents-cli eval run
agents-cli deploy --target agent-runtime
```

### Example 2: Evaluate before deploy

```bash
agents-cli eval run
# Review scores — only deploy if all metrics pass threshold
agents-cli deploy
```

### Example 3: Enterprise registration

```bash
agents-cli deploy --target agent-runtime
agents-cli publish gemini-enterprise
```

### Example 4: CI/CD pipeline (GitHub Actions)

```yaml
- name: Evaluate agent
  run: agents-cli eval run --fail-on-regression

- name: Deploy to Agent Runtime
  run: agents-cli deploy --target agent-runtime
```

### Example 5: Use as a coding-assistant skill

```bash
npx skills add google/agents-cli
# Then ask your agent: "scaffold a new customer-support agent and evaluate it"
```

## Best practices

1. Always run `agents-cli eval run` before deploying — treat evaluation regressions as build failures.
2. Start with Agent Runtime for simple stateless agents; move to Cloud Run or GKE only when you need containers or long-running processes.
3. Use `agents-cli scaffold --enhance` to pull in template updates without rebuilding from scratch.
4. Keep evaluation fixtures in `evals/` alongside code so CI can catch regressions automatically.
5. Use `gcloud auth application-default login` for local development rather than service account keys.
6. Register with Gemini Enterprise early to establish governance metadata before production traffic.
7. Prefer `--fail-on-regression` in CI to prevent silent quality degradation across agent iterations.

## References

- [Google agents-cli GitHub](https://github.com/google/agents-cli)
- [Agent Development Kit (ADK)](https://cloud.google.com/agent-development-kit)
- [Agent Runtime documentation](https://cloud.google.com/agent-runtime)
- [Gemini Enterprise](https://cloud.google.com/gemini/docs/enterprise)
- [Google Cloud Trace](https://cloud.google.com/trace)
