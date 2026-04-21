# Vercel Guideline Categories

Use this reference to organize the fetched Vercel Web Interface Guidelines into
stable audit buckets. Do not treat it as a substitute for the live upstream
command; fetch the latest command first, then use these categories to structure
review output.

## Layout And Hierarchy

- semantic page structure
- heading order
- CTA prominence
- safe areas and overflow behavior

## Accessibility Basics

- labels and alt text
- semantic elements before ARIA
- keyboard reachability
- `aria-live` for async updates

## Focus And Interaction States

- visible focus treatment
- hover and active state clarity
- no `outline-none` without replacement
- touch and tap affordances

## Forms And Content Handling

- correct input types and autocomplete
- inline error clarity
- no blocked paste
- long-content handling, truncation, and empty states

## Motion And Responsiveness Basics

- reduced-motion handling
- compositor-friendly animation
- mobile overflow and container behavior
- layout resilience without JS measurement

## Performance Signals

- image sizing and above-fold priority
- large-list rendering strategy
- expensive layout reads in render paths
- font and connection hints where relevant

## Navigation And State Reflection

- URL reflects filters, tabs, pagination, or expanded state when appropriate
- destructive actions require confirmation or undo
- links stay links instead of being replaced with click-only containers
