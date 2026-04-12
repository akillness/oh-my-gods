---
name: ohmg
description: >
  Orchestrate Gemini CLI and Google Antigravity multi-agent workflows with
  specialist lanes, Serena Memory state sharing, installation guidance, and
  runtime monitoring. Use when the user needs Gemini-facing task
  coordination, cross-agent role assignment, Serena-backed memory, or
  setup/verification for oh-my-ag. Triggers on: ohmg, oh-my-gemini,
  oh-my-ag, gemini multi-agent, antigravity workflow, serena memory.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: ohmg, multi-agent, orchestration, gemini, antigravity, serena-memory, workflow
  platforms: Gemini, Claude, Codex, Antigravity
  keyword: ohmg
  version: 1.0.0
  source: first-fluke/oh-my-ag
---


# oh-my-ag (ohmg) - Multi-Agent Orchestrator

## When to use this skill

- Coordinating complex multi-domain projects
- Parallelizing tasks across multiple AI agents (PM, Frontend, Backend, etc.)
- Using Serena Memory for cross-agent state management
- Setting up real-time observability dashboards for agent workflows
- Integrating multi-CLI vendors (Gemini, Claude, Codex) in a single project

---

## Instructions

### Step 1: Confirm that ohmg is the right orchestration surface

- Use `ohmg` when the user is working primarily in Gemini CLI or Google Antigravity, or when Gemini is one lane inside a multi-CLI workflow.
- Keep the answer centered on coordinated specialist execution rather than generic brainstorming.
- If the request is really about Codex- or Claude-native orchestration only, route to `omx` or `omc` instead of stretching `ohmg`.

### Step 2: Start with setup and verification when the environment is unclear

- Use `bunx oh-my-ag` for the interactive installer.
- Use `bunx oh-my-ag doctor` to verify the installation before suggesting heavier workflow steps.
- Mention `.agent/config/user-preferences.yaml` when agent-to-CLI mapping or cross-vendor routing matters.

### Step 3: Keep coordination and monitoring explicit

- Name the specialist lanes that matter, such as PM, frontend, backend, QA, or debug.
- Mention Serena Memory when state sharing or handoff continuity matters.
- Mention runtime visibility through `.serena/memories/`, `bunx oh-my-ag dashboard`, or `bunx oh-my-ag dashboard:web` when the user asks how to monitor work.
- Only mention the SSE bridge when the environment actually needs stdio-to-HTTP bridging.

---

## 1. Core Concepts

### Specialized Agents
| Agent | Specialization | Triggers |
|-------|---------------|----------|
| **Workflow Guide** | Coordinates complex projects | "multi-domain", "complex project" |
| **PM Agent** | Requirements, task decomposition | "plan", "break down" |
| **Frontend Agent** | React/Next.js, styling | "UI", "component", "styling" |
| **Backend Agent** | API, database, auth | "API", "database", "auth" |
| **Debug Agent** | Bug diagnosis, RCA | "bug", "error", "crash" |

### Serena Memory
Orchestrator writes structured state to `.serena/memories/` for real-time monitoring and cross-agent coordination.

---

## 2. Installation & Setup

### Prerequisites
- **Bun** (CLI and dashboards)
- **uv** (Serena setup)

### Interactive Setup
```bash
bunx oh-my-ag
```
Select project type to install relevant skills to `.agent/skills/`.

### Verification
```bash
bunx oh-my-ag doctor
```

---

## 3. Usage Patterns

### Explicit Coordination
```text
/coordinate
```
PM planning → agent spawning → QA review.

### Spawning Agents via CLI
```bash
# Spawn backend agent for a specific task
oh-my-ag agent:spawn backend "Implement auth API" session-01
```

### Dashboard Monitoring
- Terminal: `bunx oh-my-ag dashboard`
- Web: `bunx oh-my-ag dashboard:web` (http://localhost:9847)

---

## 4. MCP Connection & Bridging

### SSE Mode (Shared Server)
If environment needs stdio-to-http bridging:
```bash
bunx oh-my-ag bridge http://localhost:12341/sse
```

---

## 5. Configuration

Configure per-agent CLI mapping in `.agent/config/user-preferences.yaml`:
```yaml
agent_cli_mapping:
  frontend: gemini
  backend: codex
  pm: claude
  qa: claude
```

---

## Examples

### Example 1: Coordinate a Gemini-first feature delivery

Input:
```text
Use ohmg to coordinate a Gemini CLI workflow for a mobile app feature with PM, backend, frontend, and QA lanes.
```

Output shape:
- treat `ohmg` as the Gemini or Antigravity orchestration surface
- name the specialist lanes explicitly
- keep the answer focused on coordinated execution rather than single-agent advice

### Example 2: Install and verify before using the workflow

Input:
```text
How do I set up ohmg for a new project and verify it before I start?
```

Output shape:
- use `bunx oh-my-ag` as the setup path
- include `bunx oh-my-ag doctor` as the verification step
- keep the answer on `ohmg`, not `omg` or `omx`

### Example 3: Explain Serena-backed coordination

Input:
```text
What should I configure if I want Serena Memory to coordinate Gemini, Claude, and Codex workers in one project?
```

Output shape:
- mention Serena Memory directly
- include `.agent/config/user-preferences.yaml` or `agent_cli_mapping`
- explain the coordination model in `ohmg` terms

## Best practices

1. Treat `ohmg` as the Gemini or Antigravity answer surface first, and only broaden to multi-CLI routing when the user actually needs cross-vendor coordination.
2. Start with install or doctor guidance when the environment state is unknown; do not assume the runtime is already configured.
3. Keep role assignment explicit so the skill teaches coordinated execution, not a vague "multi-agent" label.
4. Keep the main skill compact and push future deep operational detail into support files only when the entrypoint stops being reviewable.

## References

- `README.md` and `README.ko.md` for the repo's platform matrix and skill catalog
- `.god-skills/ohmg/evals/evals.json` for the current optimization-readiness prompt set
- https://geminicli.com/docs/
- https://geminicli.com/docs/cli/tutorials/skills-getting-started/

---

## Quick Reference

| Command | Action |
|---------|--------|
| `bunx oh-my-ag` | Interactive installer |
| `/setup` | Agent-side configuration |
| `bunx oh-my-ag doctor` | System check & repair |
| `bunx oh-my-ag update` | Update skills |
| `bunx oh-my-ag usage` | Show quota usage |
