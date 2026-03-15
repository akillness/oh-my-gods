#!/usr/bin/env bash
# setup-frouter.sh — Install frouter-cli and optionally configure API keys
# Usage: bash setup-frouter.sh [--nvidia KEY] [--openrouter KEY]
set -euo pipefail

NVIDIA_KEY=""
OPENROUTER_KEY=""

# Parse flags
while [[ $# -gt 0 ]]; do
  case "$1" in
    --nvidia)    NVIDIA_KEY="$2";    shift 2 ;;
    --openrouter) OPENROUTER_KEY="$2"; shift 2 ;;
    *) echo "Unknown flag: $1"; exit 1 ;;
  esac
done

echo "==> Installing frouter-cli..."

if command -v bun &>/dev/null; then
  bun install -g frouter-cli
elif command -v npm &>/dev/null; then
  npm install -g frouter-cli
else
  echo "ERROR: npm or bun is required. Install Node.js >= 18 first."
  exit 1
fi

echo "✅ frouter-cli installed: $(frouter --version 2>/dev/null || echo 'version unknown')"

# Write API keys to ~/.frouter.json if provided
CONFIG="$HOME/.frouter.json"
if [[ -n "$NVIDIA_KEY" || -n "$OPENROUTER_KEY" ]]; then
  echo "==> Writing API keys to $CONFIG..."

  # Build JSON with provided keys
  NVIDIA_ENTRY=""
  OPENROUTER_ENTRY=""
  [[ -n "$NVIDIA_KEY" ]]    && NVIDIA_ENTRY="\"nvidia\": \"$NVIDIA_KEY\""
  [[ -n "$OPENROUTER_KEY" ]] && OPENROUTER_ENTRY="\"openrouter\": \"$OPENROUTER_KEY\""

  if [[ -n "$NVIDIA_ENTRY" && -n "$OPENROUTER_ENTRY" ]]; then
    API_KEYS="{$NVIDIA_ENTRY, $OPENROUTER_ENTRY}"
  elif [[ -n "$NVIDIA_ENTRY" ]]; then
    API_KEYS="{$NVIDIA_ENTRY}"
  else
    API_KEYS="{$OPENROUTER_ENTRY}"
  fi

  cat > "$CONFIG" <<EOF
{
  "apiKeys": $API_KEYS,
  "providers": {
    "nvidia": { "enabled": true },
    "openrouter": { "enabled": true }
  },
  "ui": {
    "scrollSortPauseMs": 1500
  }
}
EOF
  chmod 600 "$CONFIG"
  echo "✅ Config written to $CONFIG"
fi

echo ""
echo "==> frouter setup complete!"
echo ""
echo "Usage:"
echo "  frouter              # Interactive TUI"
echo "  frouter --best       # Non-interactive: print best model ID"
echo "  frouter --help       # Show all flags"
echo ""
echo "On first run, frouter will launch an API key setup wizard."
echo "Get free keys at:"
echo "  NVIDIA NIM:   https://build.nvidia.com/settings/api-keys"
echo "  OpenRouter:   https://openrouter.ai/settings/keys"
