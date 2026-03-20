#!/bin/bash

# oh-my-gods — AI Agent Skills Installer v2.0.0
# Repository: https://github.com/akillness/oh-my-gods
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/akillness/oh-my-gods/main/install.sh | bash
#
# Options (environment variables):
#   INSTALL_GLOBAL=true   - Install to ~/.agent-skills (default: true)
#   INSTALL_MODE=silent   - silent | auto | interactive (default: silent)
#   SKIP_BACKUP=true      - Skip backup of existing install
#   WITH_LANGCHAIN=true   - Also install langchain-ai/langchain-skills (default: false)
#   PLATFORM=all          - claude | gemini | codex | opencode | all (default: all)
#
# Security Note:
#   Review before running:
#     curl -fsSLO https://raw.githubusercontent.com/akillness/oh-my-gods/main/install.sh
#     cat install.sh && bash install.sh

set -euo pipefail

# --- Configuration ---
REPO_URL="https://github.com/akillness/oh-my-gods.git"
SKILLS_SOURCE_DIR=".god-skills"
TEMP_DIR="/tmp/_omg_setup_$$"
VERSION="2.0.0"

# Environment variable defaults
INSTALL_GLOBAL="${INSTALL_GLOBAL:-true}"
INSTALL_MODE="${INSTALL_MODE:-silent}"
SKIP_BACKUP="${SKIP_BACKUP:-false}"
WITH_LANGCHAIN="${WITH_LANGCHAIN:-false}"
PLATFORM="${PLATFORM:-all}"

# Destination paths (npx skills add canonical paths)
CANONICAL_DIR="$HOME/.agent-skills"
SKILL_DESTS=(
  "$HOME/.claude/skills"
  "$HOME/.codex/skills"
  "$HOME/.gemini/skills"
  "$HOME/.opencode/skills"
  "$HOME/.config/opencode/skills"
)

# --- Colors ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

