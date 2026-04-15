# State Selection Matrix

Use this reference when the user mainly needs help choosing the right state
surface.

## Start with ownership, not tooling

Map each concern to one of these buckets before naming a library:

| State class | Typical examples | Default surface | Escalate when |
|---|---|---|---|
| Local UI state | modal open, tab, inline draft, accordion | `useState` or `useReducer` | state spans siblings or needs domain events |
| Shared client state | theme, auth shell, cart, wizard progress | Context or Zustand | many domains, middleware, or complex workflows appear |
| Server state | fetched lists, cache freshness, retries, invalidation | TanStack Query or equivalent | only escalate to Redux if client workflow truly depends on event orchestration |
| Form state | validation, dirty fields, multi-step draft, submit lifecycle | React Hook Form plus schema validation | custom workflow or offline draft storage justifies more |
| URL state | filters, current tab, selected entity, sort order | router or URL search params | only mirror locally when the route cannot own it cleanly |

## Tool-choice heuristics

### React local state

Use for:

- single-component ownership
- temporary UI state
- straightforward reducer-style event handling inside one subtree

Avoid promoting local state just because a component is large. Size alone does
not justify a global store.

### React Context

Use for:

- low-frequency shared values
- app shell concerns such as theme, locale, auth session shell, or feature
  flags
- dependency injection style access to a stable domain API

Avoid for:

- high-frequency updates across large trees without memoized boundaries
- huge mutable objects passed through one provider

### Zustand

Use for:

- medium-complexity shared client state
- domains such as cart, editor preferences, or draft workflow state
- teams that want a lightweight store without Redux ceremony

Avoid for:

- treating it as a dumping ground for fetched API data and forms
- selecting the entire store in broad components

### Redux Toolkit

Use for:

- large applications with many domains and contributors
- explicit event history, middleware, async workflows, or strong architectural
  conventions
- cases where reducers, thunks, and predictable event flow add clarity

Avoid for:

- small apps that only need a theme toggle or a cart
- requests that are actually about server caching or forms

### TanStack Query or similar

Use for:

- API caching and revalidation
- background refetch and freshness management
- optimistic mutations with invalidation or rollback

Avoid replacing every client state need with a query library. Query tools do
not replace draft form state or purely local UI state.

## Common anti-patterns

- storing derived values such as totals or counts instead of deriving them
- duplicating the same entity in both query cache and client store without a
  workflow reason
- moving route state into a store even though the URL is already the source of
  truth
- persisting ephemeral toggles that do not need to survive reloads
- recommending Redux first because it is familiar
