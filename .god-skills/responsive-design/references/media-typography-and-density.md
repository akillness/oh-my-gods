# Media, Typography, and Dense Content

Use this reference when the responsive problem is mainly about images,
typography, tables, filters, or forms.

## Responsive images

Serve different image sizes when the viewport or slot size changes:

```html
<img
  src="/hero-960.jpg"
  srcset="/hero-480.jpg 480w, /hero-960.jpg 960w, /hero-1600.jpg 1600w"
  sizes="(max-width: 48rem) 100vw, 50vw"
  alt="Product hero"
/>
```

Use `picture` when the crop itself must change:

```html
<picture>
  <source media="(max-width: 47.99rem)" srcset="/hero-portrait.jpg" />
  <source media="(max-width: 79.99rem)" srcset="/hero-square.jpg" />
  <img src="/hero-landscape.jpg" alt="Product hero" />
</picture>
```

Useful defaults:

- `width: 100%`
- `height: auto`
- `aspect-ratio` when cards should reserve space
- `object-fit: cover` only when intentional cropping is acceptable

## Fluid type and spacing

Use `clamp()` when the text should scale between safe bounds:

```css
:root {
  --step-body: clamp(0.95rem, 0.9rem + 0.2vw, 1.05rem);
  --step-title: clamp(1.8rem, 1.2rem + 2vw, 3.5rem);
  --space-section: clamp(1.5rem, 1rem + 2vw, 4rem);
}
```

Review:

- line length stays readable
- headings do not wrap into awkward ladders
- controls remain easy to tap
- spacing still separates content on dense screens

## Forms, filters, and dense controls

Dense UI needs a deliberate narrow-screen plan:

- collapse multi-column forms to one column early
- let button bars wrap instead of shrinking tap targets
- keep labels visible; do not rely on placeholders
- promote the primary action and defer less important controls

```css
.form-grid {
  display: grid;
  gap: 1rem;
}

@media (min-width: 48rem) {
  .form-grid {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}
```

## Tables and data-heavy surfaces

Pick one clear narrow-screen strategy:

- horizontal scroll for true data tables
- stacked cards for summary views
- hide only non-critical columns, not required meaning

If horizontal scrolling remains, make it explicit and usable:

```css
.table-wrap {
  overflow-x: auto;
}

table {
  min-width: 42rem;
}
```

## Common failure patterns

- giant hero images with no `sizes`
- type that scales up but spacing does not
- filter rows that compress buttons below usable tap size
- tables that overflow because parent padding and `min-width` fight each other
- forms that keep label and input side by side long after they should stack

## References

- https://web.dev/learn/images/responsive-images/
- https://developer.mozilla.org/en-US/docs/Web/HTML/Responsive_images
- https://developer.mozilla.org/en-US/docs/Web/CSS/clamp
- https://developer.mozilla.org/en-US/docs/Web/CSS/aspect-ratio
