# Agent Skills — LLM Installation Delegation Guide

> Pass this file to an AI agent and it will automatically install the agent-only skill set.
>
> ```bash
> curl -s https://raw.githubusercontent.com/akillness/oh-my-gods/main/setup-all-skills-prompt.md
> ```

---

## Scope (2026 update)

This catalog contains **42 agent-engineering skills**:
- **20 Core Agent & Frameworks** (planning, execution, workflow, SDKs like OpenClaw, Pi, Claude Agent SDK, Google ADK, smolagents, CrewAI, Agno, Mastra, Letta)
- **10 Architecture & Ops** (memory architecture, observability, guardrails, SLA design, tool routing, evaluation, benchmarking)
- **11 Sandbox, Browser, Voice, Memory & Protocols** (E2B, Daytona sandboxes; Browser Use, Stagehand browser automation; Mem0, Graphiti memory; LiveKit, Pipecat voice; AG-UI protocol; Goose runtime; OpenHands platform)
- **1 Compatibility Alias** (agent-development-principles -> agent-principles)

All non-agent-engineering skills (ML research, generic web scraping, PM frameworks, persona cloning) have been removed.

## Execution Policy (Required)

- **Default execution**: Run `Step 1` (survey is the default), then `Step 2` for full install.
- **Exception**: Skip `Step 2` only if user explicitly requests `core only`, `minimal install`, or `quick install`.
- **survey is the default**: The `/survey` hook and rules stay enabled across platforms — every fresh install must keep `survey` available before any planning task.

---

### Step 0: Assess Environment

1. **Which platform?**
   - Claude Code / Gemini CLI / Codex CLI / OpenCode → all platforms supported.
   - All / Unsure → install `survey` (default) + this catalog.

2. **Verify `skills` CLI:**
   ```bash
   command -v skills >/dev/null && echo "skills CLI available" || echo "Will install via npx"
   ```

3. **Standardize paths:**
   ```bash
   export SKILLS_CANONICAL="${HOME}/.agent-skills"
   SKILL_DESTS=(
     "${HOME}/.claude/skills" "${PWD}/.claude/skills"
     "${HOME}/.codex/skills"  "${PWD}/.codex/skills"
     "${HOME}/.gemini/skills" "${PWD}/.gemini/skills"
     "${HOME}/.opencode/skills" "${PWD}/.opencode/skills"
     "${HOME}/.config/opencode/skills" "${PWD}/.config/opencode/skills"
   )
   mkdir -p "${SKILLS_CANONICAL}"
   for dest in "${SKILL_DESTS[@]}"; do mkdir -p "${dest}"; done
   echo "✅ Skill paths ready"
   ```

---

### Step 1: Default Install (`survey` baseline)

Survey is the **always-on** default — it produces `.survey/` artifacts that every later skill can consume.

```bash
# survey first — landscape scan before planning
npx skills add -g https://github.com/akillness/jeo-skills --skill survey
```

