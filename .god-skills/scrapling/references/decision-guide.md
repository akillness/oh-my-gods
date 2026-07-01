# Escalation Decision Guide — Scrapling → PixelRAG

A single decision path from "just get the text" to "search the page like an image."

## 1. Text extraction ladder (Scrapling)

| Step | Command | Escalate when |
|---|---|---|
| 1 | `scrapling extract get <url> out.md` | Fails, times out, or returns empty/garbage content |
| 2 | `scrapling extract fetch <url> out.md --network-idle` | Content still missing after JS render, or the site blocks plain requests |
| 3 | `scrapling extract stealthy-fetch <url> out.md --solve-cloudflare` | Site returns a Cloudflare Turnstile / anti-bot challenge page |

If step 3 returns clean text/HTML and the *answer lives in prose*, you're done — stay in
Scrapling. Don't reach for PixelRAG "just in case."

## 2. When to switch to PixelRAG

Switch only when the extracted text is technically present but the **answer requires visual
structure** that HTML/text extraction discards:

- A table where cell alignment / column relationships carry the meaning
- A chart, graph, or infographic (no underlying `<table>` or accessible data)
- A dashboard with layout-dependent grouping
- A scanned or image-heavy PDF with no reliable text layer
- You want to build a "search pages by how they look" index over many rendered documents,
  not a text search index

## 3. PixelRAG path

```bash
bash scripts/setup-pixelrag.sh --stage index
bash scripts/render-and-index.sh "<url-or-path>" "<search query>" ./out
```

For a one-off visual check with zero local setup, try the hosted demo endpoint first:

```bash
curl -X POST https://api.pixelrag.ai/search \
  -H "Content-Type: application/json" \
  -d '{"queries": [{"text": "<query>"}], "n_docs": 5}'
```

(Only useful if your target content is already covered by the hosted 8.28M-page Wikipedia
index — for arbitrary sites you need your own local index via `render-and-index.sh`.)

## 4. Quick reference table

| Situation | Tool |
|---|---|
| Blog post, news article, docs page | Scrapling `get` |
| SPA / JS-rendered content | Scrapling `fetch` |
| Cloudflare / anti-bot wall | Scrapling `stealthy-fetch` |
| Paginated listing, multi-page crawl | Scrapling `Spider` / `CrawlSpider` |
| Sitemap-driven crawl | Scrapling `SitemapSpider` |
| Table/chart/dashboard answer | PixelRAG (`pixelshot` + `pixelrag index`) |
| Scanned/image PDF | PixelRAG (`pixelshot <file>.pdf --dpi 200`) |
| "Let the agent look at the page" | `pixelbrowse` plugin (`claude -p "screenshot ..."`) |
| Semantic search across many rendered pages | PixelRAG local index + `pixelrag serve` |
