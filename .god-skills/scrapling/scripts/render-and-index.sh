#!/usr/bin/env bash
# render-and-index.sh — Visual-RAG fallback: render a URL/PDF with pixelshot,
# build a local PixelRAG FAISS index, and run one search query against it.
#
# Use this after Scrapling's text extraction (get/fetch/stealthy-fetch) loses
# the layout you actually need — a table, chart, dashboard, or scanned PDF.
#
# Prereq: bash scripts/setup-pixelrag.sh --stage index
#
# Usage: bash render-and-index.sh <url-or-path> "<search query>" [output-dir]
set -euo pipefail

SOURCE="${1:?Usage: render-and-index.sh <url-or-path> \"<search query>\" [output-dir]}"
QUERY="${2:?Usage: render-and-index.sh <url-or-path> \"<search query>\" [output-dir]}"
OUT="${3:-./pixelrag-out}"
TILES="$OUT/tiles"
INDEX="$OUT/index"
PORT="${PIXELRAG_PORT:-30001}"

command -v pixelshot &>/dev/null || {
  echo "ERROR: pixelshot not found. Run: bash scripts/setup-pixelrag.sh" >&2
  exit 1
}
command -v pixelrag &>/dev/null || {
  echo "ERROR: pixelrag not found. Run: bash scripts/setup-pixelrag.sh --stage index" >&2
  exit 1
}

mkdir -p "$TILES"

echo "==> Rendering '$SOURCE' to tiles..."
pixelshot "$SOURCE" -o "$TILES"

echo "==> Writing pixelrag.yaml..."
cat > "$OUT/pixelrag.yaml" <<EOF
source:
  type: local
  path: $(cd "$TILES" && pwd)

embed:
  model: Qwen/Qwen3-VL-Embedding-2B
  device: auto

output: $(cd "$OUT" && pwd)/index
EOF

echo "==> Building visual index (this can take a few minutes on CPU/MPS)..."
(cd "$OUT" && pixelrag index build)

echo "==> Serving index on port $PORT..."
pixelrag serve --index-dir "$INDEX" --port "$PORT" &
SERVER_PID=$!
trap 'kill "$SERVER_PID" 2>/dev/null || true' EXIT

echo "==> Waiting for server to come up..."
UP=false
for _ in $(seq 1 30); do
  if curl -s -o /dev/null "http://localhost:$PORT/status"; then
    UP=true
    break
  fi
  sleep 1
done

if [[ "$UP" != true ]]; then
  echo "ERROR: pixelrag serve did not become ready on port $PORT" >&2
  exit 1
fi

echo "==> Querying: $QUERY"
curl -s -X POST "http://localhost:$PORT/search" \
  -H "Content-Type: application/json" \
  -d "{\"queries\": [{\"text\": \"$QUERY\"}], \"n_docs\": 5}" | python3 -m json.tool

echo ""
echo "✅ Done. Index kept at: $INDEX"
echo "   Re-serve anytime with: pixelrag serve --index-dir $INDEX --port $PORT"
