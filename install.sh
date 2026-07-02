#!/bin/bash

# oh-my-gods — AI Agent-Engineering Skills Installer
# Repository: https://github.com/akillness/oh-my-gods
#
# Installs 29 agent-engineering skills (no overlap with jeo-skills).
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/akillness/oh-my-gods/main/install.sh | bash
#
# Options (environment variables):
#   INSTALL_GLOBAL=true   - Install globally to ~/.agent-skills (default: true)
#   INSTALL_MODE=silent   - silent | interactive (default: silent)
#   SKIP_BACKUP=true      - Skip backup of existing install (default: false)
#
# Security Note — review before running:
#   curl -fsSLO https://raw.githubusercontent.com/akillness/oh-my-gods/main/install.sh
#   cat install.sh && bash install.sh

set -euo pipefail

# --- Configuration ---
REPO_URL="https://github.com/akillness/oh-my-gods.git"
REPO_HTTP="https://github.com/akillness/oh-my-gods"
SKILLS_SOURCE_DIR=".god-skills"
TEMP_DIR="/tmp/_omg_setup_$$"
VERSION="3.1.0"

INSTALL_GLOBAL="${INSTALL_GLOBAL:-true}"
INSTALL_MODE="${INSTALL_MODE:-silent}"
SKIP_BACKUP="${SKIP_BACKUP:-false}"

# Destination paths (npx skills add canonical paths)
CANONICAL_DIR="$HOME/.agent-skills"
SKILL_DESTS=(
  "$HOME/.claude/skills"
  "$HOME/.codex/skills"
  "$HOME/.gemini/skills"
  "$HOME/.opencode/skills"
  "$HOME/.config/opencode/skills"
)

# The 42 agent-engineering skills shipped by this repo.
ALL_SKILLS=(
  # Core Agent & Frameworks (20)
  agent-configuration agent-evaluation agent-manager agent-principles agent-workflow
  agents-cli deepagents langchain-bmad langgraph-workflow ralph ralphmode
  crewai agno smolagents mastra letta claude-agent-sdk google-adk openclaw pi-agent
  # Architecture & Ops (10)
  agent-observability agent-memory-architecture mcp-server-design agent-guardrails
  agent-system-design agent-tool-routing multi-agent-eval-harness a2a-protocol
  reflexion-pattern agent-benchmarking
  # Sandbox, Browser, Voice, Memory & Protocols (11)
  browser-use stagehand mem0 graphiti e2b daytona livekit-agents pipecat ag-ui
  goose openhands
  # Compatibility Aliases (1)
  agent-development-principles
)

