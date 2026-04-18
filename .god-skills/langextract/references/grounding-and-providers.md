# LangExtract grounding and provider notes

## Why this reference exists

Keep the top-level `SKILL.md` compact while preserving the operational details
that matter most for correct LangExtract use: grounded outputs, provider
behavior, and plugin boundaries.

## Grounding caveat

Official LangExtract guidance notes that few-shot examples can occasionally
bleed into output. When that happens, the extraction cannot be matched back to
the source text and `char_interval` is `None`.

Use this filter when you need strictly grounded results:

```python
grounded_extractions = [e for e in result.extractions if e.char_interval]
```

If downstream code depends on `start` and `end`, verify the source slice still
matches `extraction_text` before trusting the record.

## Provider defaults

### Gemini

- Best default path for straightforward usage
- Controlled generation and schema enforcement work best here
- `gemini-2.5-flash` is a reasonable default for most examples

### OpenAI

- Install support with `pip install langextract[openai]`
- `OPENAI_API_KEY` can be read automatically from the environment
- Leave `fence_output` and `use_schema_constraints` unset unless you are
  debugging provider behavior; upstream docs say the provider auto-determines
  those settings

### Ollama

- Use `model_url="http://localhost:11434"` with a local model such as
  `gemma2:2b`
- No API key is required for a local Ollama setup
- As with OpenAI, leave `fence_output` and `use_schema_constraints` unset by
  default so the provider can auto-configure them

## Explicit provider selection

For OpenAI-compatible endpoints or custom routing, use `ModelConfig`:

```python
from langextract.factory import ModelConfig
import langextract as lx

result = lx.extract(
    text_or_documents=input_text,
    prompt_description=prompt,
    examples=examples,
    config=ModelConfig(
        model_id="my-openai-compatible-model",
        provider="openai",
        provider_kwargs={"api_key": "sk-...", "base_url": "https://..."},
    ),
)
```

## Plugin system notes

- LangExtract uses a router-based provider system
- Third-party providers are discovered via Python entry points
- `LANGEXTRACT_DISABLE_PLUGINS=1` disables plugin loading
- New provider implementations should follow the router or entry-point pattern
  in the upstream provider README
