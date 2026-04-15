# Accessibility and Performance Review

Use this reference when the request is about interactive behavior, rendering
cost, or final component-library review.

## Accessibility checklist for reusable components

Review interactive components in this order:

1. semantic element first
2. keyboard interaction second
3. ARIA only where semantics do not already solve the problem

Check:

- native button, input, dialog, list, or table elements before custom roles
- visible focus treatment
- keyboard support for arrow keys, escape, enter, and space when the widget
  type requires them
- `aria-expanded`, `aria-controls`, `aria-selected`, `aria-disabled`, or
  labeling only when the widget state truly needs them
- focus trap and restore behavior for dialogs and menus

Common failures:

- clickable `div` instead of `button`
- dialog markup without focus handling
- tabs or accordion triggers that cannot be reached by keyboard
- relying on placeholders as labels

## Performance review for component APIs

Treat rendering performance as a measurement problem, not a superstition.

Prefer these first:

- keep transient state close to the component that owns it
- avoid broad parent re-renders caused by unnecessary lifted state
- pass stable, minimal props instead of large mutable objects
- split heavy workflow logic out of reusable primitives

Only then consider memoization tools:

- `React.memo` for components proven to re-render expensively with stable props
- `useMemo` for expensive derived values, not routine object creation
- `useCallback` only when identity stability materially affects child behavior
  or hook dependencies

Do not recommend blanket `useMemo` or `useCallback` by default. Modern React
guidance keeps those as targeted optimizations, and teams using the React
Compiler should be even more selective.

## Review prompts for the final pass

- Is the public API smaller than the implementation behind it
- Does the component expose state ownership clearly
- Can a keyboard-only user operate the widget
- Are styling hooks explicit and documented
- Is memoization solving a measured problem rather than masking a design issue
