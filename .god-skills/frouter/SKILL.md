---
name: frouter
description: >
  Discover, benchmark, and configure free AI models for OpenCode and OpenClaw using
  frouter's interactive TUI. Pings all models in parallel every 2 seconds and shows
  live latency, uptime, tier (SWE-bench score), and verdict. Writes model config
  directly to OpenCode / OpenClaw JSON config files.
  Use when selecting the best free model, checking model availability and latency,
  configuring NVIDIA NIM / OpenRouter API keys, or non-interactively capturing the
  best model ID for scripts. Triggers on: free model router, frouter, best free model,
  opencode model config, nvidia nim setup, openrouter config, model latency benchmark,
  free llm discovery, configure opencode model, openclaw model.
allowed-tools: Bash Read Write
license: MIT
compatibility: >
  Node >= 18. Requires at least one API key: NVIDIA NIM (nvapi-*) or OpenRouter (sk-or-*).
  Config stored at ~/.frouter.json. Writes to ~/.config/opencode/opencode.json and
  ~/.openclaw/openclaw.json. Works on macOS, Linux, Windows (WSL).
metadata:
  version: "1.0"
  source: jyoung105/frouter
  npm: frouter-cli
  tags: free-models, opencode, openclaw, nvidia-nim, openrouter, tui, model-router, llm, benchmark
---

# frouter — Free AI Model Router CLI

`frouter` is a terminal UI that discovers, pings, and ranks free AI models from **NVIDIA NIM** and **OpenRouter** in real time — then writes the best model directly into your OpenCode or OpenClaw config.

## When to use this skill

- Select the fastest responding free LLM for your OpenCode or OpenClaw session
- Check live availability, latency, and uptime of free models before starting work
- Configure NVIDIA NIM / OpenRouter API keys interactively with browser auto-open
- Non-interactively capture the best model ID in shell scripts (`frouter --best`)
- Benchmark free model tiers (S+ → C based on SWE-bench Verified scores)
- Switch models on the fly without manually editing JSON config files

## Installation

```bash
# One-shot (no install)
npx frouter-cli

# Global install (recommended)
npm i -g frouter-cli
# or with bun
bun install -g frouter-cli
```

## Instructions

### Step 1: First run — API key setup wizard

```bash
frouter
```

On first run, the setup wizard opens provider key pages in your browser automatically. Press `ESC` to skip any provider you don't have a key for yet.

**API key sources:**

| Provider | Key URL | Prefix |
|----------|---------|--------|
| NVIDIA NIM | [build.nvidia.com/settings/api-keys](https://build.nvidia.com/settings/api-keys) | `nvapi-` |
| OpenRouter | [openrouter.ai/settings/keys](https://openrouter.ai/settings/keys) | `sk-or-` |

Keys are stored at `~/.frouter.json` (permissions `0600`).

You can also pass keys via environment variables:

```bash
NVIDIA_API_KEY=nvapi-xxx frouter
OPENROUTER_API_KEY=sk-or-xxx frouter
```

### Step 2: Interactive TUI — select and apply a model

```bash
frouter
```

The TUI pings all models every 2 seconds. Use arrow keys to navigate, `/` to search, and `Enter` to apply a model to OpenCode or OpenClaw.

**Key actions:**

| Key | Action |
|-----|--------|
| `↑` / `↓` | Navigate models |
| `/` | Search / filter by name |
| `Enter` | Select → target picker (OpenCode / OpenClaw) |
| `T` | Cycle tier filter: All → S+ → S → A+ → … |
| `A` | Quick API key add/change |
| `P` | Settings (keys, provider toggle, live test) |
| `0`–`9` | Sort by column (press again to reverse) |
| `?` | Help overlay |
| `q` | Quit |

**Target picker** (after Enter):

| Key | Action |
|-----|--------|
| `Enter` / `G` | Write config + launch the tool |
| `S` | Write config only (no launch) |
| `ESC` | Cancel |

Configs written:
- **OpenCode CLI** → `~/.config/opencode/opencode.json`
- **OpenClaw** → `~/.openclaw/openclaw.json`

Existing configs are automatically backed up before overwriting.

### Step 3: Non-interactive best-model selection (scripts)

```bash
# Print best model ID after ~10 s analysis
frouter --best

# Capture in a variable
MODEL=$(frouter --best)
echo "Best model: $MODEL"
```

Selection tri-key sort: `status=up` → lowest avg latency → highest uptime.

### Step 4: Tune auto-sort behavior (optional)

```bash
# Pause auto-resorting for 2.5 s after scroll navigation
FROUTER_SCROLL_SORT_PAUSE_MS=2500 frouter

# Disable rolling metrics cache (force legacy recompute)
FROUTER_METRICS_CACHE=0 frouter
```

Or persist in `~/.frouter.json`:

```json
{
  "ui": { "scrollSortPauseMs": 1500 }
}
```

## TUI columns

| Column | Description |
|--------|-------------|
| `#` | Rank |
| `Tier` | SWE-bench score tier: S+ (≥70%) → C (<20%) |
| `Provider` | NIM or OpenRouter |
| `Model` | Display name |
| `Ctx` | Context window size |
| `AA` | Arena Elo / intelligence score |
| `Avg` | Rolling average latency (HTTP 200 only) |
| `Lat` | Latest measured ping latency |
| `Up%` | Uptime % this session |
| `Verdict` | 🚀 Perfect / ✅ Normal / 🔥 Overloaded / 💀 Unusable |

## Examples

### Example 1: Start frouter and apply a model to OpenCode

```bash
frouter
# Navigate to desired model → Enter → select OpenCode CLI → Enter
```

### Example 2: Get best model for a script

```bash
MODEL=$(frouter --best)
opencode --model "$MODEL" "refactor this function"
```

### Example 3: Set API key without entering TUI

```bash
NVIDIA_API_KEY=nvapi-xxx frouter --best
```

### Example 4: Test-onboard from a clean state

```bash
# Without touching your real config
npm run test:fresh-start
```

## Model tier scale (SWE-bench Verified)

| Tier | Score | Description |
|------|-------|-------------|
| **S+** | ≥ 70% | Elite frontier |
| **S** | 60–70% | Excellent |
| **A+** | 50–60% | Great |
| **A** | 40–50% | Good |
| **A-** | 35–40% | Decent |
| **B+** | 30–35% | Average |
| **B** | 20–30% | Below average |
| **C** | < 20% | Lightweight / edge |

## Best practices

1. **Set both API keys** — NIM and OpenRouter have overlapping models; having both maximises coverage
2. **Use `--best` in scripts** instead of hardcoding a model ID — model availability changes
3. **Press `S` to write config only** when you want to set the model without launching the tool
4. **`T` to filter tier** — if you only want S+ or S models, press `T` to cycle the tier filter
5. **Keep frouter updated** — model catalog syncs daily via GitHub Actions; accept in-app update prompts

## References

- [GitHub: jyoung105/frouter](https://github.com/jyoung105/frouter)
- [npm: frouter-cli](https://www.npmjs.com/package/frouter-cli)
- [Homepage](https://tonylee.im/frouter)
- [TUI guide](references/tui-guide.md) — full keyboard shortcuts and column reference
- [Providers guide](references/providers.md) — NVIDIA NIM and OpenRouter setup
