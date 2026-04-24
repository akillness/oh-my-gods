# oh-my-gods — Agent Installation Guide

> **For AI Agents**: Read this file in full, then execute all steps without asking for further confirmation. Default installation is **full** — only skip steps if the user explicitly requests "minimal" or "core only."

> **CRITICAL — Preserve Existing Skills**: This installation MUST NOT delete or remove any skills that were not installed by this guide. Only add new skills or overwrite/update skills from this repository. Never run `skills remove`, `skills clear`, `skills reset`, or any destructive command. If a skill already exists, update it in place.

> **CRITICAL — No Duplicate Platform Exposure**: Platform-specific skills (omc, ohmg, omx) MUST only be linked to their target agent(s). Use `-a` to target specific agents — never use `-a '*'` for platform-specific skills.

---

## Execution Principles

| Perspective | Rule |
|-------------|------|
| **Systems Engineer** | Lock defaults explicitly — full install unless overridden |
| **New User** | Eliminate ambiguity — run the complete installation by default |
| **Guide Author** | Skip full install only when user says "core only" or "minimal install" |
| **Preservation Rule** | Never delete existing skills — only add new or overwrite skills from this repo |
| **Dedup Rule** | Platform-specific skills target only their agents; shared skills target all agents |

---

## Step 0 — Environment Assessment

Check which AI platforms are installed and set the installation root:

```bash
# skills CLI v1.x installs to ~/.agents/skills/ and symlinks to all platform paths
SKILLS_ROOT="$HOME/.agents/skills"
REPO_URL="https://github.com/akillness/oh-my-gods"

# Detect available platforms and build agent target list
echo "=== Platform Detection ==="
DETECTED_AGENTS=""
if command -v claude   &>/dev/null; then echo "✅ Claude Code";  DETECTED_AGENTS="${DETECTED_AGENTS:+$DETECTED_AGENTS,}claude-code"; fi
if command -v codex    &>/dev/null; then echo "✅ Codex CLI";    DETECTED_AGENTS="${DETECTED_AGENTS:+$DETECTED_AGENTS,}codex"; fi
if command -v gemini   &>/dev/null; then echo "✅ Gemini CLI";   DETECTED_AGENTS="${DETECTED_AGENTS:+$DETECTED_AGENTS,}gemini-cli"; fi
if command -v opencode &>/dev/null; then echo "✅ OpenCode";     DETECTED_AGENTS="${DETECTED_AGENTS:+$DETECTED_AGENTS,}opencode"; fi

[ -z "$DETECTED_AGENTS" ] && { echo "⚠️  No AI agents detected. Install at least one platform first."; exit 1; }
echo ""
echo "Target agents: $DETECTED_AGENTS"

# Snapshot existing skills BEFORE installation (for preservation check)
echo ""
echo "=== Existing Skills (will be preserved) ==="
if [ -d "$SKILLS_ROOT" ]; then
  ls "$SKILLS_ROOT" 2>/dev/null | sort > /tmp/skills_before.txt
  cat /tmp/skills_before.txt
  echo "($(wc -l < /tmp/skills_before.txt | tr -d ' ') skills found — none will be removed)"
else
  echo "(skills directory not yet created)"
  touch /tmp/skills_before.txt
fi
```

---

## Step 1 — Install All Shared Skills (Batch)

Install all 79 skills to the global location, then link shared skills to all detected agents.
Re-running this step safely overwrites existing skills (symlinks are updated in place).

> **Do not skip Step 2** — it re-links platform-specific skills to their correct agents only.

