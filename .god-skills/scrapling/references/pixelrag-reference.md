# PixelRAG — Render, Index, Serve Reference

Condensed from the official [PixelRAG README](https://github.com/StarTrail-org/PixelRAG)
(Apache-2.0). PixelRAG renders documents — web pages, PDFs, images — to screenshot tiles
and retrieves over the images directly, so visual structure that HTML parsing throws away
(tables, charts, layout, infographics) stays intact and searchable.

## Pipeline stages

Capture is the standalone `pixelshot` command; the rest runs through the `pixelrag`
umbrella (`pixelrag <stage>`). Install only what you need:

| Command | What it does | Install |
|---|---|---|
| `pixelshot` | Document → image tiles (Playwright CDP, PDF) | `pip install pixelrag` |
| `pixelrag chunk` / `embed` / `build-index` | Tiles → vectors → FAISS index (standalone stages) | `pip install 'pixelrag[embed]'` |
| `pixelrag index` | Orchestrates the full pipeline: source → ingest → embed → index | `pip install 'pixelrag[index]'` |
| `pixelrag serve` | FAISS search API (FastAPI, CPU or GPU) | `pip install 'pixelrag[serve]'` |

```
render ←── index ──→ embed       serve (independent)       train → serve (HTTP)
```

`train` is a separate `uv` project with its own pinned environment — not needed to use
pre-trained embeddings; the LoRA adapters are published on Hugging Face
(`Chrisyichuan/wiki-screenshot-embedding-lora`).

## Render a page or PDF to tiles

```bash
pip install pixelrag

# Web page → tiles (headless Chromium via CDP)
pixelshot https://en.wikipedia.org/wiki/Python -o ./tiles

# PDF → tiles (requires poppler; install the pdf extra)
pip install 'pixelrag[pdf]'
curl -sL -o paper.pdf https://arxiv.org/pdf/2503.09516
pixelshot paper.pdf -o ./tiles --dpi 200

# URLs and local files can be mixed freely
pixelshot https://github.com/StarTrail-org/PixelRAG paper.pdf -o ./tiles
```

Programmatic render:

```python
from pixelrag_render import render_url
tiles = render_url("https://en.wikipedia.org/wiki/Python", "./tiles")
```

> Chrome auto-installs a bundled turbo `headless_shell` on **linux-x64** only. On other
> platforms `pixelshot` auto-detects your system Chrome/Chromium (or Playwright's
> Chromium). Point it at a specific binary with `CHROME_PATH=/path/to/chrome` if it isn't
> found automatically. Each render runs in an isolated, throwaway Chrome profile, so it
> works even while you have Chrome open elsewhere.

## Build a local visual index

Works on Linux (CUDA) and macOS (Apple Silicon / MPS); `device: auto` picks the best
backend, falling back to CPU.

```bash
pip install 'pixelrag[index]'

cat > pixelrag.yaml << 'EOF'
source:
  type: local
  path: ./my_docs

embed:
  model: Qwen/Qwen3-VL-Embedding-2B
  device: auto          # cuda on Linux, mps on macOS, cpu as fallback

output: ./my_index
EOF

pixelrag index build
pixelrag serve --index-dir ./my_index --port 30001
```

Standalone stages (no orchestrator), e.g. for custom pipelines or multi-GPU embedding:

```bash
pip install 'pixelrag[embed]'
pixelrag chunk --tiles-dir ./tiles
pixelrag embed --shard-dir ./tiles --output-dir ./embeddings --gpu-ids 0,1
pixelrag build-index --embeddings-dir ./embeddings --output-dir ./index
```

## Search

```bash
curl -X POST http://localhost:30001/search \
  -H "Content-Type: application/json" \
  -d '{"queries": [{"text": "What is the capital of France?"}], "n_docs": 5}'
```

The search API also accepts an image as the query (visual search) — see the
[API reference](https://pixelrag.ai/docs) for the full request shape.

### Zero-setup demo: hosted 8.28M-page Wikipedia index

No install, no API key — `api.pixelrag.ai` serves a pre-built index over 8.28M Wikipedia
pages:

```bash
curl -X POST https://api.pixelrag.ai/search \
  -H "Content-Type: application/json" \
  -d '{"queries": [{"text": "What is the capital of France?"}], "n_docs": 5}'
```

Or try it in-browser at [pixelrag.ai](https://pixelrag.ai), or run the
[quickstart Colab notebook](https://colab.research.google.com/github/StarTrail-org/PixelRAG/blob/main/demos/quickstart.ipynb).

### Download a pre-built index instead of building one

```bash
pip install 'pixelrag[serve]'

huggingface-cli download StarTrail-org/pixelrag-faiss-indexes \
  --repo-type dataset --include "search_index_normed_v2/*" --local-dir ./index

pixelrag serve --index-dir ./index/search_index_normed_v2 --port 30001
```

## `pixelbrowse` — give an agent eyes (Claude Code plugin)

Instead of fetching raw HTML, `pixelbrowse` screenshots a page with `pixelshot` and lets
the agent *read the image* — so it sees charts, diagrams, tables, and layout the way a
person does. No MCP server, no backend: it just runs `pixelshot` locally.

```bash
uv tool install pixelrag                             # keeps pixelshot on PATH (or: pipx install pixelrag)
claude plugin marketplace add StarTrail-org/PixelRAG
claude plugin install pixelbrowse@pixelrag-plugins
```

```bash
claude -p "screenshot https://news.ycombinator.com and summarize the top stories"
claude -p "screenshot https://arxiv.org/abs/2404.12387 and explain the key findings"
```

Or interactively: `/screenshot https://example.com`.

## Full docs

- https://github.com/StarTrail-org/PixelRAG
- Paper: [PIXELRAG: Web Screenshots Beat Text for Retrieval-Augmented Generation](https://arxiv.org/abs/2606.28344)
