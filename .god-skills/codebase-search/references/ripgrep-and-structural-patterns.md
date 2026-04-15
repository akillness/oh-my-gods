# Ripgrep And Structural Patterns

Use this reference when the user needs concrete search patterns rather than the
high-level workflow.

## Exact definition patterns

```bash
# Python
rg -n "def function_name" -tpy
rg -n "class ClassName" -tpy

# JavaScript / TypeScript
rg -n "function functionName" -tjs -tts
rg -n "const functionName\\s*=" -tjs -tts
rg -n "class ClassName" -tjs -tts

# Go
rg -n "func functionName" -tgo

# Java
rg -n "class ClassName|interface InterfaceName" -tjava
```

## Callsites, imports, and config patterns

```bash
# Callsites
rg -n "function_name\\(" src/
rg -n "new ClassName" .

# Imports
rg -n "from .* import .*ModuleName" -tpy
rg -n "import .* from ['\"]module-name['\"]" -tjs -tts

# Config surfaces
rg --files -g '*config*' -g '*.env*' -g '*.toml' -g '*.yaml' -g '*.yml'
rg -n "process\\.env\\.|import\\.meta\\.env\\.|os\\.environ|ENV\\[" .
rg -n "S3|BUCKET|AWS_" .
```

## Useful ripgrep switches

```bash
# Context lines
rg -n -C 4 "pattern" .

# Case-insensitive
rg -n -i "pattern" .

# Multiple file types
rg -n "pattern" -tpy -tjs -tts

# Exclude generated or test paths when they add noise
rg -n "pattern" . -g '!dist/**' -g '!coverage/**'

# Only list matching files
rg -l "pattern" .
```

## Structural-tool guidance

If a structural tool is available, use it for syntax-aware queries such as:

- find all functions named `renderRow`
- find every call to `useEffect` with an empty dependency array
- find JSX elements using a specific prop
- find imports of one module regardless of formatting

Good fits include symbol search, AST search, or language-server references.
Use ripgrep afterward to inspect surrounding prose, comments, tests, and config
files.

## When not to over-optimize

- Do not introduce AST tooling if ripgrep answers the question cleanly.
- Do not widen into language-specific script creation for one-off searches.
- Do not treat grep output as proof without reading the file and nearby code.
