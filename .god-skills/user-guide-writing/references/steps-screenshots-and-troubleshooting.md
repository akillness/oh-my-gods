# Steps, Screenshots, and Troubleshooting

Use this reference when the article needs a cleaner task flow, UI callouts, or
recovery guidance.

## Recommended structure

1. short purpose statement
2. prerequisites or before-you-start section
3. numbered steps in action order
4. screenshot placeholders only where the UI is hard to locate or easy to misread
5. success check
6. troubleshooting or FAQ for the most likely blockers
7. related docs or support escalation path

## Screenshot placeholder guidance

Use placeholders when the image is needed but not yet captured:

- `[Screenshot: Billing page showing Export button]`
- `[Screenshot: Modal confirming invoice export request]`

Placeholders should describe what the user needs to notice, not just the page
name.

## Step-writing rules

- start each step with the action the user takes
- use product UI labels exactly as they appear
- keep each step scoped to one action or confirmation
- avoid mixing implementation details with user actions

## Troubleshooting rules

Only include likely issues that materially block completion, such as:

- missing permissions
- button or menu item not visible
- background job or email confirmation taking longer than expected
- validation or access errors the user can recover from

If recovery depends on engineering changes or admin-only backend actions, note
the escalation path instead of guessing hidden implementation details.
