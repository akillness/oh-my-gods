# plannotator Notes and Troubleshooting

Use this reference when the caller needs Export -> Notes behavior, Obsidian or
Bear setup, or known recovery steps.

## Manual save via Export -> Notes

This path lets the user save a reviewed plan without approving or denying it.

How to access it:

1. Click `Export`
2. Open the `Notes` tab
3. Use `Save` for Obsidian or Bear, or `Save All`

Requirements:

- plannotator must be running in hook mode
- Obsidian or Bear must be configured in Settings -> Saving
- Settings persist in cookies, not localStorage

## Obsidian setup

Prerequisites:

1. Install Obsidian
2. Create at least one vault
3. Confirm the Obsidian config exists on the local machine

Checks:

```bash
ls /Applications/Obsidian.app
cat ~/Library/Application\ Support/obsidian/obsidian.json
cat ~/.config/obsidian/obsidian.json
```

Suggested verification flow:

```bash
bash scripts/check-status.sh
```

Then open a hook-driven plannotator session, go to Settings -> Saving, enable
Obsidian integration, select the vault, and test a save.

## Bear Notes

Bear uses the callback surface rather than direct file writes.

Validation:

```bash
open "bear://x-callback-url/create?title=Plannotator%20Check&text=Bear%20callback%20OK"
```

## Known limitations

- `plannotator review` opens the review UI, but `Send Feedback` does not
  automatically return to the active agent session.
- Export -> Notes save requires hook mode; CLI `review` or `annotate` modes do
  not expose the save-notes endpoint.
- Obsidian integration settings must be configured in the normal system browser.
  Headless or isolated browser profiles use separate cookie jars.
- Diff review requires a git repository.

## Recovery steps

Wrong tab or stale process:

```bash
pkill plannotator 2>/dev/null; sleep 1
export PLANNOTATOR_PORT=19432
plannotator review
```

Vault not detected:

```bash
ls ~/Library/Application\ Support/obsidian/obsidian.json
open /Applications/Obsidian.app
```

Plans not saving:

```bash
ls -la ~/path/to/vault/plannotator/
```

If the user still needs the annotations in chat, tell them to export, copy, or
paste the notes back into the active agent session manually.
