#!/usr/bin/env bash
# setup-pixelrag.sh — Install PixelRAG for screenshot rendering + visual RAG indexing
# Usage: bash setup-pixelrag.sh [--stage render|embed|index|serve|all]
#   render (default)  pixelshot only — render pages/PDFs to image tiles
#   embed              chunk/embed/build-index standalone stages
#   index              full orchestrator (source -> ingest -> embed -> index)
#   serve              FAISS search API only (to serve a pre-built index)
#   all                index + serve extras together
set -euo pipefail

STAGE="render"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --stage) STAGE="$2"; shift 2 ;;
    *) echo "Unknown flag: $1" >&2; exit 1 ;;
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

case "$STAGE" in
  render) PKG="pixelrag" ;;
  embed)  PKG="pixelrag[embed]" ;;
  index)  PKG="pixelrag[index]" ;;
  serve)  PKG="pixelrag[serve]" ;;
  all)    PKG="pixelrag[index,serve]" ;;
  *)
    echo "ERROR: --stage must be one of render|embed|index|serve|all" >&2
    exit 1
    ;;
esac

echo "==> Installing '$PKG'..."
"$PIP" install -U "$PKG"

echo "==> Verifying pixelshot is on PATH..."
if command -v pixelshot &>/dev/null; then
  echo "  pixelshot: $(command -v pixelshot)"
else
  echo "  WARNING: pixelshot not on PATH."
  echo "  A plain 'pip install' into a project venv can leave it off PATH — use"
  echo "  'uv tool install pixelrag' or 'pipx install pixelrag' to keep it globally available."
fi

if [[ "$STAGE" == "index" || "$STAGE" == "all" ]]; then
  echo ""
  echo "==> Device check for the embed model (Qwen3-VL-Embedding-2B; cuda > mps > cpu):"
  python3 - <<'PY'
try:
    import torch
    if torch.cuda.is_available():
        print("  detected: CUDA")
    elif getattr(torch.backends, "mps", None) and torch.backends.mps.is_available():
        print("  detected: MPS (Apple Silicon)")
    else:
        print("  detected: CPU (index build will be slower; still works)")
except ImportError:
    print("  torch not importable yet — resolved automatically on first 'pixelrag index build'")
PY
fi

echo ""
echo "✅ PixelRAG ('$STAGE' stage) installed."
