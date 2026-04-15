# Testing and Common Failures

Use this reference when the user needs verification steps, browser checks, or
help tracking down a live responsive bug.

## Start with the browser-level basics

Before deeper debugging, confirm:

- the page has
  `<meta name="viewport" content="width=device-width, initial-scale=1.0">`
- the failing width is known
- the overflow or clipping can be reproduced reliably
- the issue is layout, not stale build output or an unrelated JavaScript error

## Minimum verification pass

Check the layout at the actual failing width plus at least one narrower and one
wider width:

- no horizontal scroll unless an explicit table or code block requires it
- nav, search, filters, and primary actions remain reachable
- sticky bars do not cover the next actionable control
- dialogs, drawers, and menus still fit the viewport
- focus outlines and keyboard reachability survive the layout shift

Use `playwriter` when the task requires browser or runtime verification in a
live app. Prefer it over headless-browser assumptions when the app has auth,
client state, or environment-specific behavior.

## Common overflow causes

- a child with `width: 100vw` inside padded content
- unwrapped flex children with long text
- `min-width` fighting a narrow parent
- fixed-position UI that ignores safe viewport space
- media without `max-width: 100%`

## Quick isolation pattern

When the source is unclear:

1. Reproduce at the failing width.
2. Inspect the widest overflowing element.
3. Check whether flex, grid, or fixed width created the overflow.
4. Remove one constraint at a time: `min-width`, fixed width, `white-space`,
   or nowrap behavior.
5. Re-test after each change instead of stacking guesses.

## Practical CSS fixes

```css
img,
video,
canvas,
svg {
  max-width: 100%;
  height: auto;
}

.layout-shell {
  min-width: 0;
}

.overflowing-flex-child {
  min-width: 0;
}
```

That `min-width: 0` fix matters because flex and grid children often refuse to
shrink without it.

## When to escalate to structural changes

Small fixes are not enough when:

- the same component is used in multiple container widths
- the design depends on separate markup for each device size
- navigation or tables have no narrow-screen strategy at all
- global breakpoints are compensating for a reusable component problem

That is the point to revisit container queries, shell layout, or information
priority instead of adding another breakpoint.

## References

- https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design
- https://developer.mozilla.org/en-US/docs/Web/HTML/Viewport_meta_tag
- https://developer.mozilla.org/en-US/docs/Web/CSS/min-width
