#!/usr/bin/env bash
# AI Research Skills — Install Script
# Source: https://github.com/Orchestra-Research/AI-Research-SKILLs
# Usage: bash scripts/install.sh [--all] [--category <name>] [--list] [--update]
set -euo pipefail

PACKAGE="@orchestra-research/ai-research-skills"
SKILLS_DIR="${HOME}/.orchestra/skills"

print_usage() {
  cat <<EOF
Usage: bash install.sh [OPTIONS]

Options:
  --all              Install all 86 skills non-interactively
  --category NAME    Install skills in a specific category
  --list             List installed skills
  --update           Update all installed skills
  --help             Show this help

Categories:
  autoresearch, model-architecture, fine-tuning, post-training,
  distributed-training, optimization, inference, rag, multimodal,
  mech-interp, safety, evaluation, mlops, agents, prompt-engineering,
  observability, infrastructure, data-processing, tokenization,
  emerging-techniques, ml-paper-writing, ideation

Examples:
  bash install.sh --all
  bash install.sh --category fine-tuning
  bash install.sh --update
EOF
}

check_node() {
  if ! command -v node &>/dev/null; then
    echo "ERROR: Node.js is required (v18+). Install from https://nodejs.org"
    exit 1
  fi
  local version
  version=$(node -e "process.stdout.write(process.versions.node.split('.')[0])")
  if [ "${version}" -lt 18 ]; then
    echo "ERROR: Node.js v18+ required (found v${version}). Please upgrade."
    exit 1
  fi
  echo "✓ Node.js v$(node --version) detected"
}

check_npx() {
  if ! command -v npx &>/dev/null; then
    echo "ERROR: npx not found. Install via: npm install -g npx"
    exit 1
  fi
  echo "✓ npx available"
}

install_all() {
  echo "Installing all 86 AI Research Skills..."
  npx "${PACKAGE}" install --all
  echo ""
  echo "✅ All 86 skills installed to ${SKILLS_DIR}"
  echo ""
  echo "Next steps:"
  echo "  1. Restart your agent session (Claude Code / Codex / Gemini)"
  echo "  2. Load autoresearch: 'Read the autoresearch SKILL.md and follow its instructions'"
}

install_category() {
  local category="$1"
  echo "Installing skills in category: ${category}"
  npx "${PACKAGE}" install --category "${category}"
  echo "✅ Category '${category}' installed"
}

list_skills() {
  npx "${PACKAGE}" list
}

update_skills() {
  echo "Updating all installed AI Research Skills..."
  npx "${PACKAGE}" update
  echo "✅ Skills updated"
}

interactive_install() {
  echo "Launching interactive AI Research Skills installer..."
  npx "${PACKAGE}"
}

# --- Main ---
check_node
check_npx

case "${1:-}" in
  --all)
    install_all
    ;;
  --category)
    if [ -z "${2:-}" ]; then
      echo "ERROR: --category requires a category name"
      print_usage
      exit 1
    fi
    install_category "$2"
    ;;
  --list)
    list_skills
    ;;
  --update)
    update_skills
    ;;
  --help|-h)
    print_usage
    ;;
  "")
    interactive_install
    ;;
  *)
    echo "Unknown option: $1"
    print_usage
    exit 1
    ;;
esac