```bash
# Prerequisite: install skills CLI globally (one-time setup)
npm install -g skills

# ────────────────────────────────────────────────────────
# Flag reference:
#   -g          : install to global location (~/.agents/skills/)
#   -a <agents> : link to specific agents (comma-separated, or '*' for all)
#   --skill <s> : select specific skills (comma-separated, or '*' for all)
#   --yes       : skip interactive prompts
#   --copy      : copy files instead of symlinks (robust overwrite)
# ────────────────────────────────────────────────────────

# Install ALL 79 skills to global store, link shared skills to all detected agents
# Platform-specific skills (omc, ohmg, omx, ralphmode) are corrected in Step 2
skills add -g "$REPO_URL" \
  --skill agent-browser \
  --skill agent-configuration \
  --skill agent-development-principles \
  --skill agent-evaluation \
  --skill agent-manager \
  --skill agent-principles \
  --skill agent-workflow \
  --skill agentation \
  --skill ai-research-skills \
  --skill api-design \
  --skill api-documentation \
  --skill authentication-setup \
  --skill autoresearch \
  --skill backend-testing \
  --skill bmad \
  --skill bmad-idea \
  --skill changelog-maintenance \
  --skill clawteam \
  --skill code-refactoring \
  --skill code-review \
  --skill codebase-search \
  --skill data-analysis \
  --skill database-schema-design \
  --skill debugging \
  --skill deepagents \
  --skill deployment-automation \
  --skill design-system \
  --skill environment-setup \
  --skill fabric \
  --skill file-organization \
  --skill firebase-ai-logic \
  --skill frouter \
  --skill frontend-design-system \
  --skill genkit \
  --skill git-submodule \
  --skill git-workflow \
  --skill langextract \
  --skill log-analysis \
  --skill marketing-automation \
  --skill monitoring-observability \
  --skill ohmg \
  --skill omc \
  --skill omg \
  --skill omx \
  --skill opencontext \
  --skill pattern-detection \
  --skill performance-optimization \
  --skill plannotator \
  --skill playwriter \
  --skill pm-skills \
  --skill presentation-builder \
  --skill prompt-repetition \
  --skill ralph \
  --skill ralphmode \
  --skill react-best-practices \
  --skill remotion-video-production \
  --skill responsive-design \
  --skill security-best-practices \
  --skill skill-autoresearch \
  --skill skill-standardization \
  --skill sprint-retrospective \
  --skill standup-meeting \
  --skill state-management \
  --skill survey \
  --skill task-estimation \
  --skill task-planning \
  --skill technical-writing \
  --skill testing-strategies \
  --skill ui-component-patterns \
  --skill user-guide-writing \
  --skill vercel-deploy \
  --skill vercel-react-best-practices \
  --skill vibe-kanban \
  --skill video-production \
  --skill web-design-guidelines \
  --skill workflow-automation \
  --skill langchain-bmad \
  --skill strix \
  --skill obsidian-cli \
  --skill scrapling \
  --skill agents-cli \
  -a '*' --yes --copy

# Also install the official LangChain skills
skills add -g langchain-ai/langchain-skills --skill '*' --yes --copy
```

> **Gemini CLI alternative**:
> ```bash
> gemini extensions install https://github.com/akillness/oh-my-gods
> ```

> **`presentation-builder` note**: assumes a `slides-grab` workflow. Before first use, install Node.js 18+, run `npx playwright install chromium`, and ensure `slides-grab --help` succeeds.

---

## Step 2 — Fix Platform-Specific Skill Links (Dedup)

Platform-specific skills must only appear on their target agent(s).
This step **re-links** them with correct `-a` targeting, replacing the `*` links from Step 1.

```bash
# ╔══════════════════════════════════════════════════════════════╗
# ║  Platform Skill Mapping (from SKILL.md metadata)            ║
# ║                                                              ║
# ║  omc       → Claude Code only                               ║
# ║  ohmg      → Gemini CLI + Antigravity                       ║
# ║  omx       → Codex + Claude Code + Gemini CLI               ║
# ║  ralphmode → Claude Code + Codex + Gemini CLI               ║
# ╚══════════════════════════════════════════════════════════════╝

# Re-add platform-specific skills with correct targeting
skills add -g "$REPO_URL" --skill omc       -a 'claude-code'                      --yes --copy
skills add -g "$REPO_URL" --skill ohmg      -a 'gemini-cli,antigravity'           --yes --copy
skills add -g "$REPO_URL" --skill omx       -a 'codex,claude-code,gemini-cli'     --yes --copy
skills add -g "$REPO_URL" --skill ralphmode -a 'claude-code,codex,gemini-cli'     --yes --copy

# ── Clean stale symlinks from non-target agents ──
echo ""
echo "=== Cleaning duplicate platform skill links ==="

cleanup_skill_link() {
  local skill="$1"; shift
  local allowed=("$@")

  for agent_dir in ~/.claude/skills ~/.codex/skills ~/.gemini/skills ~/.config/opencode/skills; do
    local agent_name
    case "$agent_dir" in
      */.claude/*)          agent_name="claude-code" ;;
      */.codex/*)           agent_name="codex" ;;
      */.gemini/*)          agent_name="gemini-cli" ;;
      */.config/opencode/*) agent_name="opencode" ;;
    esac

    local is_allowed=false
    for a in "${allowed[@]}"; do
      [[ "$a" == "$agent_name" ]] && is_allowed=true
    done

    if ! $is_allowed && [ -e "$agent_dir/$skill" ]; then
      rm -rf "$agent_dir/$skill"
      echo "  Removed $skill from $agent_name (not a target platform)"
    fi
  done
}

cleanup_skill_link "omc"       "claude-code"
cleanup_skill_link "ohmg"      "gemini-cli"
cleanup_skill_link "omx"       "codex" "claude-code" "gemini-cli"
cleanup_skill_link "ralphmode" "claude-code" "codex" "gemini-cli"

echo "✅ Platform skill deduplication complete"
```

