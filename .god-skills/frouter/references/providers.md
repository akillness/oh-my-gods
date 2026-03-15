# frouter Providers Reference

## Supported Providers

| Provider | Free key | Key prefix |
|----------|----------|------------|
| **NVIDIA NIM** | [build.nvidia.com/settings/api-keys](https://build.nvidia.com/settings/api-keys) | `nvapi-` |
| **OpenRouter** | [openrouter.ai/settings/keys](https://openrouter.ai/settings/keys) | `sk-or-` |

## API Key Priority

```
Environment variable → ~/.frouter.json → keyless ping (latency still shown)
```

Keyless pings still show latency data but cannot authenticate model requests.

## Setting Keys

### Via environment variable (session-only)

```bash
NVIDIA_API_KEY=nvapi-xxx frouter
OPENROUTER_API_KEY=sk-or-xxx frouter
```

### Via frouter TUI (persistent)

1. Launch `frouter`
2. Press `P` (Settings) or `A` (quick key add)
3. Navigate to provider and press `Enter` to edit key inline
4. frouter auto-opens the provider key page in browser if key is missing

### Via config file (manual)

Edit `~/.frouter.json`:

```json
{
  "apiKeys": {
    "nvidia": "nvapi-xxx",
    "openrouter": "sk-or-xxx"
  },
  "providers": {
    "nvidia": { "enabled": true },
    "openrouter": { "enabled": true }
  }
}
```

File permissions are set to `0600` automatically.

## NVIDIA NIM

- Free tier available at [build.nvidia.com](https://build.nvidia.com)
- Key prefix: `nvapi-`
- Hosts top-tier models: Llama, Mistral, Qwen, DeepSeek, etc.
- Some NIM models may fall back to OpenRouter if OpenRouter has the model and the NIM provider is unavailable

**OpenCode fallback**: If NIM selects a model that maps to OpenRouter (e.g. NIM Stepfun → OpenRouter), frouter prompts: `Add API key now? (Y/n)` if OpenRouter key is missing.

## OpenRouter

- Free tier at [openrouter.ai](https://openrouter.ai)
- Key prefix: `sk-or-`
- Aggregates models from many providers with free quotas
- Excellent coverage for Claude, Gemini, Llama, and niche models

## Model Catalog Auto-Sync

frouter keeps its model catalog current via GitHub Actions:

- **Daily sync**: `17 3 * * *` UTC — updates `model-rankings.json`
- **Weekly AA refresh**: `47 4 * * 1` UTC — updates Arena Elo scores
- **Manual**: `workflow_dispatch`

Local sync (for development):

```bash
npm run models:sync        # preview changes
npm run models:sync:apply  # apply changes
```

Required secrets for the sync workflow:
- `NVIDIA_API_KEY`
- `OPENROUTER_API_KEY`
- `ARTIFICIAL_ANALYSIS_API_KEY`