# --- Helpers ---
info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
ok()      { echo -e "${GREEN}[OK]${NC} $1"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $1"; }
err()     { echo -e "${RED}[ERROR]${NC} $1"; }
fatal()   { echo -e "${RED}[FATAL]${NC} $1"; exit 1; }

cleanup() { [ -d "$TEMP_DIR" ] && rm -rf "$TEMP_DIR" || true; }
trap cleanup EXIT

available_skill_dir() {
  [ -d "$SKILLS_SOURCE_DIR/$1" ]
}

collect_skill_args() {
  local args=()
  local skill
  for skill in "$@"; do
    if available_skill_dir "$skill"; then
      args+=("--skill" "$skill")
    else
      warn "Skipping missing packaged skill: $skill"
    fi
  done
  printf '%s\n' "${args[@]}"
}

install_skill_batch() {
  local repo_url="$1"
  shift
  local args=()
  while IFS= read -r arg; do
    [ -n "$arg" ] && args+=("$arg")
  done < <(collect_skill_args "$@")

  if [ ${#args[@]} -eq 0 ]; then
    warn "No packaged skills available for this install batch"
    return 0
  fi

  npx skills add "$repo_url" "${args[@]}" 2>/dev/null || \
    warn "Some requested skills failed during install — continuing..."
}

print_banner() {
  echo -e "${BLUE}"
  cat << 'BANNER'
   ___  _   _       __  ____   __  ___   ___  ___
  / _ \| | | |     |  \/  \ \ / / / __| / _ \|   \
 | (_) | |_| |  _  | |\/| |\ V /  | (_ || (_) | |) |
  \___/ \___/  (_) |_|  |_| |_|    \___| \___/|___/

BANNER
  echo -e "${NC}"
  echo -e "${BOLD}oh-my-gods — AI Agent Skills Installer v${VERSION}${NC}"
  echo -e "  Repository: https://github.com/akillness/oh-my-gods"
  echo ""
}

# --- Dependency Checks ---
check_dependencies() {
  info "Checking dependencies..."
  local missing=false

  # Required: git
  if command -v git &>/dev/null; then
    ok "git $(git --version | cut -d' ' -f3)"
  else
    err "git is required. Install: https://git-scm.com/downloads"
    missing=true
  fi

  # Required: node / npm
  if command -v node &>/dev/null; then
    ok "Node.js $(node --version)"
  else
    err "Node.js 18+ is required. Install: https://nodejs.org/"
    missing=true
  fi

  [ "$missing" = true ] && fatal "Required dependencies missing."

  # Check/install skills CLI
  if command -v skills &>/dev/null; then
    ok "skills CLI available"
    HAS_SKILLS_CLI=true
  else
    warn "skills CLI not found — installing now..."
    if npm install -g skills &>/dev/null; then
      ok "skills CLI installed"
      HAS_SKILLS_CLI=true
    else
      warn "skills CLI install failed — will fall back to direct copy"
      HAS_SKILLS_CLI=false
    fi
  fi

  # Optional: Claude Code
  if command -v claude &>/dev/null; then
    ok "claude $(claude --version 2>/dev/null | head -1 || echo '(version unknown)')"
    HAS_CLAUDE=true
  else
    warn "Claude Code not installed (optional)"
    HAS_CLAUDE=false
  fi

  # Optional: Gemini CLI
  if command -v gemini &>/dev/null; then
    ok "gemini CLI available"
  else
    warn "Gemini CLI not installed (optional)"
  fi

  # Optional: Codex CLI
  if command -v codex &>/dev/null; then
    ok "codex CLI available"
  else
    warn "Codex CLI not installed (optional)"
  fi

  # Optional: Python3
  if command -v python3 &>/dev/null; then
    ok "python3 $(python3 --version | cut -d' ' -f2)"
  else
    warn "python3 not installed (some scripts may be limited)"
  fi
}

# --- Install via skills CLI ---
install_via_skills_cli() {
  info "Installing skills via npx skills add..."

  # Core OMG stack
  info "Installing core OMG stack..."
  install_skill_batch "https://github.com/akillness/oh-my-gods" \
    omg survey plannotator agentation \
    ralph ralphmode omc omx ohmg \
    bmad bmad-idea

  # Full skill set
  info "Installing full skill set..."
  install_skill_batch "https://github.com/akillness/oh-my-gods" \
    agent-configuration agent-evaluation \
    agent-development-principles agent-principles \
    agent-workflow \
    bmad-gds \
    prompt-repetition api-design \
    api-documentation authentication-setup \
    backend-testing database-schema-design \
    design-system frontend-design-system \
    react-best-practices vercel-react-best-practices \
    responsive-design state-management \
    ui-component-patterns web-design-guidelines \
    code-refactoring code-review debugging \
    performance-optimization testing-strategies \
    deployment-automation firebase-ai-logic \
    genkit monitoring-observability \
    security-best-practices environment-setup \
    vercel-deploy changelog-maintenance \
    presentation-builder technical-writing \
    user-guide-writing sprint-retrospective \
    standup-meeting task-estimation \
    task-planning codebase-search \
    data-analysis log-analysis \
    pattern-detection llm-monitoring-dashboard \
    image-generation pollinations-ai \
    video-production marketing-automation \
    agent-browser ai-tool-compliance \
    file-organization git-submodule git-workflow \
    opencontext playwriter \
    skill-standardization vibe-kanban \
    workflow-automation fabric autoresearch

  ok "Skills installed via skills CLI"
}

# --- Install via direct copy (fallback) ---
install_via_direct_copy() {
  info "Installing via direct copy from repository..."

  # Clone repo
  info "Cloning oh-my-gods..."
  if ! git clone --depth 1 --quiet "$REPO_URL" "$TEMP_DIR"; then
    fatal "Failed to clone repository. Check network connection."
  fi
  ok "Repository cloned"

  # Backup existing
  if [ -d "$CANONICAL_DIR" ]; then
    if [ "$SKIP_BACKUP" = "true" ]; then
      rm -rf "$CANONICAL_DIR"
    else
      local backup="${CANONICAL_DIR}.bak.$(date +%Y%m%d_%H%M%S)"
      mv "$CANONICAL_DIR" "$backup"
      ok "Backed up existing skills to $backup"
    fi
  fi

  # Copy .god-skills/ → ~/.agent-skills/
  mkdir -p "$CANONICAL_DIR"
  if ! cp -r "$TEMP_DIR/$SKILLS_SOURCE_DIR"/. "$CANONICAL_DIR/"; then
    fatal "Failed to copy skills."
  fi
  ok "Skills installed to $CANONICAL_DIR"

  # Sync to platform-specific directories
  info "Syncing to platform skill directories..."
  for dest in "${SKILL_DESTS[@]}"; do
    mkdir -p "$dest"
    if command -v rsync &>/dev/null; then
      rsync -a --delete "$CANONICAL_DIR/" "$dest/" 2>/dev/null || true
    else
      cp -R "$CANONICAL_DIR"/. "$dest/"
    fi
  done
  ok "Synced to all platform directories"
}

# --- Install LangChain skills ---
install_langchain_skills() {
  if [ "$WITH_LANGCHAIN" = "true" ]; then
    info "Installing LangChain skills (langchain-ai/langchain-skills)..."
    npx skills add langchain-ai/langchain-skills --skill '*' --yes 2>/dev/null && \
      ok "LangChain skills installed" || \
      warn "LangChain skills install failed — install manually: npx skills add langchain-ai/langchain-skills --skill '*' --yes"
  fi
}

# --- Platform-specific setup ---
setup_platforms() {
  local skills_root="$CANONICAL_DIR"

  # Claude Code setup
  if [ "$PLATFORM" = "claude" ] || [ "$PLATFORM" = "all" ]; then
    if [ "$HAS_CLAUDE" = "true" ]; then
      info "Setting up Claude Code OMG hooks..."
      if [ -f "$skills_root/omg/scripts/setup-claude.sh" ]; then
        bash "$skills_root/omg/scripts/setup-claude.sh" 2>/dev/null && \
          ok "Claude Code setup complete" || \
          warn "Claude Code setup had issues — run manually: bash $skills_root/omg/scripts/setup-claude.sh"
      fi
    fi
  fi

  # Gemini CLI setup
  if [ "$PLATFORM" = "gemini" ] || [ "$PLATFORM" = "all" ]; then
    if command -v gemini &>/dev/null; then
      info "Setting up Gemini CLI OMG hooks..."
      if [ -f "$skills_root/omg/scripts/setup-gemini.sh" ]; then
        bash "$skills_root/omg/scripts/setup-gemini.sh" 2>/dev/null && \
          ok "Gemini CLI setup complete" || \
          warn "Gemini CLI setup had issues — run manually: bash $skills_root/omg/scripts/setup-gemini.sh"
      fi
    fi
  fi

  # Codex CLI setup
  if [ "$PLATFORM" = "codex" ] || [ "$PLATFORM" = "all" ]; then
    if command -v codex &>/dev/null; then
      info "Setting up Codex CLI OMG configuration..."
      if [ -f "$skills_root/omg/scripts/setup-codex.sh" ]; then
        bash "$skills_root/omg/scripts/setup-codex.sh" 2>/dev/null && \
          ok "Codex CLI setup complete" || \
          warn "Codex CLI setup had issues — run manually: bash $skills_root/omg/scripts/setup-codex.sh"
      fi
    fi
  fi
}

# --- Verification ---
verify_install() {
  info "Verifying installation..."
  local skill_count=0
  if [ -d "$CANONICAL_DIR" ]; then
    skill_count=$(ls "$CANONICAL_DIR" 2>/dev/null | wc -l | tr -d ' ')
    ok "$skill_count skills found in $CANONICAL_DIR"
  else
    warn "$CANONICAL_DIR not found — check installation"
  fi

  # Check key skills
  for skill in omg ralph plannotator agentation bmad survey; do
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

  # Install skills
  if [ "$HAS_SKILLS_CLI" = "true" ]; then
    install_via_skills_cli
  else
    install_via_direct_copy
  fi
  echo ""

  # LangChain skills (optional)
  install_langchain_skills

  # Platform-specific setup
  setup_platforms
  echo ""

  # Verification
  verify_install
  echo ""

  # Final output
  echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BOLD}${GREEN}Installation Complete — oh-my-gods v${VERSION}${NC}"
  echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
  echo -e "${BOLD}First run:${NC}"
  echo "  Claude Code : omg \"your task\""
  echo "  Gemini CLI  : /omg \"your task\""
  echo "  Codex CLI   : /omg \"your task\""
  echo ""
  echo -e "${BOLD}Key skills installed:${NC}"
  echo "  omg         — Integrated orchestration (PLAN→EXECUTE→VERIFY→CLEANUP)"
  echo "  ralph       — Persistent completion loop (ooo ralph \"task\")"
  echo "  bmad        — Structured phase-based development"
  echo "  survey      — Pre-implementation landscape scan"
  echo "  plannotator — Visual plan review UI"
  echo "  agentation  — UI annotation → agent code fix (annotate keyword)"
  echo ""
  echo -e "${BOLD}Install LangChain skills separately:${NC}"
  echo "  npx skills add langchain-ai/langchain-skills --skill '*' --yes"
  echo ""
  echo -e "${BOLD}Full documentation:${NC}"
  echo "  https://github.com/akillness/oh-my-gods"
  echo ""
  echo -e "${BOLD}Send to your LLM agent for setup:${NC}"
  echo "  curl -s https://raw.githubusercontent.com/akillness/oh-my-gods/main/setup-all-skills-prompt.md"
  echo ""
}

main "$@"