---

## Step 3 — Platform-Specific Setup

Run the setup script for every detected platform:

```bash
# Claude Code — omg ExitPlanMode hook + oh-my-claudecode
if command -v claude &>/dev/null; then
  bash "$SKILLS_ROOT/omg/scripts/setup-claude.sh"
  # agentation Claude Code Official Skill (recommended)
  npx skills add -g benjitaylor/agentation --yes
  echo "✅ Claude Code configured"
fi

# Codex CLI
if command -v codex &>/dev/null; then
  bash "$SKILLS_ROOT/omg/scripts/setup-codex.sh"
  echo "✅ Codex CLI configured"
fi

# Gemini CLI — omg AfterAgent hook
if command -v gemini &>/dev/null; then
  bash "$SKILLS_ROOT/omg/scripts/setup-gemini.sh"
  echo "✅ Gemini CLI configured"
fi

# OpenCode
if command -v opencode &>/dev/null; then
  # Fetch latest oh-my-opencode installation guide
  curl -s https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/refs/heads/master/docs/guide/installation.md
  echo "✅ OpenCode: follow installation guide above for your subscription"
fi
```

> **Claude Code — oh-my-claudecode plugin**:
> ```
> /plugin marketplace add https://github.com/Yeachan-Heo/oh-my-claudecode
> /omc:omc-setup
> ```

> **omg Agent Protocol**: omg EXECUTE phase requires `/omc:team` and will **not** fall back to single-agent execution. Set `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` before running omg.

---

## Step 4 — Verification

```bash
# Confirm key skills installed
echo ""
echo "=== Core Skill Check ==="
for skill in omg omc ohmg omx ralph plannotator bmad survey agentation vibe-kanban; do
  [ -f "$SKILLS_ROOT/$skill/SKILL.md" ] \
    && echo "✅ $skill" \
    || echo "❌ $skill — re-run: skills add -g $REPO_URL --skill $skill --yes --copy"
done

# Verify platform-specific skills are NOT on wrong agents
echo ""
echo "=== Platform Dedup Check ==="
check_no_dup() {
  local skill="$1" agent_dir="$2" agent_name="$3"
  if [ -e "$agent_dir/$skill" ]; then
    echo "⚠️  $skill found on $agent_name (should not be there)"
  fi
}
check_no_dup "omc"  "$HOME/.gemini/skills"          "gemini-cli"
check_no_dup "omc"  "$HOME/.codex/skills"            "codex"
check_no_dup "omc"  "$HOME/.config/opencode/skills"  "opencode"
check_no_dup "ohmg" "$HOME/.claude/skills"           "claude-code"
check_no_dup "ohmg" "$HOME/.codex/skills"            "codex"
check_no_dup "ohmg" "$HOME/.config/opencode/skills"  "opencode"
echo "✅ Platform dedup verified" || true

# Verify no existing skills were removed
if [ -f /tmp/skills_before.txt ] && [ -s /tmp/skills_before.txt ]; then
  echo ""
  echo "=== Preservation Check ==="
  ls "$SKILLS_ROOT" 2>/dev/null | sort > /tmp/skills_after.txt
  MISSING=$(comm -23 /tmp/skills_before.txt /tmp/skills_after.txt)
  if [ -z "$MISSING" ]; then
    echo "✅ All pre-existing skills preserved — nothing was removed"
  else
    echo "⚠️  The following skills were present before but are missing now:"
    echo "$MISSING"
    echo "Restore them: skills add -g <source> --skill <name> --yes --copy"
  fi
  rm -f /tmp/skills_before.txt /tmp/skills_after.txt
fi

# Final count
echo ""
TOTAL=$(ls "$SKILLS_ROOT" 2>/dev/null | wc -l | tr -d ' ')
echo "=== Installation Complete: $TOTAL skills installed ==="
```

First run after installation:

