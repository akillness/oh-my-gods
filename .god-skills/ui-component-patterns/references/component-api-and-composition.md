# Component API and Composition Patterns

Use this reference when the request is mainly about shaping a reusable
component API.

## Start with the component job

Choose the smallest fitting public surface:

| Shape | Good fits | Default pattern | Escalate when |
|---|---|---|---|
| Primitive | button, badge, input, icon button | plain props plus native attributes | subparts or coordinated state appear |
| Composite | card, empty state, panel, modal shell | slots or explicit child props | consumers need structural freedom |
| Coordinated widget | accordion, tabs, menu, dialog | compound components or headless logic | consumers need custom markup or state ownership |
| Headless behavior | combobox logic, selection model, disclosure state | hook or render prop | a visual wrapper can no longer stay generic |

Avoid solving every component with the same abstraction. A primitive button
and a compound accordion do not need the same public API shape.

## Prop API review checklist

Before adding another prop, check:

- is this truly user intent, or just an implementation toggle
- can multiple booleans collapse into a `variant`, `size`, or `tone` enum
- does the component need `children`, named slots, or both
- should the primitive inherit native attributes from the underlying element
- will consumers need a `ref`
- are styling hooks explicit with `className`, slot props, or data attributes

Example shape:

```tsx
import { forwardRef } from 'react';

interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'ghost';
  size?: 'sm' | 'md' | 'lg';
  isLoading?: boolean;
  leadingIcon?: React.ReactNode;
}

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  (
    {
      variant = 'primary',
      size = 'md',
      isLoading = false,
      leadingIcon,
      children,
      className,
      disabled,
      ...rest
    },
    ref
  ) => {
    return (
      <button
        ref={ref}
        data-variant={variant}
        data-size={size}
        className={className}
        disabled={disabled || isLoading}
        {...rest}
      >
        {leadingIcon}
        {isLoading ? 'Loading...' : children}
      </button>
    );
  }
);
```

## When slots or compound components are healthier

Use slots or compound components when:

- the component has named regions such as header, body, footer, or trigger
- state is shared across subparts
- the consumer should compose structure without reimplementing widget logic

Good fit:

```tsx
<Card>
  <Card.Header />
  <Card.Body />
  <Card.Footer />
</Card>
```

Better than:

```tsx
<Card header="..." footerActions={[...]} bodyPadding="lg" />
```

Compound components are especially strong for tabs, accordions, menus, and
other coordinated widgets with a clear parent-child relationship.

## API anti-patterns

- too many booleans that represent one enum
- one component doing fetch, view logic, and rendering all at once
- `as` support added before the semantic need exists
- unrelated domains merged into one mega-component
- styling hidden behind undocumented prop combinations

## File structure suggestion

Keep the reusable unit discoverable:

```text
ComponentName/
  ComponentName.tsx
  ComponentName.test.tsx
  ComponentName.stories.tsx
  index.ts
```

Split subparts or hooks into their own files only when the public surface or
complexity actually benefits.
