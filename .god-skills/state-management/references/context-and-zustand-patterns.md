# Context and Zustand Patterns

Use this reference when the user already knows the problem is shared
client-owned state and needs concrete structure.

## Context for stable shared app shell state

Context works best when the shared value is conceptually global but does not
change at high frequency.

Good fits:

- theme and color mode
- locale and formatting preferences
- authenticated user shell information
- feature flags or app-level configuration

Example shape:

```tsx
import { createContext, useContext, useState, ReactNode } from 'react';

type Theme = 'light' | 'dark';

interface ThemeContextValue {
  theme: Theme;
  setTheme: (theme: Theme) => void;
}

const ThemeContext = createContext<ThemeContextValue | null>(null);

export function ThemeProvider({ children }: { children: ReactNode }) {
  const [theme, setTheme] = useState<Theme>('light');
  return (
    <ThemeContext.Provider value={{ theme, setTheme }}>
      {children}
    </ThemeContext.Provider>
  );
}

export function useTheme() {
  const value = useContext(ThemeContext);
  if (!value) throw new Error('useTheme must be used within ThemeProvider');
  return value;
}
```

Review checklist:

- provider value is not rebuilt with unrelated data on every render
- domain stays narrow instead of becoming an app-wide junk drawer
- consumers read only the values they actually need

## Zustand for medium-complexity client workflows

Zustand is a good default when shared state needs a dedicated domain store but
Redux would be disproportionate.

Good fits:

- shopping cart
- editor preferences
- multi-step draft workflow state
- lightweight client-side collaboration or selection state

Example shape:

```tsx
import { create } from 'zustand';
import { persist } from 'zustand/middleware';

interface CartItem {
  id: string;
  name: string;
  price: number;
  quantity: number;
}

interface CartStore {
  items: CartItem[];
  addItem: (item: Omit<CartItem, 'quantity'>) => void;
  removeItem: (id: string) => void;
  clearCart: () => void;
}

export const useCartStore = create<CartStore>()(
  persist(
    (set) => ({
      items: [],
      addItem: (item) =>
        set((state) => {
          const existing = state.items.find((entry) => entry.id === item.id);
          if (!existing) {
            return { items: [...state.items, { ...item, quantity: 1 }] };
          }
          return {
            items: state.items.map((entry) =>
              entry.id === item.id
                ? { ...entry, quantity: entry.quantity + 1 }
                : entry
            ),
          };
        }),
      removeItem: (id) =>
        set((state) => ({ items: state.items.filter((entry) => entry.id !== id) })),
      clearCart: () => set({ items: [] }),
    }),
    { name: 'cart-store' }
  )
);
```

Usage pattern:

```tsx
const items = useCartStore((state) => state.items);
const addItem = useCartStore((state) => state.addItem);
```

Review checklist:

- subscribe with narrow selectors instead of grabbing the full store
- persist only durable user-owned state
- avoid copying query cache results into the store
- split unrelated domains into separate stores when the store starts sprawling
