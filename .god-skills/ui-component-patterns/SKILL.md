---
name: ui-component-patterns
description: >
  Design reusable UI component APIs and composition patterns for React or
  TypeScript frontends. Use when creating or refactoring components, deciding
  between compound components, slots, render props, polymorphic `as` patterns,
  controlled vs uncontrolled APIs, or reviewing accessibility and performance
  tradeoffs in a component library. Triggers on: component API, design system,
  prop design, slots, headless component, compound component, render prop,
  polymorphic as, controlled vs uncontrolled.
allowed-tools: Read Write Edit Grep Glob
metadata:
  tags: ui-component-patterns, React, component-api, composition, TypeScript, frontend
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# UI Component Patterns

UI component work is mainly an API and composition problem. Keep the entrypoint
focused on choosing the smallest stable public contract, then pull the support
files only when the user needs concrete patterns for slots, headless logic,
accessibility, or performance review.

## When to use this skill

- Design or refactor reusable components in a React or TypeScript codebase
- Review a component API that has too many boolean props, mixed concerns, or
  unclear ownership
- Choose between plain props, slots, compound components, render props,
  headless hooks, or a polymorphic `as` pattern
- Split business logic away from presentational primitives and stateful
  widgets
- Audit accessibility and rendering behavior in a component library or design
  system

Prefer a narrower sibling skill when the request is not mainly about component
API shape:

- `state-management` for store boundaries, shared state, and client/server
  ownership
- `web-accessibility` when the main job is deeper WCAG remediation
- `react-best-practices` for broader React architecture and rendering guidance
- `design-system` when tokens, visual language, and system-wide consistency
  are the primary concern

## Instructions

### Step 1: Classify the component before choosing a pattern

Sort the request into the smallest fitting shape first:

- primitive: button, input, badge, icon wrapper
- composite: card, form section, modal shell, command menu
- coordinated widget: tabs, accordion, dropdown, dialog
- headless behavior: state, keyboard logic, or selection model without fixed
  markup

If the request mixes multiple shapes, separate the reusable primitive from the
workflow-specific container before designing the API.

### Step 2: Choose the smallest reliable composition surface

Start with the least complex pattern that still fits the problem:

- plain props for simple primitives with a stable visual contract
- slots or compound components when subparts need clear structure
- controlled and uncontrolled APIs only when both are legitimate usage modes
- render props or headless hooks when consumers need wide markup freedom
- polymorphic `as` only when semantic flexibility is a real requirement, not a
  default flourish

Do not jump to a headless or polymorphic abstraction when a small component
with explicit props would be clearer.

### Step 3: Design the public API around intent, not implementation noise

Before calling the component reusable:

- prefer domain names over boolean explosions such as `primary`, `secondary`,
  `ghost`, `danger`, `compact`, and `outlined` all at once
- expose variants, size, state, and slot overrides intentionally
- forward refs and pass through native HTML attributes when the primitive needs
  them
- keep styling hooks explicit with `className`, slot props, or data attributes
- move data fetching, pricing logic, and other business rules into hooks or
  parent containers

### Step 4: Review accessibility, state, and rendering behavior

Check the design against the common failure modes:

- semantic elements first, ARIA second
- keyboard, focus, and open/close behavior for interactive widgets
- controlled state only when the consumer truly needs ownership
- localize transient UI state before reaching for shared stores
- measure before adding `React.memo`, `useMemo`, or `useCallback`; do not add
  memoization by default just to look optimized

### Step 5: Pull support files only when they add leverage

Load only the smallest reference that matches the request:

- `references/component-api-and-composition.md` for props, variants, slots,
  and compound component choices
- `references/customization-and-control-patterns.md` for controlled vs
  uncontrolled APIs, render props, headless hooks, and polymorphic patterns
- `references/accessibility-and-performance-review.md` for interactive-widget
  review checklists, accessibility, and rendering guidance

## Examples

### Example 1: Too many button props

Input:

```text
Our Button now has 14 props and half of them are booleans. How should we
redesign the API without breaking reuse?
```

Expected shape:

- identifies the component as a primitive with API sprawl
- reduces boolean clutter into clearer variants, slots, or state props
- keeps the public contract smaller than the current implementation details

### Example 2: Shared accordion and tabs behavior

Input:

```text
We need accessible Tabs and Accordion components for a design system. Should
these be plain props, compound components, or headless hooks?
```

Expected shape:

- treats these as coordinated widgets rather than simple primitives
- compares compound components against headless stateful abstractions
- includes keyboard and focus behavior as part of the API decision

### Example 3: Performance review for a card grid

Input:

```text
Our ProductCard list is full of inline callbacks and memo wrappers. What should
we keep or remove?
```

Expected shape:

- reviews whether memoization is measured and necessary
- prefers stable ownership and narrower state before blanket memoization
- distinguishes real rendering hotspots from cargo-cult optimizations

## Best practices

- Choose the component shape before the abstraction pattern
- Keep public APIs smaller than internal implementation detail
- Prefer composition and slots over endless boolean props
- Separate headless behavior from visual wrappers when reuse demands it
- Treat accessibility and focus behavior as API design, not polish
- Keep concrete recipes in references so the entrypoint stays compact and
  triggerable

## References

- `references/component-api-and-composition.md`
- `references/customization-and-control-patterns.md`
- `references/accessibility-and-performance-review.md`