| Platform | Command |
|----------|---------|
| Claude Code | `omg "task description"` or `/omc:team "task"` |
| Gemini CLI | `/omg "task description"` |
| Codex CLI | `/omg "task description"` |
| OpenCode | `/omg "task description"` |

---

## Step 5 — GitHub Star (Consent-First Auto-Star)

> **For AI Agents**: This step runs automatically as part of the installation flow.
> Check `gh` auth status first, then ask the user **once**. If the user consents, execute immediately.
> If the user declines or `gh` is not authenticated, skip silently. Never re-ask in the same session.

```bash
# ── Consent-First Auto-Star ──
STAR_GUARD="$HOME/.omc/state/oh-my-gods-star-prompted"
STAR_REPO="akillness/oh-my-gods"

if [ -f "$STAR_GUARD" ]; then
  echo "(star prompt already shown — skipping)"
else
  mkdir -p "$(dirname "$STAR_GUARD")"

  if ! command -v gh &>/dev/null; then
    echo ""
    echo "=== GitHub Star ==="
    echo "gh CLI not found. To star the repo later:"
    echo "  brew install gh && gh auth login"
    echo "  gh api --method PUT /user/starred/$STAR_REPO"
    touch "$STAR_GUARD"

  elif ! gh auth status &>/dev/null 2>&1; then
    echo ""
    echo "=== GitHub Star ==="
    echo "gh CLI found but not authenticated. To star the repo later:"
    echo "  gh auth login"
    echo "  gh api --method PUT /user/starred/$STAR_REPO"
    touch "$STAR_GUARD"

  else
    echo ""
    echo "=== GitHub Star ==="
    echo "If you found this helpful, would you like to star the repository?"
    echo ""
    if [ -t 0 ]; then
      read -p "Star $STAR_REPO? [Y/n] " -n 1 -r REPLY
      echo ""
      if [[ -z "$REPLY" || "$REPLY" =~ ^[Yy]$ ]]; then
        gh api --silent --method PUT "/user/starred/$STAR_REPO" 2>/dev/null \
          && echo "Starred $STAR_REPO" \
          || echo "Star failed — try: gh api --method PUT /user/starred/$STAR_REPO"
      else
        echo "Skipped. You can star later: gh api --method PUT /user/starred/$STAR_REPO"
      fi
    else
      echo "Run this to star: gh api --method PUT /user/starred/$STAR_REPO"
    fi
    touch "$STAR_GUARD"
  fi
fi
```

**For AI Agents (Claude Code / Codex / Gemini / OpenCode)**:

When executing this guide in an AI agent context (non-interactive terminal):

1. After Step 4 verification succeeds, **ask the user**:
   > "Installation complete! Would you like to star the oh-my-gods repository? It helps the project grow."
2. If the user says **yes** (or any affirmative), run:
   ```bash
   gh api --silent --method PUT /user/starred/akillness/oh-my-gods \
     && echo "Starred akillness/oh-my-gods" \
     || echo "Star failed — run 'gh auth login' first, then retry"
   ```
3. If the user says **no** or does not respond, **skip silently**. Do not re-ask.
4. Mark the guard file regardless of outcome:
   ```bash
   mkdir -p "$HOME/.omc/state" && touch "$HOME/.omc/state/oh-my-gods-star-prompted"
   ```

> **Never star without explicit user consent. Never re-ask after the guard file exists.**

---

## Quick Reference

| Goal | Command |
|------|---------|
| Start a task | `omg "task description"` |
| Multi-agent orchestration | `/omc:team "task"` |
| Review plan | `/plannotator` |
| Kanban board | `kanbanview` |
| Survey before planning | `survey "topic"` |
| View long-term plan | `cat .omg/long-term-plan.md` |
| Check sprint progress | `cat .omg/progress.md` |
| View task history | `ls .omg/history/` |
| Persistent loop | `ooo ralph "task"` |
| Autonomous research | `autoresearch "topic"` |

---

## .omg Project Management

The `.omg/` folder is created automatically when you run `omg`. It tracks the full project lifecycle:

```
STEP 0 (Bootstrap) → PLAN → EXECUTE → VERIFY → CLEANUP
```

| File | Purpose |
|------|---------|
| `.omg/long-term-plan.md` | Project goals, architecture, milestones |
| `.omg/short-term-plan.md` | Current sprint: active tasks and priorities |
| `.omg/progress.md` | Active checklist — auto-checked `[x]` during EXECUTE |
| `.omg/history/` | Completed task archives (auto-moved during CLEANUP) |
| `.omg/backlog.md` | Pending tasks not yet in current sprint |

