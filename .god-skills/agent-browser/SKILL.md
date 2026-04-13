---
name: agent-browser
description: >
  Control a fresh or session-isolated browser with agent-browser for website
  interaction, form automation, screenshots, scraping, and deterministic web
  verification. Use when the task needs headless or disposable browser
  automation, ref-based interaction (`@e1`, `@e2`), or CI-friendly checks
  instead of the user's running browser session. Triggers on: agent-browser,
  headless browser, web verification, fill form, scrape site, screenshot page,
  diff snapshot, browser session.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: browser-automation, headless-browser, ai-agent, web-testing, web-scraping, verification
  platforms: Claude, Gemini, Codex, ChatGPT
  version: 1.1.0
  source: vercel-labs/agent-browser
---

# agent-browser - Browser Automation for AI Agents

## When to use this skill

- Open websites and automate UI actions
- Fill forms, click controls, and verify outcomes
- Capture screenshots or PDFs, or extract page content
- Run deterministic web checks with accessibility refs
- Execute parallel browser tasks via isolated sessions
- Prefer this over `playwriter` when you want disposable browser state instead of the user's already-running Chrome session

## Instructions

### Step 1: Pick the right browser surface

- Use `agent-browser` when the task should run in a fresh or isolated browser session, when browser state should be disposable, or when the flow needs to be reproducible in CI or automation.
- Route to `playwriter` instead when the task depends on the user's current Chrome state, saved logins, cookies, extensions, or already-open tabs.

### Step 2: Refresh runtime guidance when version-specific behavior matters

- Use the bundled instructions here for the stable default workflow.
- If the installed CLI may be newer than this repo copy, refresh the live instructions first:

```bash
agent-browser skills list
agent-browser skills get agent-browser --full
```

- Check specialized runtime skills when the workflow is narrower than general browser automation, such as `dogfood`, `slack`, or `electron`.

### Step 3: Use the deterministic ref loop

Always use the ref-first loop:

1. `agent-browser open <url>`
2. `agent-browser wait --load networkidle` when navigation is still settling
3. `agent-browser snapshot -i`
4. Interact with refs (`@e1`, `@e2`, ...)
5. `agent-browser snapshot -i` or `agent-browser diff snapshot` again after the page or DOM changes

```bash
agent-browser open https://example.com/form
agent-browser wait --load networkidle
agent-browser snapshot -i
agent-browser fill @e1 "user@example.com"
agent-browser click @e2
agent-browser diff snapshot
```

### Step 4: Verify after every meaningful action

Use explicit evidence after actions.

```bash
# Baseline -> action -> verify structure
agent-browser snapshot -i
agent-browser click @e3
agent-browser diff snapshot

# Visual regression
agent-browser screenshot baseline.png
agent-browser click @e5
agent-browser diff screenshot --baseline baseline.png
```

### Step 5: Scale safely with sessions, waits, and scoped output

Use `&&` chaining when intermediate output is not needed.

```bash
# Good chaining: open -> wait -> snapshot
agent-browser open https://example.com && agent-browser wait --load networkidle && agent-browser snapshot -i

# Separate calls when output is needed first
agent-browser snapshot -i
# parse refs
agent-browser click @e2
```

High-value commands:
- Navigation: `open`, `close`
- Snapshot: `snapshot -i`, `snapshot -i -C`, `snapshot -s "#selector"`
- Interaction: `click`, `fill`, `type`, `select`, `check`, `press`
- Verification: `diff snapshot`, `diff screenshot --baseline <file>`, `diff url <url1> <url2>`
- Capture: `screenshot`, `screenshot --annotate`, `pdf`
- Wait: `wait --load networkidle`, `wait <selector|@ref|ms>`

## Examples

### Example 1: Drive a public form in an isolated browser

Input:
```text
Use agent-browser to open the contact page, fill the form, submit it, and verify the page changed.
```

Output shape:
- uses `agent-browser`, not `playwriter`
- follows `open -> snapshot -i -> interact -> diff snapshot`
- re-snapshots or diffs after the submit action

### Example 2: Compare staging and production without reusing local browser state

Input:
```text
Compare the staging and production homepages with agent-browser and show whether the structure or screenshot changed.
```

Output shape:
- stays on `agent-browser` as the isolated verification surface
- uses `diff url`, `diff snapshot`, or `diff screenshot --baseline ...`
- keeps evidence explicit instead of describing the result from memory

### Example 3: Choose playwriter when the task needs the user's existing login

Input:
```text
I need to inspect an authenticated checkout flow that depends on my saved Chrome login and current cart state. Should I use agent-browser or playwriter?
```

Output shape:
- routes to `playwriter` for the logged-in running-browser case
- explains that `agent-browser` is the isolated or disposable alternative
- preserves the distinction between headless verification and stateful browser control

## Best practices

- Prefer snapshot refs (`@e1`, `@e2`) over fragile CSS selectors whenever possible.
- Re-run `snapshot -i` after navigation or major DOM changes before acting again.
- Prefer `wait --load networkidle` or selector/ref waits over fixed sleeps.
- Use `--session <name>` to isolate parallel work or preserve reusable auth safely.
- Use `diff snapshot`, `diff screenshot`, or saved baselines instead of assuming the page changed correctly.
- Refresh CLI-served skills with `agent-browser skills get ...` when you suspect version drift between the repo copy and the installed binary.
- Apply domain allowlists, content boundaries, and action policies in sensitive or prompt-injection-prone flows.

## Safety and reliability

- Refs are invalid after navigation or significant DOM updates; re-snapshot before the next action.
- For multi-step JS, use `eval --stdin` or base64 input to avoid shell escaping breakage.
- For concurrent tasks, isolate with `--session <name>`.
- Use output controls in long pages to reduce context flooding.
- Optional hardening in sensitive flows: domain allowlist and action policies.

Optional hardening examples:

```bash
# Wrap page content with boundaries to reduce prompt-injection risk
export AGENT_BROWSER_CONTENT_BOUNDARIES=1

# Limit output volume for long pages
export AGENT_BROWSER_MAX_OUTPUT=50000

# Restrict navigation and network to trusted domains
export AGENT_BROWSER_ALLOWED_DOMAINS="example.com,*.example.com"

# Restrict allowed action types
export AGENT_BROWSER_ACTION_POLICY=./policy.json
```

Example `policy.json`:

```json
{"default":"deny","allow":["navigate","snapshot","click","fill","scroll","wait","get"],"deny":["eval","download","upload","network","state"]}
```

CLI-flag equivalent:

```bash
agent-browser --content-boundaries --max-output 50000 --allowed-domains "example.com,*.example.com" --action-policy ./policy.json open https://example.com
```

## Troubleshooting

- `command not found`: install and run `agent-browser install`.
- Wrong element clicked: run `snapshot -i` again and use fresh refs.
- Dynamic SPA content missing: wait with `--load networkidle` or targeted `wait` selector.
- Session collisions: assign unique `--session` names and close each session.
- Large output pressure: narrow snapshots (`-i`, `-c`, `-d`, `-s`) and extract only needed text.

## References

Deep-dive docs in this skill:
- [commands](./references/commands.md)
- [snapshot-refs](./references/snapshot-refs.md)
- [session-management](./references/session-management.md)
- [authentication](./references/authentication.md)

Related resources:
- https://github.com/vercel-labs/agent-browser
- https://agent-browser.dev
- https://agent-browser.dev/skills
- https://agent-browser.dev/sessions
- https://agent-browser.dev/diffing
- https://agent-browser.dev/selectors