> **Note**: `survey` lives in [`jeo-skills`](https://github.com/akillness/jeo-skills) (not duplicated here). The hook below ensures it stays callable.

**Default hook (Claude Code example):**
```bash
# Keeps /survey as the default pre-plan hook
mkdir -p ~/.claude/hooks
cat > ~/.claude/hooks/survey-default.sh <<'EOF'
#!/usr/bin/env bash
# Auto-suggest /survey before any plan-creating skill activates.
echo "[hint] Consider running /survey first to scan the landscape." >&2
EOF
chmod +x ~/.claude/hooks/survey-default.sh
```

---

### Step 2: Full Install (42 skills)

> Update mode: existing skills are overwritten with the latest version.

```bash
npx skills add -g https://github.com/akillness/oh-my-gods \
  --skill agent-configuration \
  --skill agent-evaluation \
  --skill agent-manager \
  --skill agent-principles \
  --skill agent-workflow \
  --skill agents-cli \
  --skill deepagents \
  --skill langchain-bmad \
  --skill langgraph-workflow \
  --skill ralph \
  --skill ralphmode \
  --skill crewai \
  --skill agno \
  --skill smolagents \
  --skill mastra \
  --skill letta \
  --skill claude-agent-sdk \
  --skill google-adk \
  --skill openclaw \
  --skill pi-agent \
  --skill agent-observability \
  --skill agent-memory-architecture \
  --skill mcp-server-design \
  --skill agent-guardrails \
  --skill agent-system-design \
  --skill agent-tool-routing \
  --skill multi-agent-eval-harness \
  --skill a2a-protocol \
  --skill reflexion-pattern \
  --skill agent-benchmarking \
  --skill browser-use \
  --skill stagehand \
  --skill mem0 \
  --skill graphiti \
  --skill e2b \
  --skill daytona \
  --skill livekit-agents \
  --skill pipecat \
  --skill ag-ui \
  --skill goose \
  --skill openhands \
  --skill agent-development-principles
```

Skip only when explicitly requested (`core only`, `minimal install`, `quick install`).

---

### Step 3: Sync to Platform Directories

```bash
# Auto-detect source
is_non_empty_dir() { [ -d "$1" ] && [ -n "$(ls -A "$1" 2>/dev/null)" ]; }
if   is_non_empty_dir "${HOME}/.agent-skills"; then SKILL_SRC="${HOME}/.agent-skills"
elif is_non_empty_dir "${PWD}/.agent-skills";  then SKILL_SRC="${PWD}/.agent-skills"
else echo "non-empty skills directory not found"; exit 1
fi

# Mirror to canonical
mkdir -p "${HOME}/.agent-skills"
if command -v rsync >/dev/null 2>&1; then
  rsync -a "${SKILL_SRC}/" "${HOME}/.agent-skills/"
else
  rm -rf "${HOME}/.agent-skills" && mkdir -p "${HOME}/.agent-skills"
  cp -R "${SKILL_SRC}/." "${HOME}/.agent-skills/"
fi

# Fan out to platforms
for dest in \
    "${HOME}/.claude/skills" "${PWD}/.claude/skills" \
    "${HOME}/.codex/skills"  "${PWD}/.codex/skills" \
    "${HOME}/.gemini/skills" "${PWD}/.gemini/skills" \
    "${HOME}/.opencode/skills" "${PWD}/.opencode/skills" \
    "${HOME}/.config/opencode/skills" "${PWD}/.config/opencode/skills"; do
  mkdir -p "${dest}"
  if command -v rsync >/dev/null 2>&1; then
    rsync -a "${HOME}/.agent-skills/" "${dest}/"
  else
    cp -R "${HOME}/.agent-skills"/. "${dest}/"
  fi
done
```

---

### Step 4: Verify

```bash
ls "${HOME}/.agent-skills" 2>/dev/null
npx skills info openclaw
npx skills info browser-use
```

---

### Step 5: Optional Star ⭐

After verification:

> "If this helped, would you like to star the repo?"

If yes:
```bash
gh api --silent --method PUT /user/starred/akillness/oh-my-gods >/dev/null 2>&1 || true
```

Only run with explicit consent. Requires `gh auth login`.

---

## Skill Reference (42)

### Core Agent & Frameworks (20)

| Skill | Description |
|-------|-------------|
| `agent-configuration` | AGENTS.md, hooks, permissions, skills/plugins/MCP setup |
| `agent-evaluation` | Eval systems: graders, CI gates, production monitoring |
| `agent-manager` | tmux+Python lifecycle: start/stop/monitor/schedule/heartbeat |
| `agent-principles` | Core AI-agent collaboration: context, plan/execute, verify |
| `agent-workflow` | Day-to-day coding-agent loops: session recovery, worktrees, handoffs |
| `agents-cli` | Google Cloud agent lifecycle (scaffold, deploy, Cloud Trace) |
| `deepagents` | LangGraph batteries-included harness — file tools, subagents, HITL |
| `langchain-bmad` | BMAD phase gates ↔ LangChain/LangGraph/Deep Agents routing |
| `langgraph-workflow` | StateGraph, checkpointing, conditional branching, parallel nodes |
| `ralph` | Ouroboros spec-first loop — interview→seed→execute→evaluate→evolve |
| `ralphmode` | Sandbox + approval profiles for long-running agent loops |
| `crewai` | Role-based multi-agent framework — crews, flows, tasks, tools |
| `agno` | High-performance multi-agent framework (ex phidata) — AgentOS runtime |
| `smolagents` | HuggingFace minimal code-first agents — CodeAgent writes actions as Python |
| `mastra` | TypeScript agent framework — agents, workflows, RAG, evals, observability |
| `letta` | Stateful agents with self-editing memory (MemGPT lineage) — memory blocks |
| `claude-agent-sdk` | Anthropic's official SDK to build agents on the Claude Code harness |
| `google-adk` | Google Agent Development Kit — code-first multi-agent |
| `openclaw` | Personal AI assistant/agent runtime — gateway, channels, skills, node mode |
| `pi-agent` | Minimal hackable coding agent + TypeScript toolkit monorepo |

### Architecture & Ops (10)

| Skill | Description |
|-------|-------------|
| `agent-observability` | LangSmith/Langfuse/Phoenix selection, node-level traces, replay, eval-in-trace |
| `agent-memory-architecture` | mem0/Letta/Zep selection, tiered (core/recall/archival), temporal vs snapshot |
| `mcp-server-design` | MCP server build/deploy: Server Cards, stateless transports, registry compliance |
| `agent-guardrails` | NeMo Colang + Lakera/LLM Guard layered defense — prompt injection, exfiltration |
| `agent-system-design` | Agent SLA discipline: MAX_LOOPS, cost budgets, circuit breakers, sovereignty |
| `agent-tool-routing` | Tool registries, capability discovery, schemas, router policies, fallbacks |
| `multi-agent-eval-harness` | Role-level metrics, coordination failure tests, transcript grading |
| `a2a-protocol` | Agent-to-Agent horizontal messaging (Linux Foundation AAIF 2026 standard) |
| `reflexion-pattern` | Critic node + verbal memory of failures, stable rubric scoring, retry budgets |
| `agent-benchmarking` | Map capabilities to SWE-bench/WebArena/OSWorld + custom regression packs |

### Sandbox, Browser, Voice, Memory & Protocols (11)

| Skill | Description |
|-------|-------------|
| `browser-use` | Make websites accessible for AI agents — autonomous browsing, DOM extraction |
| `stagehand` | Production browser automation SDK mixing code and natural language |
| `mem0` | Universal memory layer for AI agents — add/search memories, graph memory |
| `graphiti` | Real-time temporal knowledge graphs for agent memory |
| `e2b` | Open-source cloud sandboxes for AI code execution — Firecracker microVMs |
| `daytona` | Secure elastic infrastructure for running AI-generated code — sub-90ms sandboxes |
| `livekit-agents` | Realtime voice AI agents on LiveKit WebRTC — STT/LLM/TTS pipelines |
| `pipecat` | Open-source framework for realtime voice and multimodal conversational agents |
| `ag-ui` | Agent-User Interaction protocol — event-based agent-to-frontend streaming |
| `goose` | Extensible local AI agent (Rust), MCP-native extensions, CLI + desktop |
| `openhands` | Software-development agent platform — CLI, GUI, GitHub actions, sandboxed runtime |

### Compatibility Aliases (1)

| Skill | Description |
|-------|-------------|
| `agent-development-principles` | Legacy alias of `agent-principles` (backward compat — merge candidate) |

---

> Source: [README.md](README.md) · [README.ko.md](README.ko.md)
