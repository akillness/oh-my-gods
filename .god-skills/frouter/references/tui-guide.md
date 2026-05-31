# frouter TUI Reference

Complete keyboard shortcut and column reference for the frouter interactive terminal UI.

## Navigation

| Key | Action |
|-----|--------|
| `↑` / `k` | Move up |
| `↓` / `j` | Move down |
| `PgUp` / `PgDn` | Page up / down |
| `g` | Jump to top |
| `G` | Jump to bottom |

## Actions

| Key | Action |
|-----|--------|
| `Enter` | Select model → target picker (OpenCode CLI / OpenClaw) |
| `/` | Search / filter models (Enter in search = apply to OpenCode only) |
| `A` | Quick API key add/change (opens key editor in Settings) |
| `R` | Edit API key for likely expired/missing provider |
| `T` | Cycle tier filter: All → S+ → S → A+ → A → A- → B+ → B → C |
| `P` | Settings screen (edit keys, toggle providers, live test) |
| `W` / `X` | Faster / slower ping interval |
| `?` | Help overlay |
| `q` / `Ctrl+C` | Quit |

## Sort keys (press again to reverse)

| Key | Column |
|-----|--------|
| `0` | Priority (default) |
| `1` | Tier |
| `2` | Provider |
| `3` | Model name |
| `4` | Avg latency |
| `5` | Latest ping |
| `6` | Uptime % |
| `7` | Context window |
| `8` | Verdict |
| `9` | AA Intelligence score |

## Target picker (after pressing Enter on a model)

| Key | Action |
|-----|--------|
| `↑` / `↓` | Navigate (OpenCode CLI / OpenClaw) |
| `Enter` / `G` | Write config + launch tool |
| `S` | Write config only (no launch) |
| `ESC` | Cancel |

## Settings screen (P)

| Key | Action |
|-----|--------|
| `↑` / `↓` / `j` / `k` | Navigate providers |
| `Enter` | Edit API key inline |
| `Space` | Toggle provider enabled / disabled |
| `T` | Fire a live test ping |
| `D` | Delete key for this provider |
| `ESC` | Back to main list |

**Tips:**
- Press `A` from the main list to jump directly into API key editing
- If a selected provider has no key, frouter auto-opens that provider's key page in browser (once per session)

## Search bar provider badges

| Badge | Meaning |
|-------|---------|
| `Name:✓` | Key exists and looks healthy |
| `Name:✗` | Provider appears expired / no-auth |
| `Name:○` | Key missing |

## Columns reference

| Column | Description |
|--------|-------------|
| `#` | Rank |
| `Tier` | Capability tier derived from SWE-bench Verified score (S+ → C) |
| `Provider` | NIM or OpenRouter |
| `Model` | Display name |
| `Ctx` | Context window size |
| `AA` | Arena Elo / intelligence score |
| `Avg` | Rolling average latency (HTTP 200 only) |
| `Lat` | Latest measured ping latency |
| `Up%` | Uptime percentage this session |
| `Verdict` | Condition summary |

## Verdict legend

| Verdict | Trigger |
|---------|---------|
| 🔥 Overloaded | Last HTTP code = 429 |
| ⚠️ Unstable | Was up, now failing |
| 👻 Not Active | Never responded |
| ⏳ Pending | Waiting for first success |
| 🚀 Perfect | Avg < 400 ms |
| ✅ Normal | Avg < 1000 ms |
| 🐢 Slow | Avg < 3000 ms |
| 🐌 Very Slow | Avg < 5000 ms |
| 💀 Unusable | Avg ≥ 5000 ms |

## Default ranking logic

1. Availability first (up models before down)
2. Higher tier first (S+ → S → A+ → …)
3. Lower latency (within same tier)
