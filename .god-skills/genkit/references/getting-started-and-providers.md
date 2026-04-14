# Genkit: getting started and provider setup

Use this reference when the user needs current setup guidance, language
selection, provider wiring, or secrets/config decisions.

## Start with the language lane

Pick the implementation language before naming packages or code structure:

- JavaScript/TypeScript: the strongest default for most teams because the public
  docs and examples are deepest here
- Go: good when the surrounding service is already Go and the team wants typed
  backend flows without a separate Node runtime
- Python: useful for Python-heavy stacks, but treat language-specific feature
  parity as something to verify in the current docs before promising it

If the user has not chosen a language, recommend the language already used by
the product unless Genkit support depth is materially better elsewhere.

## Provider choice

Match the provider to the team's environment:

- Gemini / Google AI: the fastest path for greenfield local prototyping
- Vertex AI: better when the team already has GCP IAM, centralized secrets, or
  needs managed Google Cloud controls
- OpenAI-compatible or Anthropic-compatible providers: verify the exact
  integration path in the current Genkit docs for the selected language before
  pinning packages
- Ollama or other local providers: useful for local-only workflows, but call
  out operational differences from hosted production providers

Do not hardcode community package names from stale examples unless you have
verified them against the current docs for the target language.

## Minimum setup checklist

For most requests, confirm these items up front:

1. project language and package manager
2. target provider and auth method
3. local run command
4. deployment target
5. whether the user needs flows only or also prompts, tools, retrieval, or evals

## Secrets and configuration

- keep API keys in environment variables or managed secrets
- use platform-native secret handling in production
- avoid inline secrets in sample code, markdown, or `.prompt` examples
- call out any required local env vars explicitly

## When to escalate to official docs

Check the current docs before locking:

- package or plugin names
- provider-specific capabilities
- preview or beta features
- deployment integration details for the chosen language
- evaluation or Dev UI commands if the runtime setup is non-standard

## Official doc entry points

- Genkit overview: https://genkit.dev/docs/js/overview/
- Get started: https://genkit.dev/docs/get-started
- JavaScript docs index: https://genkit.dev/docs/js/
- Go docs index: https://genkit.dev/docs/go/
- Python docs index: https://genkit.dev/docs/python/
- Genkit GitHub repository: https://github.com/firebase/genkit
