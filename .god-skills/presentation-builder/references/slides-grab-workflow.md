# slides-grab workflow reference

Use this reference after the entrypoint selects `presentation-builder`. Keep
the main `SKILL.md` focused on routing and stage order; load this file when the
user actually needs install, asset, or export detail.

## Upstream anchors checked on 2026-04-18

- slides-grab repo: `https://github.com/vkehfdl1/slides-grab`
- Upstream README describes the canonical flow as:
  `Plan -> Design -> Edit -> Export`
- Current upstream caveat: PPTX and Figma export are still described as
  experimental / unstable

## Install lanes

Choose the lightest viable install path:

1. Reuse an existing `slides-grab` checkout or npm install if the workspace
   already has one.
2. For normal use, prefer the npm package:

```bash
npm install slides-grab
npx playwright install chromium
npx skills add ./node_modules/slides-grab -g -a codex -a claude-code --yes --copy
```

3. Clone the repo only when the user wants to develop `slides-grab` itself:

```bash
git clone https://github.com/vkehfdl1/slides-grab.git
cd slides-grab
npm ci
npx playwright install chromium
```

Minimum requirement: `Node.js >= 18`.

## Deck workspace contract

Keep decks in a stable directory such as:

```text
decks/<deck-name>/
  slide-outline.md
  slide-01-cover.html
  slide-02-problem.html
  assets/
```

Rules:

- Keep one primary idea per slide
- Use self-contained `slide-*.html` files
- Reuse the same deck directory through revisions
- Keep speaker notes or rationale outside the slide body when possible

## Asset contract

Saved slides should reference local assets under `<slides-dir>/assets/`:

- Preferred image form: `./assets/<file>`
- Preferred video form: `./assets/<file>` with a `poster="./assets/<file>"`
- Allowed: `data:` URLs for fully self-contained slides
- Avoid: remote `http(s)://` media URLs in saved slide HTML
- Avoid: absolute filesystem paths

Run `slides-grab validate --slides-dir <path>` before export so missing or
non-portable assets fail early.

## Core commands

Discovery commands that work without a deck:

```bash
slides-grab --help
slides-grab list-templates
slides-grab list-styles
slides-grab preview-styles
```

Deck commands that require an existing slides workspace:

```bash
slides-grab build-viewer --slides-dir decks/<deck-name>
slides-grab validate --slides-dir decks/<deck-name>
slides-grab edit --slides-dir decks/<deck-name>
slides-grab pdf --slides-dir decks/<deck-name> --output decks/<deck-name>.pdf
slides-grab convert --slides-dir decks/<deck-name> --output decks/<deck-name>.pptx
slides-grab figma --slides-dir decks/<deck-name> --output decks/<deck-name>-figma.pptx
```

## Review and export expectations

- Get outline approval before slide generation when the user wants a real deck
- Review the HTML viewer or editor before exporting binaries
- Treat PPTX and Figma exports as best-effort outputs that may need manual
  cleanup
- Prefer PDF export when the user needs reliable sharing and print-ready output

## When not to use this skill

Route elsewhere when:

- the user wants only a talk outline or speaking notes, not an editable deck
- the job is generic browser automation without deck authoring
- the user needs video production instead of slide production
