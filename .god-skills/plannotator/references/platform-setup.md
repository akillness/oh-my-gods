# plannotator Platform Setup

Use this reference when the caller needs platform-specific installation,
hook wiring, or invocation details beyond the main SKILL entrypoint.

## Claude Code

Hook setup:

```bash
bash scripts/setup-hook.sh
```

Plugin alternative:

```bash
/plugin marketplace add backnotprop/plannotator
/plugin install plannotator@plannotator
```

Notes:

- The hook is written to `~/.claude/settings.json`
- Restart Claude Code after changing hooks or installing the plugin
- Hook mode is the cleanest path for live plan review feedback

## Gemini CLI

Setup:

```bash
bash scripts/setup-gemini-hook.sh
```

Useful options:

```bash
bash scripts/setup-gemini-hook.sh --dry-run
bash scripts/setup-gemini-hook.sh --hook-only
bash scripts/setup-gemini-hook.sh --md-only
```

What it changes:

- merges the `ExitPlanMode` hook into `~/.gemini/settings.json`
- appends usage guidance to `~/.gemini/GEMINI.md`

Typical usage after setup:

```bash
gemini --approval-mode plan
```

## Codex CLI

Setup:

```bash
bash scripts/setup-codex-hook.sh
```

What it changes:

- adds plannotator guidance to `~/.codex/config.toml`
- updates the `developer_instructions` surface
- creates `~/.codex/prompts/plannotator.md`

Usage after setup:

```bash
/prompts:plannotator
plannotator review HEAD~1
```

Manual plan submission should use the JSON pattern from the main SKILL entrypoint
instead of `plannotator plan -` with heredoc or echo.

## OpenCode

Setup:

```bash
bash scripts/setup-opencode-plugin.sh
```

Manual config shape:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "plugin": ["@plannotator/opencode@latest"]
}
```

Available commands after setup:

- `/plannotator-review`
- `/plannotator-annotate <file.md>`

## Remote and devcontainer mode

Use this when the browser must connect through SSH, WSL, or a forwarded port.

```bash
bash scripts/configure-remote.sh
bash scripts/configure-remote.sh --show
bash scripts/configure-remote.sh --port 9999
```

Important environment variables:

| Variable | Purpose |
|----------|---------|
| `PLANNOTATOR_REMOTE` | Disable auto-browser open for remote mode |
| `PLANNOTATOR_PORT` | Pin a forwarded or fixed local port |
| `PLANNOTATOR_BROWSER` | Override the browser executable |
| `PLANNOTATOR_SHARE_URL` | Override the share portal URL |
