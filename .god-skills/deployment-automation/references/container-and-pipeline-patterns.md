# Container And Pipeline Patterns

Use this reference when the request needs concrete container or CI/CD
implementation details.

## Docker packaging baseline

Reach for a container lane when the team needs one reviewable build artifact
that can run the same way in local, staging, and production environments.

### Node service example

```dockerfile
FROM node:20-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

FROM node:20-alpine AS build
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

FROM node:20-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY package*.json ./
COPY --from=deps /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist
USER node
EXPOSE 3000
CMD ["node", "dist/index.js"]
```

### `.dockerignore` baseline

```text
node_modules
.git
.env
.env.local
coverage
dist
build
```

## GitHub Actions pipeline baseline

Use one build path for the artifact, then separate publish and deploy.

```yaml
name: deploy

on:
  push:
    branches: [main]
  pull_request:

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm
      - run: npm ci
      - run: npm test

  build:
    needs: test
    if: github.event_name == 'push'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: docker/setup-buildx-action@v3
      - uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}
      - uses: docker/build-push-action@v6
        with:
          context: .
          push: true
          tags: |
            ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ github.sha }}
            ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:main

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Deploy
        run: ./scripts/deploy.sh ${{ github.sha }}
```

## Tagging and promotion rules

- use immutable tags such as commit SHA or release version as the deploy input
- keep mutable tags like `main` or `latest` as convenience aliases only
- deploy the same artifact that passed tests; avoid rebuilding in deploy steps
- store environment-specific secrets in the platform secret manager or GitHub
  Actions environments, not inline YAML

## When a script is justified

Add a deployment script only when it encodes a repeatable release action that
would otherwise be easy to get wrong:

- image promotion with fixed flags
- rollout verification with clear failure exit codes
- multi-step but deterministic post-deploy checks

Do not add a script just to wrap one or two obvious commands.
