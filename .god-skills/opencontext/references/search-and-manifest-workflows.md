# Search And Manifest Workflows

Use this reference when the user needs retrieval, manifests, embeddings, or
search troubleshooting.

## Start with the cheap path

Use keyword search or a manifest before recommending embeddings work:

```bash
oc search "your query" --mode keyword --format json
oc context manifest project-a --limit 10
```

This keeps the first retrieval pass deterministic and avoids unnecessary setup.

## Search modes

- `--mode keyword`: no embeddings required
- `--mode vector`: embeddings plus built index required
- `--mode hybrid`: embeddings plus built index required

The OpenContext usage guide explicitly recommends keyword search or manifests
first, then embeddings configuration only when richer retrieval is worth it.

## Embeddings setup

When the user genuinely needs vector or hybrid search:

```bash
oc config set EMBEDDING_API_KEY "<your_key>"
oc config set EMBEDDING_API_BASE "https://api.openai.com/v1"
oc config set EMBEDDING_MODEL "text-embedding-3-small"
oc index build
```

Important operating rule:

- do not auto-run `oc index build` by default when the environment may incur
  paid API usage
- confirm that the user wants semantic retrieval and has configured a provider
  first

## Local embedding providers

The docs note that OpenContext can use any OpenAI-compatible embeddings
endpoint. LM Studio is a valid local option when the user wants local
embeddings instead of a paid hosted API.

## Troubleshooting order

1. Confirm the query and folder scope
2. Confirm keyword search works
3. Confirm the storage paths are what the user expects
4. Confirm embeddings config only if vector or hybrid search is required
5. Confirm the index was built after embeddings were configured

## Verification

- Retrieval success means an actual search or manifest returned useful docs
- Hybrid-search success means vector or hybrid mode now returns results without
  regressing the keyword fallback

## Sources

- https://0xranx.github.io/OpenContext/en/usage/
