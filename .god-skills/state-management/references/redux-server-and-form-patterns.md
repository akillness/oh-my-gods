# Redux, Server State, and Form-State Patterns

Use this reference when the request has outgrown simple shared client state or
when server and form concerns are being mixed into the wrong layer.

## Redux Toolkit for event-heavy client workflows

Redux Toolkit is justified when explicit domain events, middleware, async
workflows, or team-level consistency matter more than minimal boilerplate.

Good fits:

- many interacting client-state domains
- middleware or audit-friendly event flow
- complicated async workflows that benefit from explicit transitions
- teams that already standardize on reducer-first architecture

Example shape:

```tsx
import { createSlice, PayloadAction } from '@reduxjs/toolkit';

interface Todo {
  id: string;
  text: string;
  completed: boolean;
}

interface TodosState {
  items: Todo[];
  status: 'idle' | 'loading' | 'failed';
}

const initialState: TodosState = {
  items: [],
  status: 'idle',
};

const todosSlice = createSlice({
  name: 'todos',
  initialState,
  reducers: {
    addTodo: (state, action: PayloadAction<string>) => {
      state.items.push({
        id: Date.now().toString(),
        text: action.payload,
        completed: false,
      });
    },
    toggleTodo: (state, action: PayloadAction<string>) => {
      const todo = state.items.find((item) => item.id === action.payload);
      if (todo) todo.completed = !todo.completed;
    },
  },
});
```

Review checklist:

- actions are domain-specific and named by behavior
- reducers own client data, not arbitrary copies of API payloads
- derived totals and booleans are computed, not duplicated in state

## Server state belongs in a cache-aware tool

Fetched API data usually belongs in TanStack Query or another cache-aware
server-state layer, not in a general client-state store.

Example shape:

```tsx
import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';

function UserProfile({ userId }: { userId: string }) {
  const queryClient = useQueryClient();

  const userQuery = useQuery({
    queryKey: ['user', userId],
    queryFn: async () => {
      const response = await fetch(`/api/users/${userId}`);
      return response.json();
    },
    staleTime: 5 * 60 * 1000,
  });

  const updateUser = useMutation({
    mutationFn: async (patch: Record<string, unknown>) => {
      const response = await fetch(`/api/users/${userId}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(patch),
      });
      return response.json();
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['user', userId] });
    },
  });

  if (userQuery.isLoading) return <div>Loading...</div>;
  if (userQuery.error) return <div>Failed to load.</div>;

  return (
    <button onClick={() => updateUser.mutate({ name: 'New Name' })}>
      Update Name
    </button>
  );
}
```

Review checklist:

- query key ownership is clear
- invalidation or optimistic rollback exists for mutations
- client stores do not become shadow copies of the query cache

## Form state is its own concern

When the real pain is draft lifecycle, validation, and submission, use a
form-state tool instead of a global store.

Good fits:

- complex validation rules
- dirty and touched tracking
- multi-step drafts
- submission state and field-level errors

Recommended baseline:

- React Hook Form for form lifecycle
- Zod or another schema validator for validation
- separate client store only if the draft must persist across routes or
  sessions

## Hybrid design pattern

Many real apps need a split design:

- cart or workflow draft in Zustand
- API-backed pricing, coupons, or inventory in TanStack Query
- form input lifecycle in React Hook Form
- route step in the URL

That split is usually healthier than one mega-store.