# --- Colors ---
GREEN='\033[0;32m'; BLUE='\033[0;34m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; BOLD='\033[1m'; NC='\033[0m'

info()  { echo -e "${BLUE}[INFO]${NC} $1"; }
ok()    { echo -e "${GREEN}[OK]${NC} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $1"; }
err()   { echo -e "${RED}[ERROR]${NC} $1"; }
fatal() { echo -e "${RED}[FATAL]${NC} $1"; exit 1; }

cleanup() { [ -d "$TEMP_DIR" ] && rm -rf "$TEMP_DIR" || true; }
trap cleanup EXIT

print_banner() {
  echo -e "${BLUE}"
  cat << 'BANNER'
   ___  _   _       __  ____   __  ___   ___  ___
  / _ \| | | |     |  \/  \ \ / / / __| / _ \|   \
 | (_) | |_| |  _  | |\/| |\ V /  | (_ || (_) | |) |
  \___/ \___/  (_) |_|  |_| |_|    \___| \___/|___/
BANNER
  echo -e "${NC}"
  echo -e "${BOLD}oh-my-gods — Agent-Engineering Skills v${VERSION}${NC}"
  echo -e "  Repository: ${REPO_HTTP}"
  echo ""
}

# --- Dependency Checks ---
check_dependencies() {
  info "Checking dependencies..."
  local missing=false

  if command -v git &>/dev/null; then
    ok "git $(git --version | cut -d' ' -f3)"
  else
    err "git is required. Install: https://git-scm.com/downloads"; missing=true
  fi

  if command -v node &>/dev/null; then
    ok "Node.js $(node --version)"
  else
    err "Node.js 18+ is required. Install: https://nodejs.org/"; missing=true
  fi

  [ "$missing" = true ] && fatal "Required dependencies missing."

  if command -v skills &>/dev/null; then
    ok "skills CLI available"; HAS_SKILLS_CLI=true
  else
    warn "skills CLI not found — installing now..."
    if npm install -g skills &>/dev/null; then
      ok "skills CLI installed"; HAS_SKILLS_CLI=true
    else
      warn "skills CLI install failed — will fall back to direct copy"; HAS_SKILLS_CLI=false
    fi
  fi
}

# --- Install via skills CLI ---
install_via_skills_cli() {
  info "Installing 29 skills via npx skills add..."
  local args=()
  for s in "${ALL_SKILLS[@]}"; do args+=("--skill" "$s"); done
  local global_flag=()
  [ "$INSTALL_GLOBAL" = "true" ] && global_flag=("-g")
  npx skills add "${global_flag[@]}" "$REPO_HTTP" "${args[@]}" 2>/dev/null \
    && ok "Skills installed via skills CLI" \
    || warn "Some skills failed during install — continuing..."
}

# --- Install via direct copy (fallback) ---
install_via_direct_copy() {
  info "Installing via direct copy from repository..."

  if ! git clone --depth 1 --quiet "$REPO_URL" "$TEMP_DIR"; then
    fatal "Failed to clone repository. Check network connection."
  fi
  ok "Repository cloned"

  if [ -d "$CANONICAL_DIR" ]; then
    if [ "$SKIP_BACKUP" = "true" ]; then
      rm -rf "$CANONICAL_DIR"
    else
      local backup="${CANONICAL_DIR}.bak.$(date +%Y%m%d_%H%M%S)"
      mv "$CANONICAL_DIR" "$backup"; ok "Backed up existing skills to $backup"
    fi
  fi

  mkdir -p "$CANONICAL_DIR"
  if ! cp -r "$TEMP_DIR/$SKILLS_SOURCE_DIR"/. "$CANONICAL_DIR/"; then
    fatal "Failed to copy skills."
  fi
  ok "Skills installed to $CANONICAL_DIR"

  info "Syncing to platform skill directories..."
  for dest in "${SKILL_DESTS[@]}"; do
    mkdir -p "$dest"
    if command -v rsync &>/dev/null; then
      rsync -a "$CANONICAL_DIR/" "$dest/" 2>/dev/null || true
    else
      cp -R "$CANONICAL_DIR"/. "$dest/"
    fi
  done
  ok "Synced to all platform directories"
}

# --- Verification ---
verify_install() {
  info "Verifying installation..."
  if [ -d "$CANONICAL_DIR" ]; then
    local count; count=$(ls "$CANONICAL_DIR" 2>/dev/null | wc -l | tr -d ' ')
    ok "$count skills found in $CANONICAL_DIR"
  else
    warn "$CANONICAL_DIR not found — check installation"
  fi

  for skill in ralph deepagents agent-observability mcp-server-design agent-guardrails; do
    if [ -f "$CANONICAL_DIR/$skill/SKILL.md" ]; then
      ok "  ✓ $skill"
    else
      warn "  ✗ $skill (missing)"
    fi
  done
}

# --- Main ---
main() {
  [ "$INSTALL_MODE" != "silent" ] && print_banner

  check_dependencies
  echo ""

  if [ "$HAS_SKILLS_CLI" = "true" ]; then
    install_via_skills_cli
  else
    install_via_direct_copy
  fi
  echo ""

  verify_install
  echo ""

  echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BOLD}${GREEN}Installation Complete — oh-my-gods v${VERSION}${NC}"
  echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
  echo -e "${BOLD}Key skills installed:${NC}"
  echo "  ralph                — Ouroboros spec-first agent loop"
  echo "  deepagents           — LangGraph batteries-included harness"
  echo "  agent-memory-architecture / agent-tool-routing / agent-guardrails"
  echo "  agent-observability / agent-evaluation / multi-agent-eval-harness"
  echo "  mcp-server-design / a2a-protocol — agent interop"
  echo ""
  echo -e "${BOLD}General dev / orchestration skills:${NC}"
  echo "  https://github.com/akillness/jeo-skills"
  echo ""
  echo -e "${BOLD}Full documentation:${NC} ${REPO_HTTP}"
  echo -e "${BOLD}LLM-driven setup:${NC} curl -s ${REPO_HTTP}/raw/main/setup-all-skills-prompt.md"
  echo ""
}

main "$@"
