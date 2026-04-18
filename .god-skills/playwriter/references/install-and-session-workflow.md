# Install and session workflow

## Install and enable the right surface

1. Install the Playwriter Chrome extension from the Web Store.
2. Pin it so the enabled-tab state is visible.
3. Open the tab you want to automate and click the icon until it turns green.
4. Install the CLI:

```bash
npm install -g playwriter
# or validate the package without a global install:
npx playwriter@latest --help
```

The extension starts a local relay on `localhost:19988` once an enabled tab is available.

## Start every task with a session

Create one session per autonomous workflow:

```bash
playwriter session new
playwriter session list
```

Use a separate session for unrelated jobs so state, listeners, and temporary variables do not bleed across tasks.

## Observe -> Act -> Observe

Use the same loop every time:

```bash
playwriter -s 1 -e 'await page.goto("https://example.com")'
playwriter -s 1 -e 'await snapshot({ page })'
playwriter -s 1 -e 'await page.locator("aria-ref=e5").click()'
playwriter -s 1 -e 'await snapshot({ page })'
```

Operational rules:

- Re-snapshot after every DOM-changing action.
- Do not reuse `aria-ref` labels after navigation or modal changes.
- Prefer `snapshot({ page })` over screenshots when the task is mostly textual or structural.

## Use `-e` deliberately

Single-line commands work well for short actions:

```bash
playwriter -s 1 -e 'await page.fill("#search", "playwriter"); await page.keyboard.press("Enter")'
```

For multiline code, use a heredoc so quoting stays stable:

```bash
playwriter -s 1 -e "$(cat <<'EOF'
const heading = await page.textContent('h1');
state.heading = heading;
await snapshot({ page });
EOF
)"
```

## Persist only the context you need

The `state` object survives multiple `-e` calls within a session:

```bash
playwriter -s 1 -e 'state.url = page.url(); state.title = await page.title()'
playwriter -s 1 -e 'console.log(state.url, state.title)'
```

Use it for small workflow state, not as a substitute for re-observing the page.

## Built-in helpers worth using

- `snapshot({ page })`: text-first accessibility snapshot
- `screenshotWithAccessibilityLabels({ page })`: visual capture with element labels
- `waitForPageLoad()`: page-settling helper
- `getLatestLogs()`: recent browser console logs
- `getPageMarkdown()`: page text via Readability

## Cleanup discipline

- Use `playwriter session delete <id>` when the task is fully done.
- Use `playwriter session reset <id>` when the CDP connection is stale but the browser context should stay reusable.
