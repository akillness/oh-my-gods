---
name: responsive-design
description: >
  Plan and fix responsive layouts for modern web apps: mobile-first structure,
  breakpoint strategy, flexbox or grid choices, container queries, fluid type,
  and responsive media. Use when building or repairing layouts across phones,
  tablets, desktops, or embedded panels, even if the user says overflow,
  breakpoint bug, card collapse, or viewport issue. Triggers on: responsive
  layout, mobile-first, breakpoint, container query, horizontal scroll,
  viewport, fluid type, srcset, adaptive grid.
allowed-tools: Read Write Edit Grep Glob
metadata:
  tags: responsive, mobile-first, CSS, flexbox, grid, container-query, viewport
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Responsive Design

Responsive design work is mainly about matching layout, media, and interaction
behavior to the content and container that own them. Keep the entrypoint
focused on diagnosing the failure mode, choosing the smallest responsive
pattern that fixes it, and pulling references only when concrete CSS or
browser checks are needed.

## When to use this skill

- Build or refactor layouts that must work across phone, tablet, desktop, and
  wide-screen contexts
- Remove overflow, breakpoint thrash, fixed-width shells, or cramped card and
  form layouts
- Choose between flexbox, grid, container queries, fluid spacing, and fluid
  type
- Make images, tables, dashboards, and navigation adapt without duplicating
  markup
- Verify responsive behavior in a running app after layout edits

Prefer a narrower sibling skill when the main job is not responsive layout
strategy:

- `ui-component-patterns` for reusable component API design
- `design-system` for tokens, theming, and visual language
- `web-accessibility` when the main issue is WCAG or assistive-technology
  behavior
- `performance-optimization` when media delivery or rendering cost is the
  primary bottleneck
- `playwriter` when browser or runtime validation is required

## Instructions

### Step 1: Classify the responsive problem before editing

Sort the request into one or two primary lanes:

- layout structure: stack, wrap, sidebar collapse, grid density, dashboard
  regions
- component behavior: navigation, tables, forms, cards, tabs, drawers, modal
  content
- media or typography: image sizing, hero crops, fluid type, readable line
  length
- verification or debugging: overflow, clipped content, tap-target crowding,
  viewport mismatch

Ground the request with the failing widths, affected content, and whether the
problem is viewport-driven or container-driven. Do not start by scattering new
breakpoints through the stylesheet.

### Step 2: Choose a content-driven strategy

Use these defaults unless the app proves otherwise:

- mobile-first base styles, then `min-width` rules when the layout meaning
  changes
- `max-width`, `%`, `minmax()`, `auto-fit`, `auto-fill`, `clamp()`, and `rem`
  before hard widths
- content-driven breakpoints; treat `640`, `768`, `1024`, and `1280` as
  starting points, not laws
- default styles for shared rules, breakpoint blocks only for differences
- container queries when a reusable component changes with its parent width,
  not the whole viewport

### Step 3: Pick the smallest layout primitive that fits

Choose the lightest layout tool that solves the real problem:

- flexbox for one-dimensional alignment, wrapping, nav rows, button groups,
  and card rails
- grid for two-dimensional page shells, dashboards, galleries, and form
  columns
- container queries for components that live in multiple shells or sidebars
- simple block flow plus width constraints when no advanced layout system is
  needed

Load `references/layout-and-breakpoint-strategy.md` when the user needs exact
CSS patterns, breakpoint heuristics, or grid-vs-flex guidance.

### Step 4: Handle media, type, and dense content explicitly

Before calling a layout responsive, check:

- images: `srcset`, `sizes`, `picture`, `aspect-ratio`, and `object-fit`
- typography: `clamp()`, line length, and spacing that scales with type
- dense surfaces: tables, filters, forms, and charts need an explicit
  narrow-screen plan
- touch behavior: viewport meta tag, sticky controls, and reachable primary
  actions

Load `references/media-typography-and-density.md` when the request is mainly
about images, fluid type, forms, or cramped content.

### Step 5: Verify behavior in the browser, not only in CSS diff

Validate the edited layout at the key failing widths:

- no unintended horizontal scrolling
- navigation and primary actions remain reachable
- text and controls stay readable without pinch-zoom hacks
- media, cards, and tables preserve intended hierarchy
- keyboard and focus behavior still work after layout shifts

Use `playwriter` for browser or runtime verification when a live app needs
checking instead of relying on headless browser assumptions. Load
`references/testing-and-common-failures.md` for checklists and remediation
patterns.

## Examples

### Example 1: Replace a fixed-width landing page shell

Input:

```text
Our marketing page still uses a 1200px wrapper and the hero explodes on phones.
How should I make the layout responsive without cloning the page for mobile?
```

Expected shape:

- identifies this as a layout-structure plus media-sizing problem
- switches the page to mobile-first constraints instead of separate markup
- uses width constraints, grid or flex decisions, and responsive media checks

### Example 2: Decide between grid and container queries

Input:

```text
The same analytics card appears full-width on mobile, in a two-column dashboard
on desktop, and inside a narrow sidebar in admin. Should I use more viewport
breakpoints or container queries?
```

Expected shape:

- distinguishes viewport-driven shell changes from component-level resizing
- recommends container queries for the reusable card if the parent width is the
  real driver
- keeps global breakpoints limited to true page-layout changes

### Example 3: Validate a live responsive bug

Input:

```text
The app still has horizontal scrolling around 390px wide and the mobile nav is
hard to reach. How should I verify and fix it?
```

Expected shape:

- starts from concrete overflow and interaction checks at the failing width
- uses browser verification rather than CSS theory alone
- pulls in common-failure guidance and mentions `playwriter` when a live app is
  involved

## Best practices

- Treat breakpoints as content decisions, not a preset checklist
- Prefer progressive enhancement over separate mobile and desktop markup
- Use flexbox for one dimension, grid for two dimensions, and container
  queries for reusable embedded components
- Make media, tables, and forms part of the responsive plan, not afterthoughts
- Verify in a real browser at the widths that actually fail
- Keep concrete CSS recipes in references so the entrypoint stays compact and
  triggerable

## References

- `references/layout-and-breakpoint-strategy.md`
- `references/media-typography-and-density.md`
- `references/testing-and-common-failures.md`
- [MDN Responsive design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)
- [MDN CSS container queries](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_containment/Container_queries)
- [web.dev Responsive images](https://web.dev/learn/images/responsive-images/)
