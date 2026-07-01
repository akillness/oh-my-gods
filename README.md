# oh-my-gods

<div align="center">

[![Skills](https://img.shields.io/badge/Skills-29-blue?style=for-the-badge)](https://github.com/akillness/oh-my-gods)

[![Platform](https://img.shields.io/badge/Platform-Claude%20%7C%20Gemini%20%7C%20Codex%20%7C%20OpenCode-orange?style=for-the-badge)](https://github.com/akillness/oh-my-gods)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-orange?logo=buy-me-a-coffee)](https://www.buymeacoffee.com/akillness3q)

</div>

```
  ██████╗ ██╗  ██╗      ███╗   ███╗██╗   ██╗      ██████╗  ██████╗ ██████╗ ███████╗
 ██╔═══██╗██║  ██║      ████╗ ████║╚██╗ ██╔╝     ██╔════╝ ██╔═══██╗██╔══██╗██╔════╝
 ██║   ██║███████║█████╗██╔████╔██║ ╚████╔╝█████╗██║  ███╗██║   ██║██║  ██║███████╗
 ██║   ██║██╔══██║╚════╝██║╚██╔╝██║  ╚██╔╝ ╚════╝██║   ██║██║   ██║██║  ██║╚════██║
 ╚██████╔╝██║  ██║      ██║ ╚═╝ ██║   ██║         ╚██████╔╝╚██████╔╝██████╔╝███████║
  ╚═════╝ ╚═╝  ╚═╝      ╚═╝     ╚═╝   ╚═╝          ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝
```

<div align="center">

**Agent-engineering skills for building, evaluating, and operating LLM agents**

*29 focused skills · no duplication with [jeo-skills](https://github.com/akillness/jeo-skills) · cross-platform*

[Quick Start](#-quick-start) · [Skill Catalog](#-skill-catalog) · [Installation](#-installation) · [한국어](README.ko.md)

</div>

---

## 🎯 What is oh-my-gods?

`oh-my-gods` is a lean, **agent-engineering** skill set — the layer you reach for when *building the agent itself*: architecture, memory, tool routing, guardrails, evaluation, observability, and multi-agent protocols.

It is deliberately scoped to **not duplicate** [`jeo-skills`](https://github.com/akillness/jeo-skills). General development workflow, orchestration (`omg`/`omc`/`omx`/`ohmg`), planning, frontend/backend, and content skills all live there. oh-my-gods keeps only the **29 agent-focused skills** that complement that collection.

| You want to… | Use |
|--------------|-----|
| Design agent memory, tools, guardrails, evals | **oh-my-gods** (this repo) |
| Orchestrate a dev task, plan, ship, write docs | [jeo-skills](https://github.com/akillness/jeo-skills) |

---

## 🚀 Quick Start

> **Prerequisite**: the `skills` CLI.

```bash
npm install -g skills
```

```bash
# One-liner install
curl -fsSL https://raw.githubusercontent.com/akillness/oh-my-gods/main/install.sh | bash
```

```bash
# Or hand the LLM-driven guide to your agent
curl -s https://raw.githubusercontent.com/akillness/oh-my-gods/main/setup-all-skills-prompt.md
```

```bash
# Or install everything directly
npx skills add -g https://github.com/akillness/oh-my-gods --skill '*' --yes
```

---

## 📚 Skill Catalog

### Core Agent (11)

| Skill | Description |
|-------|-------------|
| `agent-configuration` | AGENTS.md, hooks, permissions, skills/plugins/MCP setup |
| `agent-evaluation` | Eval systems: graders, CI gates, production monitoring |
| `agent-manager` | tmux + Python lifecycle — start/stop/monitor/schedule/heartbeat |
| `agent-principles` | Core AI-agent collaboration: context, plan/execute, verify |
| `agent-workflow` | Day-to-day coding-agent loops: session recovery, worktrees, handoffs |
| `agents-cli` | Google Cloud agent lifecycle — scaffold, evaluate, deploy |
| `deepagents` | LangGraph batteries-included harness — file tools, subagents, HITL |
| `langchain-bmad` | BMAD phase gates ↔ LangChain / LangGraph / Deep Agents routing |
| `langgraph-workflow` | StateGraph, checkpointing, conditional branching, parallel nodes |
| `ralph` | Ouroboros spec-first loop — interview → seed → execute → evaluate → evolve |
| `ralphmode` | Sandbox + approval profiles for long-running agent loops |

### Agent Architecture & Ops (10)

| Skill | Description |
|-------|-------------|
| `agent-observability` | LangSmith/Langfuse/Phoenix selection, node-level traces, replay, eval-in-trace |
| `agent-memory-architecture` | mem0/Letta/Zep selection, tiered core/recall/archival, temporal vs snapshot |
| `mcp-server-design` | MCP servers — Server Cards, stateless transports, registry compliance |
| `agent-guardrails` | NeMo Colang + Lakera/LLM Guard — prompt injection, exfiltration, tool misuse |
| `agent-system-design` | Agent SLA discipline: MAX_LOOPS, cost budgets, circuit breakers, sovereignty |
| `agent-tool-routing` | Tool registries, capability discovery, schemas, router policies, fallbacks |
| `multi-agent-eval-harness` | Role-level metrics, coordination-failure tests, transcript grading |
| `a2a-protocol` | Agent-to-Agent horizontal messaging (Linux Foundation AAIF 2026 standard) |
| `reflexion-pattern` | Critic node + verbal memory of failures, stable rubric scoring, retry budgets |
| `agent-benchmarking` | Map capabilities to SWE-bench/WebArena/OSWorld + custom regression packs |

### Agent-Adjacent (8)

| Skill | Description |
|-------|-------------|
| `agent-development-principles` | Compatibility alias of `agent-principles` (routes there) |
| `ai-research-skills` | 86 AI-research skills for autonomous ML research — fine-tuning, RLHF, RAG, papers |
| `cli-oss-scout` | Evidence-gated discovery/triage of OSS CLI candidates for agent tooling |
| `frouter` | Free AI model router/benchmarker for OpenCode / OpenClaw |
| `langextract` | LLM-powered, source-grounded structured extraction from text |
| `openclone` | AI persona clones for multi-expert perspective conversations |
| `pm-skills` | Product-management OS — 65 skills, 36 commands across 8 plugins |
| `scrapling` | Adaptive web scraping (Scrapling) + screenshot-based visual RAG fallback (PixelRAG) |

---

## 📦 Installation

```bash
# Prerequisite
npm install -g skills

# Recommended — one-liner
curl -fsSL https://raw.githubusercontent.com/akillness/oh-my-gods/main/install.sh | bash

# Or all 29 skills explicitly
npx skills add -g https://github.com/akillness/oh-my-gods --skill '*' --yes
```

**Environment**: `node >= 18`, `git`, `bash`. Skills are copied to `~/.agent-skills` and fanned out to `~/.claude/skills`, `~/.codex/skills`, `~/.gemini/skills`, and `~/.opencode/skills`.

See [`setup-all-skills-prompt.md`](setup-all-skills-prompt.md) for the full LLM-driven install/verify walkthrough.

---

## 📎 References & Sources

| Skill | Source | License |
|-------|--------|---------|
| `ralph` | [Q00/ouroboros](https://github.com/Q00/ouroboros) | MIT |
| `deepagents` | [langchain-ai/deepagents](https://github.com/langchain-ai/deepagents) | MIT |
| `langextract` | [google/langextract](https://github.com/google/langextract) | Apache-2.0 |
| `agent-manager` | [fractalmind-ai/agent-manager-skill](https://github.com/fractalmind-ai/agent-manager-skill) | MIT |
| `pm-skills` | [phuryn/pm-skills](https://github.com/phuryn/pm-skills) | MIT |
| `ai-research-skills` | [Orchestra-Research/AI-Research-SKILLs](https://github.com/Orchestra-Research/AI-Research-SKILLs) | MIT |
| `frouter` | [jyoung105/frouter](https://github.com/jyoung105/frouter) | MIT |
| `agent-development-principles` | [ykdojo/claude-code-tips](https://github.com/ykdojo/claude-code-tips) | MIT |
| `scrapling` | [D4Vinci/Scrapling](https://github.com/D4Vinci/Scrapling) + [StarTrail-org/PixelRAG](https://github.com/StarTrail-org/PixelRAG) | BSD-3-Clause / Apache-2.0 |
| `a2a-protocol` | Linux Foundation AAIF | — |
| Agent Skills Spec | [agentskills.io](https://agentskills.io/specification) | — |

---

<div align="center">

If oh-my-gods helps you, consider supporting the project!

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/akillness3q)

<img src="qr-code.png" alt="Buy Me A Coffee QR Code" width="180">

Made with ❤️ by [JEO-tech-ai](https://github.com/JEO-tech-ai) — ⭐ star the repo if it helps!

</div>
