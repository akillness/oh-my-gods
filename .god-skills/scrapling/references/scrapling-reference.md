# Scrapling — CLI and Python Reference

Condensed from the official [Scrapling docs](https://scrapling.readthedocs.io) and the
project's own [AI agent skill](https://github.com/D4Vinci/Scrapling/tree/main/agent-skill)
(BSD-3-Clause). Use this file as the quick-reference layer; check the linked docs for
anything not covered here.

## Setup

```bash
pip install "scrapling[all]>=0.4.9"
scrapling install --force   # downloads Camoufox/Playwright browser binaries
```

Docker (commands only, no Python authoring):

```bash
docker pull pyd4vinci/scrapling
# or
docker pull ghcr.io/d4vinci/scrapling:latest
```

## CLI — `scrapling extract`

```
Usage: scrapling extract [OPTIONS] COMMAND [ARGS]...

Commands:
  get             GET request → save content to a file
  post            POST request → save content to a file
  put             PUT request → save content to a file
  delete          DELETE request → save content to a file
  fetch           Browser automation fetch, flexible options
  stealthy-fetch  Stealthy browser fetch, advanced stealth features
```

Output format is controlled by the file extension: `.md` (Markdown, best for LLM
consumption), `.html` (raw HTML), `.txt` (clean plain text).

**Escalation order**: `get` → `fetch` → `stealthy-fetch`. Start with `get`; if it fails or
returns empty content, escalate. `fetch` and `stealthy-fetch` have near-identical latency,
so there is no real cost to reaching for `stealthy-fetch` on a known-protected site.

### Shared request options (`get`/`post`/`put`/`delete`)

| Option | Type | Description |
|---|:---:|---|
| `-H, --headers` | TEXT | HTTP header `"Key: Value"` (repeatable) |
| `--cookies` | TEXT | Cookie string `"name1=value1; name2=value2"` |
| `--timeout` | INT | Request timeout in seconds (default 30) |
| `--proxy` | TEXT | `"http://user:pass@host:port"` |
| `-s, --css-selector` | TEXT | CSS selector to extract only matching content |
| `-p, --params` | TEXT | Query param `"key=value"` (repeatable) |
| `--follow-redirects` | flag | Follow redirects (default: safe — rejects internal/private IPs) |
| `--verify` | flag | Verify SSL certs (default: True) |
| `--impersonate` | TEXT | Browser TLS fingerprint to impersonate (e.g. `Chrome`, or a comma list for random pick) |
| `--stealthy-headers` | flag | Use stealthy browser headers (default: True) |
| `--ai-targeted` | flag | Extract main content only, strip hidden elements — use for LLM-bound output |

`post`/`put` add: `-d/--data` (form body) and `-j/--json` (JSON body).

### Browser options (`fetch`/`stealthy-fetch`, shared)

| Option | Type | Description |
|---|:---:|---|
| `--headless` | flag | Headless mode (default: True) |
| `--disable-resources` | flag | Drop non-essential resources for speed |
| `--network-idle` | flag | Wait for network idle before returning |
| `--real-chrome` | flag | Use an installed system Chrome instead of the bundled browser |
| `--timeout` | INT | Timeout in ms (default 30000) |
| `--wait` | INT | Extra wait in ms after load |
| `-s, --css-selector` | TEXT | Scope extraction |
| `--wait-selector` | TEXT | Wait for a selector before proceeding |
| `--proxy` | TEXT | Proxy URL |
| `-H, --extra-headers` | TEXT | Extra headers (repeatable) |
| `--dns-over-https` | flag | Route DNS through Cloudflare DoH (prevents leaks behind a proxy) |
| `--block-ads` | flag | Block ~3,500 known ad/tracker domains |
| `--ai-targeted` | flag | Main content only + auto ad-blocking |

`fetch`-only: `--locale`.

`stealthy-fetch`-only:

| Option | Description |
|---|---|
| `--block-webrtc` / `--allow-webrtc` | Block WebRTC entirely (default: allowed) |
| `--solve-cloudflare` | Solve Cloudflare Turnstile challenges |
| `--allow-webgl` / `--block-webgl` | Allow WebGL (default: allowed) |
| `--hide-canvas` / `--show-canvas` | Add canvas fingerprint noise |

### Examples

```bash
scrapling extract get "https://news.site.com" news.md
scrapling extract get "https://example.com" content.txt --timeout 60
scrapling extract get "https://blog.example.com" articles.md --css-selector "article"
scrapling extract fetch "https://example.com/" content.md --network-idle
scrapling extract fetch "https://example.com/" data.txt --wait-selector ".content-loaded"
scrapling extract stealthy-fetch "https://example.com" content.md
scrapling extract stealthy-fetch "https://nopecha.com/demo/cloudflare" data.txt \
  --solve-cloudflare --css-selector "#content a"
```

## Python API

### One-off and session-based requests

```python
from scrapling.fetchers import Fetcher, FetcherSession

with FetcherSession(impersonate="chrome") as session:
    page = session.get("https://quotes.toscrape.com/", stealthy_headers=True)
    quotes = page.css(".quote .text::text").getall()

# One-off, no session
page = Fetcher.get("https://quotes.toscrape.com/")
quotes = page.css(".quote .text::text").getall()
```

### Stealth mode (Cloudflare Turnstile, fingerprint evasion)

```python
from scrapling.fetchers import StealthyFetcher, StealthySession

with StealthySession(headless=True, solve_cloudflare=True) as session:
    page = session.fetch("https://nopecha.com/demo/cloudflare", google_search=False)
    data = page.css("#padded_content a").getall()
```

### Full browser automation

```python
from scrapling.fetchers import DynamicFetcher, DynamicSession

with DynamicSession(headless=True, disable_resources=False, network_idle=True) as session:
    page = session.fetch("https://quotes.toscrape.com/", load_dom=False)
    data = page.xpath('//span[@class="text"]/text()').getall()
```

### Selection API

```python
page.css(".quote")               # CSS
page.xpath('//div[@class="quote"]')  # XPath
page.find_all("div", {"class": "quote"})   # BeautifulSoup-style
page.find_by_text("quote", tag="div")      # find by visible text

quote_text = page.css(".quote")[0].css(".text::text").get()
first_quote = page.css(".quote")[0]
author = first_quote.next_sibling.css(".author::text")
parent_container = first_quote.parent
similar_elements = first_quote.find_similar()
```

Standalone parsing, no fetch:

```python
from scrapling.parser import Selector
page = Selector("<html>...</html>")
```

### Async sessions

```python
import asyncio
from scrapling.fetchers import FetcherSession, AsyncStealthySession, AsyncDynamicSession

async with FetcherSession(http3=True) as session:  # context-aware: works sync or async
    page1 = session.get("https://quotes.toscrape.com/")
    page2 = session.get("https://quotes.toscrape.com/", impersonate="firefox135")

async with AsyncStealthySession(max_pages=2) as session:
    tasks = [session.fetch(u) for u in ["https://example.com/page1", "https://example.com/page2"]]
    print(session.get_pool_stats())
    results = await asyncio.gather(*tasks)

# Capture XHR/fetch API calls during page load
async with AsyncDynamicSession(capture_xhr=r"https://api\.example\.com/.*") as session:
    page = await session.fetch("https://example.com")
    for xhr in page.captured_xhr:
        print(xhr.url, xhr.status, xhr.body)
```

## Spiders

```python
from scrapling.spiders import Spider, Request, Response

class QuotesSpider(Spider):
    name = "quotes"
    start_urls = ["https://quotes.toscrape.com/"]
    concurrent_requests = 10
    robots_txt_obey = True

    async def parse(self, response: Response):
        for quote in response.css(".quote"):
            yield {"text": quote.css(".text::text").get(), "author": quote.css(".author::text").get()}
        next_page = response.css(".next a")
        if next_page:
            yield response.follow(next_page[0].attrib["href"])

result = QuotesSpider().start()
result.items.to_json("quotes.json")
```

Multiple session types in one spider:

```python
from scrapling.spiders import Spider, Request
from scrapling.fetchers import FetcherSession, AsyncStealthySession

class MultiSessionSpider(Spider):
    name = "multi"
    start_urls = ["https://example.com/"]

    def configure_sessions(self, manager):
        manager.add("fast", FetcherSession(impersonate="chrome"))
        manager.add("stealth", AsyncStealthySession(headless=True), lazy=True)

    async def parse(self, response):
        for link in response.css("a::attr(href)").getall():
            if "protected" in link:
                yield Request(link, sid="stealth")
            else:
                yield Request(link, sid="fast", callback=self.parse)
```

Pause/resume long crawls:

```python
QuotesSpider(crawldir="./crawl_data").start()
```

`Ctrl+C` pauses gracefully and saves progress; re-run with the same `crawldir` to resume.
Set `development_mode = True` on a spider to cache responses under
`.scrapling_cache/{spider.name}/` while iterating on `parse()` — don't ship with it enabled.

Rules-based crawls (follow links matching a pattern) — use `CrawlSpider` instead of a manual
link-extraction loop:

```python
from scrapling.spiders import CrawlSpider, CrawlRule, LinkExtractor

class BlogCrawler(CrawlSpider):
    name = "blog"
    start_urls = ["https://example.com"]

    def rules(self):
        return [
            CrawlRule(LinkExtractor(allow=r"/posts/"), callback=self.parse_post),
            CrawlRule(LinkExtractor(allow=r"/page/\d+/")),  # pagination, no callback
        ]

    async def parse_post(self, response):
        yield {"title": response.css("h1::text").get()}
```

`SitemapSpider` follows the same `rules()` API but is seeded from `sitemap_urls` — point it at
a site's `robots.txt` directly and it extracts each `Sitemap:` directive automatically.

## Notes

- Always clean up temp output files after reading them.
- Prefer `.md` output for readability; use `.html` only when you need to parse structure.
- Use `-s`/`--css-selector` to avoid passing giant HTML blobs — saves tokens significantly.
- Add `download_delay` on spiders and set `robots_txt_obey = True` for large crawls.

## Full docs

- https://scrapling.readthedocs.io
- https://github.com/D4Vinci/Scrapling/tree/main/docs (Markdown source of the docs site)