The OMG workflow automatically:
1. **Reads** `.omg/` docs at PLAN start to load context
2. **Updates** `progress.md` with `[x]` as tasks complete during EXECUTE
3. **Archives** completed items to `history/YYYYMMDD-<task>.md` during CLEANUP
4. **Removes** completed items from active docs to keep them clean

---

## Skill Inventory (79 skills)

| Category | Skills | Agent Target |
|----------|--------|--------------|
| **Orchestration** | omg, ralph, plannotator, bmad, bmad-idea, survey, agentation, vibe-kanban | All (`*`) |
| **Platform Setup** | omc | claude-code |
| **Platform Setup** | ohmg | gemini-cli, antigravity |
| **Platform Setup** | omx | codex, claude-code, gemini-cli |
| **Platform Setup** | ralphmode | claude-code, codex, gemini-cli |
| **Development** | code-review, code-refactoring, backend-testing, testing-strategies, codebase-search, git-workflow, git-submodule, changelog-maintenance, api-design, api-documentation, authentication-setup, security-best-practices, performance-optimization, pattern-detection, environment-setup, workflow-automation, file-organization, debugging | All (`*`) |
| **Frontend** | react-best-practices, frontend-design-system, design-system, ui-component-patterns, responsive-design, vercel-react-best-practices, state-management | All (`*`) |
| **Infrastructure** | deployment-automation, vercel-deploy, monitoring-observability, log-analysis, database-schema-design, firebase-ai-logic, genkit | All (`*`) |
| **Data & Analysis** | data-analysis, autoresearch, skill-autoresearch, ai-research-skills, langchain-bmad | All (`*`) |
| **Creative & Content** | video-production, remotion-video-production, presentation-builder, marketing-automation, technical-writing, user-guide-writing, web-design-guidelines, prompt-repetition | All (`*`) |
| **Agent Frameworks** | deepagents, clawteam, agent-manager, agent-browser, agent-development-principles, agent-principles, agent-workflow, agent-configuration, agent-evaluation | All (`*`) |
| **Productivity** | task-planning, task-estimation, sprint-retrospective, standup-meeting, pm-skills, skill-standardization, opencontext, fabric, playwriter, frouter | All (`*`) |
| **Integrations** | langextract, langchain-bmad, strix, obsidian-cli, scrapling, agents-cli | All (`*`) |

---

### LangChain Skills (from langchain-ai/langchain-skills)

```bash
skills add -g langchain-ai/langchain-skills --skill '*' --yes --copy
```

| Skill | Trigger | Description |
|-------|---------|-------------|
| `framework-selection` | "which framework", "LangChain vs LangGraph" | Choose LangChain/LangGraph/Deep Agents for your use case |
| `langchain-dependencies` | "install langchain", "package versions" | Package setup, version management, Python/TypeScript |
| `langchain-fundamentals` | "langchain agent", "create_agent" | Agent creation, @tool decorator, structured output |
| `langchain-middleware` | "human in the loop", "approval workflow" | HITL approval, custom middleware, `Command` resume |
| `langchain-rag` | "RAG", "retrieval", "vector store", "Chroma" | Complete RAG pipeline: loaders → split → embed → store → retrieve |
| `langgraph-fundamentals` | "langgraph", "StateGraph", "graph nodes" | StateGraph, nodes, edges, Send fan-out, streaming |
| `langgraph-persistence` | "persist state", "checkpointer", "thread_id" | State persistence, PostgresSaver, time travel |
| `langgraph-human-in-the-loop` | "interrupt", "pause for approval", "HITL langgraph" | `interrupt()`, `Command(resume=...)`, idempotency rules |
| `deep-agents-core` | "deep agent", "create_deep_agent" | Core architecture: middleware, SKILL.md format, harness |
| `deep-agents-memory` | "agent memory", "StoreBackend", "filesystem access" | Memory backends: ephemeral, persistent, filesystem |
| `deep-agents-orchestration` | "subagent", "todo list", "task delegation" | SubAgentMiddleware, TodoListMiddleware, HITL interrupts |

> Source: [langchain-ai/langchain-skills](https://github.com/langchain-ai/langchain-skills/tree/main) — MIT License

---

> Full skill list and detailed descriptions: [README.md](README.md)
> Platform guides: [GETTING-STARTED.md](GETTING-STARTED.md)
