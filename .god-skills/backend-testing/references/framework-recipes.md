# Framework Recipes

Use this file when the main `backend-testing` skill needs concrete setup or
implementation examples.

## Picking the test layer

| Situation | Prefer | Why |
|-----------|--------|-----|
| Pure function, mapper, validator | Unit test | Fastest feedback, no DB or HTTP setup |
| Route handler, service orchestration, repository write path | Integration test | Proves middleware, serialization, and persistence together |
| Login, token refresh, role checks | Auth-focused integration test | Permission bugs usually appear at the boundary |
| Existing flaky regression | Smallest reproducible layer | Locks the bug without overbuilding the suite |

## Node.js recipe: Jest + Supertest

### Install

```bash
npm install --save-dev jest ts-jest @types/jest supertest @types/supertest
```

### Minimal `jest.config.js`

```javascript
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  roots: ['<rootDir>/src'],
  testMatch: ['**/__tests__/**/*.test.ts'],
  collectCoverageFrom: [
    'src/**/*.ts',
    '!src/**/*.d.ts',
    '!src/**/__tests__/**'
  ],
  coverageThreshold: {
    global: {
      branches: 80,
      functions: 80,
      lines: 80,
      statements: 80
    }
  },
  setupFilesAfterEnv: ['<rootDir>/src/__tests__/setup.ts']
};
```

### Isolated setup pattern

```typescript
import { db } from '../database';

beforeEach(async () => {
  await db.migrate.latest();
  await db.seed.run();
});

afterEach(async () => {
  await db.migrate.rollback();
});

afterAll(async () => {
  await db.destroy();
});
```

Use transactions or truncation instead when migrations are too slow for each
test.

### Unit test example

```typescript
import { validatePassword } from '../../utils/password';

describe('validatePassword', () => {
  it('accepts a valid password', () => {
    const result = validatePassword('Password123!');
    expect(result.valid).toBe(true);
    expect(result.errors).toHaveLength(0);
  });

  it('rejects a short password', () => {
    const result = validatePassword('Pass1!');
    expect(result.valid).toBe(false);
    expect(result.errors).toContain('Password must be at least 8 characters');
  });
});
```

### Integration test example

```typescript
import request from 'supertest';
import { app } from '../../app';
import { db } from '../../database';

describe('POST /auth/login', () => {
  beforeEach(async () => {
    await db('users').insert({
      email: 'user@example.com',
      password_hash: '$2b$12$example',
      role: 'user'
    });
  });

  it('returns a token for valid credentials', async () => {
    const response = await request(app)
      .post('/auth/login')
      .send({ email: 'user@example.com', password: 'Password123!' });

    expect(response.status).toBe(200);
    expect(response.body).toEqual(
      expect.objectContaining({
        accessToken: expect.any(String)
      })
    );
  });

  it('rejects invalid credentials', async () => {
    const response = await request(app)
      .post('/auth/login')
      .send({ email: 'user@example.com', password: 'wrong-password' });

    expect(response.status).toBe(401);
  });
});
```

### Package scripts

```json
{
  "scripts": {
    "test": "jest",
    "test:watch": "jest --watch",
    "test:coverage": "jest --coverage",
    "test:auth": "jest src/__tests__/auth"
  }
}
```

## Python recipe: Pytest + FastAPI

### Install

```bash
pip install pytest pytest-asyncio httpx
```

### `pytest.ini`

```ini
[pytest]
asyncio_mode = auto
testpaths = tests
python_files = test_*.py
```

### Fixture pattern

```python
import pytest
from httpx import AsyncClient

from app.main import app
from app.db import get_test_db, reset_test_db


@pytest.fixture(autouse=True)
async def _reset_db():
    await reset_test_db()
    yield
    await reset_test_db()


@pytest.fixture
async def client():
    async with AsyncClient(app=app, base_url="http://test") as ac:
        yield ac
```

### Validation regression example

```python
async def test_create_order_rejects_negative_quantity(client):
    response = await client.post(
        "/orders",
        json={"product_id": "sku-1", "quantity": -1},
    )

    assert response.status_code == 422
```

### Auth example

```python
async def test_admin_route_rejects_non_admin(client, user_token):
    response = await client.get(
        "/admin/reports",
        headers={"Authorization": f"Bearer {user_token}"},
    )

    assert response.status_code == 403
```

## Coverage and isolation checklist

- success case exists
- invalid input case exists
- auth failure case exists when auth matters
- observable side effect is asserted
- DB reset strategy is deterministic
- network and email side effects are mocked or intercepted

## When to add another reference instead of inflating the main skill

Add more support files only if one of these becomes too large:

- framework-specific boilerplate
- database reset patterns
- async or queue testing notes
- auth and token recipes
