# Env Precedence and Visibility

Use this reference when `.env` layering is unclear or the main risk is sending
the wrong value to the wrong runtime.

## Start with four config classes

Classify each value before picking a file or platform slot:

- public: safe to expose to the browser or client bundle
- private: server-only but not necessarily highly sensitive
- secret: credentials, signing keys, tokens, or connection strings
- runtime-only: values injected only in deployed environments or CI

Do not let one variable move between classes across environments.

## Keep precedence short and explicit

A common order is:

1. checked-in defaults or `.env.example` for documentation only
2. local developer overrides such as `.env.local`
3. CI or preview environment variables from the platform
4. staging or production secrets from the runtime platform

If two layers can both override the same value, document which one wins.

## Visibility rules by runtime

Questions to answer for every variable:

- does the browser need this value or only the server?
- does the value need to exist at build time, runtime, or both?
- can preview deployments use a different value safely?
- should local developers ever have a real production value?

Framework-specific note:

- Next.js exposes only `NEXT_PUBLIC_*` to the browser
- Vite exposes only `VITE_*` to the client bundle
- other frameworks often have equivalent public-prefix or build-time rules

## Drift checks

Common drift patterns:

- a value exists in production but not in `.env.example`
- preview or CI uses a different variable name than local
- a server-only variable is accidentally copied into a client prefix
- optional values silently become required in one environment only

## External references

- Twelve-Factor config: https://12factor.net/config
- Next.js env vars: https://nextjs.org/docs/app/guides/environment-variables
- Vite env and mode docs: https://vite.dev/guide/env-and-mode
