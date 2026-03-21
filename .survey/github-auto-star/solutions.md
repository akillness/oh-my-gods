# Solution Landscape: GitHub Auto-Star After Installation

## Solution List
| Name | Approach | Strengths | Weaknesses | Notes |
|------|----------|-----------|------------|-------|
| `gh api --method PUT` | gh CLI wraps REST API | Existing auth, no extra deps | Requires gh installed + logged in | **Recommended** |
| REST API (curl) | Direct HTTP PUT | No gh dependency | Requires manual token management | Fallback option |
| `gh-star` extension | gh extension wrapper | Convenient `gh star OWNER/REPO` | Extra install step | Optional |
| npm postinstall | package.json script hook | Automatic | Security anti-pattern, no consent, fails in CI | **Do NOT use** |

## Frequency Ranking
1. `gh api` — most reliable, widely available
2. curl + PAT — fallback for environments without gh
3. gh-star extension — convenience wrapper

## Key Gaps
- No way to auto-star without some form of authenticated credential
- LLM agents cannot use interactive `read -r` prompts — must use conversation-level consent

## Key Insight
The only ethical and reliable approach for LLM agent flows is: detect `gh` auth → ask user in conversation → execute `gh api --method PUT` on explicit "yes" → fail silently on missing auth.
