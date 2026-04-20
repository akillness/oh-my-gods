# Vercel CLI And Claim Flows

Use this reference when the request is specifically about Vercel operations.

## Linked-project CLI flow

Use the standard Vercel CLI path when the repo is already linked to a Vercel
project or the user wants normal preview or production operations.

Typical command surface:

```bash
vercel
vercel --prod
vercel inspect <deployment-url-or-id>
vercel logs <deployment-url-or-id>
vercel env ls
vercel env pull .env.local
vercel domains ls
```

Use linked-project CLI work for:

- preview or production deploys on an existing Vercel project
- inspecting deployment URLs or build output
- environment-variable sync
- domain and alias operations

Do not assume that preview deploys are public. Deployment protection may limit
visibility, so verify the access model before telling the user a URL is broadly
shareable.

Relevant docs:

- `vercel deploy`: https://vercel.com/docs/cli/deploy
- CLI overview: https://vercel.com/docs/cli
- deployment protection: https://vercel.com/docs/security/deployment-protection

## Claim-deployment flow

Use claim deployments when an AI-generated or third-party-created deployment
needs to be transferred to a user's Vercel account.

Key points:

- the deployment can be created programmatically
- the handoff produces a claim URL
- claim codes are time-limited
- this is not the same as the ordinary linked-project CLI path

For the packaged helper in this skill:

- bundled helper: `scripts/deploy.sh`
- use it only when the runtime exposes the skill directory locally and the goal
  is an AI-generated preview plus claim handoff

Relevant docs:

- claim deployments:
  https://vercel.com/docs/deployments/claim-deployments

## Deploy hooks

Use deploy hooks only when the project already exposes one and the user wants a
hook-based trigger.

Key points:

- hook URLs are effectively secrets
- they can trigger preview or production builds depending on configuration
- they are not a replacement for general Vercel project management

Relevant docs:

- deploy hooks: https://vercel.com/docs/deploy-hooks
