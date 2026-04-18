---
name: presentation-builder
description: >
  Build real presentation artifacts when the user needs an editable deck rather
  than just an outline: investor decks, roadmap reviews, launch decks,
  architecture/demo decks, and workshop decks. Use when the workflow needs
  slide planning, visual iteration, and export or handoff to PPTX/PDF after
  approval. Triggers on: slide deck, presentation, pitch deck, launch deck,
  roadmap deck, investor deck, architecture review deck, demo deck, workshop
  slides, keynote, presentation builder.
allowed-tools: Bash Read Write Grep Glob WebFetch
metadata:
  tags: presentation, slides-grab, pptx, pdf, html-slides, slide-editor, storytelling
  platforms: Claude, ChatGPT, Gemini, Codex
---

# Presentation Builder

Use `slides-grab` when the user needs a real slide deck artifact, not just an outline. The workflow is HTML-first: plan the deck, generate slide HTML, review visually, then export to PPTX/PDF.

## When to use this skill

- Create a presentation from a topic, document, or brief
- Iterate on slide design visually instead of editing raw PPT manually
- Export approved decks to `.pptx` or `.pdf`
- Maintain multi-deck workspaces under `decks/<deck-name>/`
- Revise an existing deck while keeping a stable HTML workspace

## Instructions

### Step 1: Confirm the artifact and stage order

Use `presentation-builder` only when the user needs a real deck artifact.
Route outline-only or notes-only requests elsewhere.

Lock the stage order before doing work:

1. Plan
2. Design
3. Review
4. Export

Do not skip directly to export.

### Step 2: Preflight the toolchain

Install and verify `slides-grab` before authoring:

```bash
git clone https://github.com/vkehfdl1/slides-grab.git
cd slides-grab
npm ci
npx playwright install chromium
npm exec -- slides-grab --help
```

Minimum requirement: `Node.js >= 18`.

If `slides-grab` is already available in the current project, reuse the existing install instead of cloning again.

Load `references/slides-grab-workflow.md` when the user needs the npm install
path, asset contract, or export caveats.

### Step 3: Plan the deck

Collect:

- presentation goal
- audience
- tone/style
- target slide count
- required source material

Create a concise outline, usually `slide-outline.md`, with:

- slide number
- slide title
- key message
- required visuals/data

Do not move to slide generation until the outline is approved when the user
wants a full deck workflow.

### Step 4: Generate slide HTML

Use a dedicated workspace such as `decks/<deck-name>/`.

Create self-contained slide files:

```text
decks/<deck-name>/
  slide-01-cover.html
  slide-02-problem.html
  slide-03-solution.html
  ...
```

Rules:

- one primary idea per slide
- keep HTML/CSS easy for agents to edit
- inline only the assets/styles the deck actually needs
- keep speaker notes or rationale outside slide body when possible

Saved slides should reference local media under `decks/<deck-name>/assets/`
instead of remote URLs or absolute filesystem paths.

### Step 5: Build and review

After generating or editing slides:

```bash
slides-grab build-viewer --slides-dir decks/<deck-name>
slides-grab validate --slides-dir decks/<deck-name>
```

For visual iteration:

```bash
slides-grab edit --slides-dir decks/<deck-name>
```

Use the editor to select a region, request changes, and revise the corresponding HTML until the deck is approved.

### Step 6: Export artifacts

Only export after the design is approved.

```bash
slides-grab convert --slides-dir decks/<deck-name> --output decks/<deck-name>.pptx
slides-grab pdf --slides-dir decks/<deck-name> --output decks/<deck-name>.pdf
```

Report:

- output file paths
- validation status
- any slides that still need manual polish

Treat PPTX export as best-effort output and fix source HTML/CSS when conversion
or layout quality fails. Do not patch exported binaries.

## Examples

### Example 1: Investor deck

```text
Turn this product brief into a 10-slide investor deck.
Use slides-grab, show me the outline first, then generate the deck in
decks/series-a.
```

Expected behavior:

- outline before slide generation
- stable `decks/series-a/` workspace
- review before export
- PPTX/PDF export only after approval

### Example 2: Enterprise launch deck

```text
Create an 8-slide enterprise product deck in decks/acme-launch.
Audience: IT buyers.
Tone: confident, clean, technical.
Need PPTX and PDF exports after approval.
```

Expected behavior:

- plan the deck structure
- generate `slide-*.html` files
- run validation and browser review
- report artifact paths after export

### Example 3: Revise an existing deck

```text
Update decks/q2-review visuals, validate the deck, let me review it in the
browser editor, then re-export PDF and PPTX.
```

Expected behavior:

- reuse the existing deck workspace
- fix HTML/CSS or local assets first
- validate before export
- treat PPTX as best-effort if layout drift remains

## Best practices

1. Keep the entrypoint focused on route selection and stage order; load the
   reference file only when install or asset detail is needed.
2. Reuse the same deck directory through revisions to preserve stable
   iteration history.
3. Validate decks before export so missing assets or broken HTML fail early.
4. Prefer local deck assets and keep remote media out of saved slide HTML.
5. Treat PPTX and Figma export as best-effort handoff formats, not the source
   of truth.

## References

- slides-grab repo: `https://github.com/vkehfdl1/slides-grab`
- Repo-local reference: `references/slides-grab-workflow.md`
- Upstream workflow: `Plan -> Design -> Edit -> Export`
