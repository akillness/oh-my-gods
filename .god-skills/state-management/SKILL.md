---
name: state-management
description: >
  Choose and structure state management for frontend applications. Use when the
  user needs to decide between local component state, React Context, Zustand,
  Redux Toolkit, TanStack Query, or form-state tools; when props drilling or
  duplicated client/server state is causing complexity; or when reviewing a
  store design for over-globalization, stale derived state, or synchronization
  bugs. Triggers on: global state, props drilling, Redux vs Zustand, React
  Context, TanStack Query, client state, server state, form state, store
  design.
allowed-tools: Read Write Edit Grep Glob
metadata:
  tags: state-management, React, Redux, Context, Zustand, TanStack-Query, frontend
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# State Management

State management is mainly a boundary-choice problem. Keep the entrypoint
focused on separating local, shared client, server, form, and URL state, then
load the support files only when the user needs concrete library patterns.

## When to use this skill

- Choose between `useState`, Context, Zustand, Redux Toolkit, or a server-state
  library for a frontend workflow
- Fix props drilling, duplicated state, or a store that keeps growing without
  clear ownership
- Review persistence, hydration, or subscription patterns for correctness and
  performance
- Separate fetched API data from client-owned UI state and draft form state
- Introduce state management to an app that has outgrown local-only patterns

Prefer a narrower sibling skill when the request is not primarily a
state-ownership problem:

- `ui-component-patterns` for component composition and prop interface design
- `react-best-practices` for broader React performance and rendering guidance
- `backend-testing` when the main gap is test coverage for reducers, stores, or
  async state flows
- `authentication-setup` when auth protocols or token lifecycle are the core
  concern rather than store structure

## Instructions

### Step 1: Triage the state classes before picking a library

Separate the problem first:

- local UI state: toggles, inline forms, transient component state
- shared client state: theme, cart, auth session shell, feature flags, wizard
  progress
- server state: fetched data, caching, background refetch, optimistic updates
- form state: draft inputs, validation, dirty tracking, submission lifecycle
- URL or navigation state: filters, tabs, route-driven selection

If these categories are mixed together in the request, untangle them before
recommending a tool.

### Step 2: Choose the smallest viable state surface

Start small and escalate only when the workflow truly needs more structure:

- local component state for single-owner UI state
- React Context for low-frequency shared values and simple app shells
- Zustand for medium-complexity shared client state with lightweight store
  ergonomics
- Redux Toolkit for large apps that need explicit events, middleware, async
  workflows, or team-wide conventions
- TanStack Query or another server-state tool for API caching, invalidation,
  and background freshness
- React Hook Form plus a schema validator when form lifecycle is the real
  problem

Do not default to one global store for fetched data, form drafts, and UI
toggles all at once.

### Step 3: Keep ownership and boundaries explicit

Before calling the design done:

- keep one source of truth for each piece of data
- derive totals, counts, and booleans instead of storing them redundantly
- avoid copying server responses into client stores unless there is a clear
  offline or workflow reason
- keep actions narrow and named by domain behavior, not vague `setData` style
  verbs
- persist only intentional state such as cart contents or user preferences

### Step 4: Review correctness, performance, and persistence

Check the design against the common failure modes:

- selective subscription instead of subscribing broad components to the entire
  store
- immutable updates and predictable reset behavior
- clear hydration boundaries for SSR or persisted state
- optimistic updates only when rollback or invalidation is defined
- avoid giant providers or a single catch-all store that owns unrelated
  domains

### Step 5: Pull support files only when they add leverage

Load only the smallest reference that matches the request:

- `references/state-selection-matrix.md` for choosing the right state surface
- `references/context-and-zustand-patterns.md` for shared client-state
  structure and store examples
- `references/redux-server-and-form-patterns.md` for Redux Toolkit, server
  state, form-state boundaries, and review checklists

## Examples

### Example 1: Props drilling and app shell state

Input:

```text
We pass auth, theme, and locale through six levels of components. Should we use
Context, Zustand, or Redux?
```

Expected shape:

- separates shared shell state from other state classes first
- chooses Context or a lightweight store before jumping to Redux by default
- explains when Redux would only be justified if broader workflow complexity
  exists

### Example 2: Server data in the wrong store

Input:

```text
Our dashboard keeps API responses, loading flags, and retries in Redux for
every page. Is that still the right approach?
```

Expected shape:

- identifies this as largely server-state management
- recommends a server-state tool or clearer separation rather than stuffing
  everything into one client store
- calls out invalidation, freshness, and optimistic update concerns

### Example 3: Mixed checkout state

Input:

```text
We have a checkout flow with cart state, shipping form drafts, promo-code API
calls, and URL-driven steps. How should we structure it?
```

Expected shape:

- splits cart, form, server, and URL state into different ownership lanes
- avoids recommending one store for every concern
- names the smallest tools or patterns needed for each lane

## Best practices

- Pick the state class before the library
- Default to the smallest viable state surface
- Keep server data out of client-owned global stores unless there is a clear
  reason
- Derive values whenever possible instead of storing duplicates
- Persist only user-owned state that must survive reloads
- Keep detailed examples in references so the entrypoint stays compact and
  triggerable

## References

- `references/state-selection-matrix.md`
- `references/context-and-zustand-patterns.md`
- `references/redux-server-and-form-patterns.md`
