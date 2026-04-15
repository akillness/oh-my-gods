# Search Strategy Matrix

Use this reference when the request is mostly about choosing the right search
surface before diving into exact commands.

## Start with the question shape

Map the request to the narrowest search mode that can answer it:

| Request shape | Best first move | Why |
|---|---|---|
| Exact string, error, symbol, env var | ripgrep | Fastest way to ground a known term |
| Conceptual feature or unfamiliar workflow | semantic or symbol search, then ripgrep | Broad discovery before exact narrowing |
| Unknown file location | glob or file listing | Locates candidate files before content search |
| Structural pattern | AST or symbol tools if available | Avoids brittle regex when syntax matters |
| Change-risk analysis | definition plus callsites plus tests | Makes the downstream scope explicit |

## Search-mode heuristics

### Exact search first

Use ripgrep first when you already know:

- an error string
- a function or class name
- an env var, config key, or constant
- a route or path segment

Do not start with fuzzy conceptual search if the user already gave you the
exact token.

### Broad discovery first

Use conceptual search or file discovery first when:

- the user asks how a workflow works end to end
- the codebase is unfamiliar
- naming conventions are unknown
- there are multiple plausible implementations

Then narrow to exact definitions, callsites, or config files.

### Structural search when syntax matters

If the environment provides symbol search, AST search, or language-aware
references, prefer them for:

- function signatures
- decorator or annotation usage
- import graphs
- JSX or template patterns
- code transforms where regex would be noisy

Fallback to ripgrep plus file reads if structural tooling is unavailable.

## Narrowing workflow

1. Identify the smallest reliable starting signal.
2. Find the owning file or directory.
3. Read surrounding context, not just the matching line.
4. Expand to callsites, tests, and neighboring modules.
5. Record the affected surface before recommending changes.

## Common anti-patterns

- jumping to a conclusion from one grep hit
- searching the whole repo repeatedly without narrowing the directory
- skipping tests when they already document the workflow
- using semantic search for an exact error string
- using regex-only search when a symbol or AST tool would be safer
