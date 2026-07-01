#!/usr/bin/env bash
# setup-scrapling.sh — Install Scrapling and its browser dependencies
# Usage: bash setup-scrapling.sh [--minimal]
#   --minimal   Install the bare package only (HTTP fetching, no browser automation)
set -euo pipefail

MINIMAL=false
for arg in "$@"; do
  case "$arg" in
    --minimal) MINIMAL=true ;;
    *) echo "Unknown flag: $arg" >&2; exit 1 ;;
  esac
done

command -v python3 &>/dev/null || { echo "ERROR: python3 (3.10+) is required." >&2; exit 1; }

if command -v pip &>/dev/null; then
  PIP=pip
elif command -v pip3 &>/dev/null; then
  PIP=pip3
else
  echo "ERROR: pip is required." >&2
  exit 1
fi

if [[ "$MINIMAL" == true ]]; then
  echo "==> Installing Scrapling (minimal, HTTP-only)..."
  "$PIP" install -U scrapling
else
  echo "==> Installing Scrapling with browser automation extras..."
  "$PIP" install -U "scrapling[all]"

  echo "==> Downloading browser dependencies (Camoufox/Playwright)..."
  scrapling install --force
fi

VERSION="$(scrapling --version 2>/dev/null || python3 -c 'import scrapling; print(scrapling.__version__)' 2>/dev/null || echo 'unknown')"
echo "✅ Scrapling installed: $VERSION"
echo ""
echo "Quick check:"
echo "  scrapling extract get \"https://example.com\" page.md"
echo ""
if [[ "$MINIMAL" == false ]]; then
  echo "Cloudflare / anti-bot bypass check:"
  echo "  scrapling extract stealthy-fetch \"https://example.com\" page.md --solve-cloudflare"
fi
