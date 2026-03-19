#!/usr/bin/env bash
# AI Research Skills — Claude Code Marketplace Setup
# Installs skills via Claude Code plugin marketplace
set -euo pipefail

echo "Setting up AI Research Skills for Claude Code..."
echo ""
echo "Option A: Full install via npm (recommended)"
echo "  npx @orchestra-research/ai-research-skills install --all"
echo ""
echo "Option B: Claude Code marketplace install"
echo "  Run these commands inside your Claude Code conversation:"
echo ""
cat <<'COMMANDS'
/plugin marketplace add orchestra-research/AI-research-SKILLs

# Install by category:
/plugin install fine-tuning@ai-research-skills
/plugin install post-training@ai-research-skills
/plugin install inference-serving@ai-research-skills
/plugin install distributed-training@ai-research-skills
/plugin install optimization@ai-research-skills
/plugin install autoresearch@ai-research-skills
COMMANDS

echo ""
echo "Option C: Point agent to welcome doc (agent handles install)"
echo "  Tell Claude: 'Read https://www.orchestra-research.com/ai-research-skills/welcome.md and follow the instructions'"
echo ""
echo "After installation, restart Claude Code to load the new skills."
