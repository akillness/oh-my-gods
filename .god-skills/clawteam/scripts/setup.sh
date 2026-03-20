#!/usr/bin/env bash
# ClawTeam setup script
# Validates environment and installs the clawteam CLI

set -euo pipefail

echo "=== ClawTeam Setup ==="
echo ""

# --- Python version check ---
if ! command -v python3 &>/dev/null; then
    echo "ERROR: python3 not found. Install Python 3.10+ first."
    exit 1
fi

python_version=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
major=$(echo "$python_version" | cut -d. -f1)
minor=$(echo "$python_version" | cut -d. -f2)

if [ "$major" -lt 3 ] || ([ "$major" -eq 3 ] && [ "$minor" -lt 10 ]); then
    echo "ERROR: clawteam requires Python >= 3.10 (found $python_version)"
    echo "Upgrade Python: https://python.org/downloads"
    exit 1
fi

echo "✅ Python $python_version — OK"

# --- tmux check ---
if ! command -v tmux &>/dev/null; then
    echo "ERROR: tmux not found. Install tmux first."
    echo "  macOS:  brew install tmux"
    echo "  Ubuntu: sudo apt install tmux"
    echo "  RHEL:   sudo yum install tmux"
    exit 1
fi

tmux_version=$(tmux -V)
echo "✅ $tmux_version — OK"

# --- Agent CLI check ---
FOUND_AGENTS=()
for cli in claude codex gemini nanobot; do
    if command -v "$cli" &>/dev/null; then
        FOUND_AGENTS+=("$cli")
    fi
done

if [ ${#FOUND_AGENTS[@]} -eq 0 ]; then
    echo "WARNING: No coding agent CLI found (claude, codex, gemini, nanobot)."
    echo "  Install at least one before spawning agents:"
    echo "    npm install -g @anthropic-ai/claude-code"
    echo "    npm install -g @openai/codex"
    echo "    npm install -g @google/gemini-cli"
else
    echo "✅ Agent CLIs found: ${FOUND_AGENTS[*]}"
fi

# --- Install clawteam ---
if command -v uv &>/dev/null; then
    echo ""
    echo "Installing clawteam via uv..."
    if [ "${INSTALL_P2P:-0}" = "1" ]; then
        uv pip install "clawteam[p2p]"
    else
        uv pip install clawteam
    fi
elif command -v pip &>/dev/null; then
    echo ""
    echo "Installing clawteam via pip..."
    if [ "${INSTALL_P2P:-0}" = "1" ]; then
        pip install "clawteam[p2p]"
    else
        pip install clawteam
    fi
else
    echo "ERROR: Neither uv nor pip found."
    echo "Install uv (recommended): curl -LsSf https://astral.sh/uv/install.sh | sh"
    exit 1
fi

echo "✅ clawteam installed"

# --- Verify install ---
echo ""
echo "Verifying installation..."
clawteam --version

# --- Health check ---
echo ""
echo "Running health check..."
clawteam config health

echo ""
echo "=== Setup complete ==="
echo ""
echo "Quick start:"
echo "  # Launch a full software-dev team:"
echo "  clawteam launch software-dev --goal 'Build a REST API with JWT auth'"
echo ""
echo "  # Or spawn agents manually:"
echo "  clawteam team spawn-team my-project -d 'Build OAuth' -n tech-lead"
echo "  clawteam task create my-project 'Implement endpoints' -o backend-dev"
echo "  clawteam spawn tmux claude --team my-project --agent-name backend-dev --task '...'"
echo "  clawteam board live my-project"
echo ""
echo "Docs: https://github.com/HKUDS/ClawTeam"
