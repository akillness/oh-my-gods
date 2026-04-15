# Layout and Breakpoint Strategy

Use this reference when the user needs concrete layout patterns or help
choosing breakpoints.

## Start with content, not a breakpoint spreadsheet

Responsive fixes work best when the breakpoint follows the content failure:

- text lines become unreadably long
- cards become too narrow to preserve hierarchy
- navigation or filters stop fitting
- a sidebar and content region can no longer coexist

Treat common widths such as `640`, `768`, `1024`, and `1280` as useful probes,
not mandatory targets.

## Mobile-first shell example

```css
.page {
  padding-inline: 1rem;
}

.content {
  width: min(100%, 72rem);
  margin-inline: auto;
}

.hero-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.5rem;
}

@media (min-width: 64rem) {
  .hero-grid {
    grid-template-columns: minmax(0, 1.2fr) minmax(18rem, 0.8fr);
    align-items: center;
  }
}
```

Use base styles for the narrowest layout, then add `min-width` rules only
where structure truly changes.

## Flexbox vs grid

Use flexbox when the job is mainly one-dimensional:

- nav bars
- toolbars
- button groups
- wrapped card rails

Use grid when the job is two-dimensional:

- dashboard shells
- marketing hero splits
- gallery layouts
- multi-column forms

### Flex wrap example

```css
.actions {
  display: flex;
  flex-wrap: wrap;
  gap: 0.75rem;
}

.actions > * {
  flex: 1 1 12rem;
}
```

### Grid example

```css
.cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(16rem, 1fr));
  gap: 1rem;
}
```

## When container queries are the right move

Use container queries when the component changes because its parent narrows,
even if the viewport stays wide.

Good fits:

- cards reused in sidebars and full-width content
- filters inside panels of different widths
- widgets embedded in dashboards and detail pages

```css
.card-shell {
  container-type: inline-size;
}

.metric-card {
  display: grid;
  gap: 0.75rem;
}

@container (min-width: 28rem) {
  .metric-card {
    grid-template-columns: auto 1fr;
    align-items: start;
  }
}
```

## Breakpoint anti-patterns

- desktop-first `max-width` stacks as the default habit
- hard-coding widths like `width: 1200px`
- copying the same declarations into every breakpoint
- global viewport breakpoints for a component problem
- adding a new breakpoint without naming the failure it fixes

## Practical review questions

- What exact content fails first at the narrow width?
- Is the layout problem page-level or component-level?
- Would wrapping or `minmax()` solve this before a new breakpoint?
- Does the component need container awareness instead of viewport awareness?
- Can the shell stay simple if only one region changes?

## References

- https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design
- https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_grid_layout
- https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_flexible_box_layout
- https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_containment/Container_queries
