# Customization and Control Patterns

Use this reference when the user needs help choosing between controlled state,
headless logic, slots, render props, or a polymorphic component surface.

## Controlled vs uncontrolled

Default to the smallest ownership model:

- uncontrolled when the component can safely own transient UI state
- controlled when the parent genuinely needs to orchestrate the state
- dual-mode APIs only when both patterns are realistic and clearly documented

Example dialog API:

```tsx
interface DialogProps {
  open?: boolean;
  defaultOpen?: boolean;
  onOpenChange?: (open: boolean) => void;
}
```

Use a dual-mode API only if:

- ownership is obvious
- uncontrolled behavior has predictable defaults
- controlled mode does not silently fight internal state

## Slots, render props, or headless hooks

Use the lightest pattern that still preserves flexibility:

| Need | Best default |
|---|---|
| fixed structure, named regions | slots or compound components |
| custom row or item rendering | render prop |
| reusable behavior without fixed markup | headless hook |
| library primitive with consumer-chosen semantics | polymorphic `as`, only when needed |

Render props are appropriate when the component still owns the workflow but the
consumer must choose the markup:

```tsx
<List
  items={users}
  renderItem={(user) => <UserRow user={user} />}
/>
```

Headless hooks are better when the library should expose behavior, not layout:

```tsx
function useDisclosure(initialOpen = false) {
  const [open, setOpen] = useState(initialOpen);
  return {
    open,
    onOpen: () => setOpen(true),
    onClose: () => setOpen(false),
    onToggle: () => setOpen((value) => !value),
  };
}
```

## Polymorphic `as` patterns

Use a polymorphic surface when:

- semantic flexibility is central to reuse
- the same style or behavior must apply to different elements
- the team can preserve type safety and accessibility expectations

Avoid `as` when it is just a convenience wrapper for unrelated components.

Example shape:

```tsx
type TextProps<C extends React.ElementType> = {
  as?: C;
  children: React.ReactNode;
} & React.ComponentPropsWithoutRef<C>;
```

If a polymorphic component makes the API harder to reason about than a small
set of explicit primitives, prefer the explicit primitives.

## Container and hook split

When business logic starts leaking into the UI surface:

- move fetching, mutations, analytics, or pricing rules into a hook or parent
  container
- keep the reusable component focused on rendering and interaction contracts
- pass derived view props down instead of raw domain complexity

That split is usually healthier than letting a design-system primitive become a
feature-specific controller.
