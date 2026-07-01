---
name: scrapling
description: >
  Scrape and crawl websites with Scrapling's adaptive fetchers and spiders framework,
  then fall back to PixelRAG's screenshot-based visual RAG pipeline when a page's
  layout, tables, charts, or anti-bot protections defeat plain HTML/text extraction.
  Use when asked to scrape, crawl, or extract data from websites; when web_fetch fails
  or returns empty content; when the site has Cloudflare/anti-bot protection; when
  writing Python spiders or scraping scripts; or when the content is visual/layout-heavy
  (dashboards, PDFs, infographics) and needs to be searched by how it looks, not just
  its text. Triggers on: scrapling, web scraping, crawl website, cloudflare bypass,
  anti-bot, stealth browser, headless browser scraping, write a spider, extract data
  from url, pixelrag, pixelshot, visual rag, screenshot search, give claude eyes,
  pixelbrowse, render page to image, table/chart extraction from web page.
allowed-tools: Bash Read Write
compatibility: >
  Python 3.10+ for both tools. Scrapling installs Camoufox/Playwright browsers via
  `scrapling install --force`. PixelRAG's `pixelshot` renders via Playwright CDP or a
  system Chrome/Chromium; the `pixelrag[index]` embed step runs on CUDA (Linux), MPS
  (Apple Silicon), or CPU fallback (`device: auto`). No API keys required for either
  tool's local pipeline; PixelRAG also exposes a free hosted search endpoint
  (api.pixelrag.ai) with no setup.
license: BSD-3-Clause (Scrapling) / Apache-2.0 (PixelRAG)
metadata:
  tags: scrapling, web-scraping, anti-bot, cloudflare-bypass, stealth-browser, spiders,
    crawler, playwright, pixelrag, pixelshot, visual-rag, screenshot-search, pixelbrowse
  platforms: Claude, Gemini, Codex, OpenCode
  keyword: scrapling
  version: "1.0"
  source: D4Vinci/Scrapling + StarTrail-org/PixelRAG
---

# scrapling — Web Scraping + Visual RAG Fallback

Two complementary tools for turning a website into usable data or a searchable knowledge base:

- **[Scrapling](https://github.com/D4Vinci/Scrapling)** — an adaptive web-scraping framework. Its parser relocates elements automatically when a page's HTML changes, its fetchers bypass anti-bot systems like Cloudflare Turnstile, and its spider framework scales to concurrent, resumable crawls.
- **[PixelRAG](https://github.com/StarTrail-org/PixelRAG)** — renders a page (or PDF) to screenshot tiles and retrieves over the images directly, so tables, charts, and layout that HTML parsing throws away stay intact and searchable.

Use Scrapling first for anything that is fundamentally text. Escalate to PixelRAG only when the content's *visual structure* is the thing you actually need (a table, a chart, a dashboard, a scanned PDF) or when you want to build a semantic image-search index over rendered pages instead of parsed text.

## When to use this skill

- Scrape or crawl a website: single page, paginated listing, or full multi-page crawl
- `web_fetch` / a plain HTTP request fails, returns empty content, or is blocked
- The target site has Cloudflare Turnstile or other anti-bot/anti-fingerprinting protection
- Write a Python spider with concurrency, pause/resume, or proxy rotation
- Convert scraped content to Markdown, plain text, or structured selectors (CSS/XPath)
- The page's *layout* carries the answer — a table, chart, infographic, or dashboard — and text extraction loses it
- Build a local, searchable visual index over a set of rendered pages/PDFs ("search by how it looks")
- Give an agent "eyes" on a page via screenshot instead of raw HTML

## Do not use this skill

- When the source is already clean text or structured JSON/API data — just read it directly
- When the task is document parsing of files you already have as text (no scraping needed)
- When you need paid, large-scale proxy infrastructure — this skill covers the open-source tools only, not a hosted scraping service
- To bypass paywalls, authentication, or scrape data you are not authorized to access

## Instructions

### Step 1: Set up Scrapling (default path)

```bash
bash scripts/setup-scrapling.sh
```

This installs `scrapling[all]` and downloads the Camoufox/Playwright browser dependencies via `scrapling install --force`. Use `--minimal` to install the bare package without browser automation extras (HTTP-only fetching).

Docker alternative (commands only, no Python code):

```bash
docker pull ghcr.io/d4vinci/scrapling:latest
```

### Step 2: Pick the right fetcher — escalate only as needed

| Tier | Command | When |
|------|---------|------|
| 1 | `scrapling extract get <url> out.md` | Simple websites, blogs, news articles |
| 2 | `scrapling extract fetch <url> out.md` | Modern web apps, JS-rendered/dynamic content |
| 3 | `scrapling extract stealthy-fetch <url> out.md --solve-cloudflare` | Protected sites, Cloudflare, anti-bot systems |

Start with `get`. If it fails or returns empty content, escalate to `fetch`, then `stealthy-fetch` — `fetch` and `stealthy-fetch` cost roughly the same latency, so there is no real downside to reaching for `stealthy-fetch` on a known-protected site.

Choose the output extension for the format you need: `.md` for readable Markdown (best default), `.html` for raw structure, `.txt` for clean plain text. Use `-s`/`--css-selector` to scope extraction and avoid pulling giant HTML blobs.

```bash
# Basic download
scrapling extract get "https://news.site.com" news.md

# Extract only specific content with a CSS selector
scrapling extract get "https://blog.example.com" articles.md --css-selector "article"

# Wait for JS content, then extract
scrapling extract fetch "https://example.com/" content.md --network-idle

# Bypass Cloudflare
scrapling extract stealthy-fetch "https://example.com" data.md --solve-cloudflare
```

Always add `--ai-targeted` when the output feeds an LLM — it extracts only the main content, strips hidden elements, and enables ad blocking, protecting the agent from prompt injection hidden in page markup.

### Step 3: Use Python for anything the CLI can't do

```python
from scrapling.fetchers import Fetcher, FetcherSession

with FetcherSession(impersonate="chrome") as session:
    page = session.get("https://quotes.toscrape.com/", stealthy_headers=True)
    quotes = page.css(".quote .text::text").getall()
```

```python
from scrapling.fetchers import StealthyFetcher, StealthySession

with StealthySession(headless=True, solve_cloudflare=True) as session:
    page = session.fetch("https://example.com/protected", google_search=False)
    data = page.css("#content a").getall()
```

See `references/scrapling-reference.md` for the full fetcher matrix, selector API (CSS/XPath/BeautifulSoup-style), and async session patterns.

### Step 4: Scale to a crawl with the spider framework

```python
from scrapling.spiders import Spider

class QuotesSpider(Spider):
    name = "quotes"
    start_urls = ["https://quotes.toscrape.com/"]
    concurrent_requests = 10
    robots_txt_obey = True  # respect robots.txt

    async def parse(self, response):
        for quote in response.css(".quote"):
            yield {"text": quote.css(".text::text").get()}
        next_page = response.css(".next a")
        if next_page:
            yield response.follow(next_page[0].attrib["href"])

result = QuotesSpider().start()
result.items.to_json("quotes.json")
```

Pass `crawldir="./crawl_data"` to a spider to make long crawls resumable (`Ctrl+C` pauses gracefully; re-running with the same `crawldir` resumes). See `references/scrapling-reference.md` for `CrawlSpider`/`SitemapSpider` (rules-based crawls) and multi-session routing.

### Step 5: Escalate to PixelRAG when layout/vision matters

If a page's *answer* lives in a table, chart, dashboard, or scanned PDF — something that HTML/text extraction throws away — render it to an image and search visually instead:

```bash
bash scripts/setup-pixelrag.sh --stage index
bash scripts/render-and-index.sh "https://example.com/quarterly-report" "Q3 revenue by region" ./out
```

`scripts/render-and-index.sh` renders the source to tiles with `pixelshot`, builds a local FAISS visual index with `pixelrag index build`, serves it, and runs one search query end to end. See `references/pixelrag-reference.md` for the standalone stages (`chunk`/`embed`/`build-index`), the hosted 8.28M-page Wikipedia index at `api.pixelrag.ai` (no setup needed for a quick visual-search demo), and the `pixelbrowse` Claude Code plugin that lets an agent screenshot-and-read a page directly.

## Plugin installation

Both upstream projects ship as installable agent skills/plugins independently of this repo:

**Scrapling** — the official skill (spec-compliant with [agentskills.io](https://agentskills.io/specification)) via [Clawhub](https://docs.openclaw.ai/tools/clawhub):

```bash
clawhub install scrapling-official
```

or download the skill directly: https://github.com/D4Vinci/Scrapling/raw/refs/heads/main/agent-skill/Scrapling-Skill.zip

**PixelRAG** — the `pixelbrowse` renderer skill as a native Claude Code plugin:

```bash
uv tool install pixelrag                             # pixelshot on PATH (or: pipx install pixelrag)
claude plugin marketplace add StarTrail-org/PixelRAG
claude plugin install pixelbrowse@pixelrag-plugins
```

**This combined skill**, via the `skills` CLI:

```bash
skills add -g https://github.com/akillness/oh-my-gods --skill scrapling --yes --copy
```

## Examples

### Example 1: Scrape a blog article to Markdown

```bash
scrapling extract get "https://blog.example.com/post" article.md --css-selector "article" --ai-targeted
```

### Example 2: Bypass Cloudflare on a protected site

```bash
scrapling extract stealthy-fetch "https://nopecha.com/demo/cloudflare" data.md --solve-cloudflare
```

### Example 3: Crawl a paginated listing with a spider

```python
class BlogCrawler(CrawlSpider):
    name = "blog"
    start_urls = ["https://example.com"]
    def rules(self):
        return [CrawlRule(LinkExtractor(allow=r"/posts/"), callback=self.parse_post)]
    async def parse_post(self, response):
        yield {"title": response.css("h1::text").get()}
```

### Example 4: A dashboard page loses its chart in text extraction

```bash
# scrapling extract get returns the labels but not the chart's visual trend —
# fall back to a visual render + search instead:
bash scripts/render-and-index.sh "https://example.com/dashboard" "revenue trend chart" ./out
```

### Example 5: Quick visual search with zero setup

```bash
curl -X POST https://api.pixelrag.ai/search \
  -H "Content-Type: application/json" \
  -d '{"queries": [{"text": "What is the capital of France?"}], "n_docs": 5}'
```

## Best practices

1. Start at `get`, escalate to `fetch`, then `stealthy-fetch` — don't reach for stealth mode by default.
2. Always pass `--ai-targeted` (CLI) when scraped content feeds an LLM, to strip hidden/injected content.
3. Set `robots_txt_obey = True` on spiders and add `download_delay` for large crawls.
4. Prefer `.md` output for LLM readability; use `.html` only when you need structural parsing.
5. Reach for PixelRAG only when the *visual structure* is the actual signal — not as a default first step.
6. Clean up temp files (`tiles/`, rendered screenshots) after reading them.
7. Never scrape content you are not authorized to access, and never bypass paywalls or auth.

## Guardrails (always)

- Only scrape content you're authorized to access; respect robots.txt and each site's ToS.
- Never scrape personal or sensitive data.
- Add crawl delays for large-scale spiders; don't hammer a target site.
- Cloudflare/anti-bot bypass here is automated browser fingerprint evasion — no credential theft, no CAPTCHA-solving services, no secrets required.
- PixelRAG rendering and indexing run fully locally; the only network calls are to the page being rendered and (optionally) the hosted `api.pixelrag.ai` demo endpoint.

## References

- [GitHub: D4Vinci/Scrapling](https://github.com/D4Vinci/Scrapling) — BSD-3-Clause
- [GitHub: StarTrail-org/PixelRAG](https://github.com/StarTrail-org/PixelRAG) — Apache-2.0
- [Scrapling docs](https://scrapling.readthedocs.io) · [PixelRAG paper](https://arxiv.org/abs/2606.28344)
- [References: Scrapling CLI + Python reference](references/scrapling-reference.md)
- [References: PixelRAG render/index/serve reference](references/pixelrag-reference.md)
- [References: escalation decision guide](references/decision-guide.md)
