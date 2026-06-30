# Agent Skills — LLM Installation Delegation Guide

> Pass this file to an AI agent and it will automatically install the agent-only skill set.
>
> ```bash
> curl -s https://raw.githubusercontent.com/akillness/oh-my-gods/main/setup-all-skills-prompt.md
> ```

---

## Scope (2026 cleanup)

This catalog is **agent + agent-adjacent** — 11 core agent + 10 new 2026 agentic + 7 adjacent (research / routing / extraction / PM) = **28 total**.
Removed: 65 duplicates with [`jeo-skills`](https://github.com/akillness/jeo-skills), plus `omg` workflow.

## Execution Policy (Required)

- **Default execution**: Run `Step 1` (survey is the default), then `Step 2` for full install.
- **Exception**: Skip `Step 2` only if user explicitly requests `core only`, `minimal install`, or `quick install`.
- **survey is the default**: The `/survey` hook and rules stay enabled across platforms — every fresh install must keep `survey` available before any planning task.

---

### Step 0: Assess Environment

1. **Which platform?**
   - Claude Code / Gemini CLI / Codex CLI / OpenCode → all platforms supported. No platform-specific orchestrator skill ships here anymore (use `omc`/`omx`/`ohmg` from [`jeo-skills`](https://github.com/akillness/jeo-skills) if needed).
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

### Step 2: Full Install (28 skills — 21 agent + 7 adjacent)

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
  --skill agent-development-principles \
  --skill ai-research-skills \
  --skill cli-oss-scout \
  --skill frouter \
  --skill langextract \
  --skill openclone \
  --skill pm-skills
```

> `agent-development-principles` is a legacy alias of `agent-principles` — kept for backward compatibility; merge is a future cleanup.

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
npx skills info ralph
npx skills info agent-observability
```

First run by platform:

| Platform | Command |
|----------|---------|
| Claude Code | `/survey "task scope"` then any agent skill |
| Gemini CLI  | `/survey "task scope"` |
| Codex CLI   | `/survey "task scope"` |
| OpenCode    | `/survey "task scope"` |

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

## Skill Reference (28)

### Retained Agent-Focused (11)

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

### New (2026 Agentic / Agent-Architect, 10)

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

### Agent-Adjacent (7)

| Skill | Description |
|-------|-------------|
| `agent-development-principles` | Legacy alias of `agent-principles` (backward compat — merge candidate) |
| `ai-research-skills` | ML / RAG research skills, partially agent-relevant |
| `cli-oss-scout` | General CLI evaluation, useful for agent tooling research |
| `frouter` | Free AI model router for OpenCode / OpenClaw |
| `langextract` | LLM-powered structured information extraction |
| `openclone` | AI persona / clone conversation simulation |
| `pm-skills` | PM framework — 65 skills + 36 commands for product management |

---

> Source: [README.md](README.md) · [README.ko.md](README.ko.md)
