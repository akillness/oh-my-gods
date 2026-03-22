---
name: plannotator
description: Interactive plan and diff review for AI coding agents. Visual browser UI for annotating agent plans — approve or request changes with structured feedback. Supports code review, image annotation, and auto-save to Obsidian/Bear Notes.
allowed-tools: Read Bash Write
metadata:
  tags: plan, planning, planno, plannotator, plan-review, diff-review, code-review, claude-code, opencode, annotation, visual-review, plan-review, design-review
  platforms: Claude, OpenCode, Codex, Gemini
  keyword: plan
  version: 0.9.2
  source: backnotprop/plannotator
---

# plannotator — Interactive Plan & Diff Review

> Keyword: `plan` | Source: https://github.com/backnotprop/plannotator

Visually review and annotate AI agent plans before coding starts. Approve or request changes with structured feedback. Also supports diff/code review after coding.

---

## Key Rules

1. **Plan review fires automatically** on Claude Code and Gemini CLI via ExitPlanMode hook. On Codex CLI, use `/prompts:plannotator` manually. On OpenCode, the `submit_plan` tool is available automatically.
2. **If setup is not done**, direct the user to `references/setup-guide.md` — do not run install scripts yourself unless asked.
3. **After plan review**, check `/tmp/plannotator_feedback.txt` for structured feedback. If status is `request_changes`, replan before coding. If `approved`, proceed.
4. **Code review is a separate command** — run after coding, not before. Use `bash scripts/review.sh` for uncommitted changes or `bash scripts/review.sh HEAD~1` for a commit.
5. **Do not open plannotator manually** if the ExitPlanMode hook is configured — it fires automatically when exiting plan mode.

---

## Platform Routing Table

| Platform | Plan Review Trigger | Code Review | Feedback File |
|----------|--------------------|--------------|--------------------|
| **Claude Code** | Automatic (ExitPlanMode hook) | `bash scripts/review.sh` | `/tmp/plannotator_feedback.txt` |
| **Gemini CLI** | Automatic (`gemini --approval-mode plan`) | `plannotator review` | `/tmp/plannotator_feedback.txt` |
| **Codex CLI** | Manual: `/prompts:plannotator` | `plannotator review HEAD~1` | `/tmp/plannotator_feedback.txt` |
| **OpenCode** | Automatic (`submit_plan` tool) | `/plannotator-review` | UI-based |

---

## Agent Workflow: Plan Review (Before Coding)

**When invoked for plan review, do this in order:**

1. Check which platform you are on (see routing table above).
2. **Claude Code / Gemini**: plannotator opens automatically when you exit plan mode. Wait for the user to submit feedback in the UI.
3. **Codex CLI**: run `/prompts:plannotator` to submit the current plan for review.
4. **After the user submits feedback**, read the result:

```bash
cat /tmp/plannotator_feedback.txt
```

5. Parse the feedback:
   - `"status": "approved"` → proceed with implementation as planned
   - `"status": "request_changes"` → read the `annotations` array, replan based on each annotation, then re-submit for review
   - `"status": "denied"` → stop; report to user that the plan was rejected

**Annotation types in feedback:**
- `delete` — remove that step from the plan
- `insert` — add the described step at that position
- `replace` — replace that step with the described alternative
- `comment` — clarify or add acceptance criteria to that step

---

## Agent Workflow: Code Review (After Coding)

**When invoked for code review (diff review), do this:**

```bash
# Review all uncommitted changes
bash scripts/review.sh

# Review a specific commit
bash scripts/review.sh HEAD~1

# Review branch diff
bash scripts/review.sh main...HEAD
```

On **Gemini CLI**:
```bash
plannotator review
```

On **Codex CLI**:
```bash
plannotator review HEAD~1
```

On **OpenCode**:
```
/plannotator-review
```

The UI opens in the browser. The user annotates the diff and submits. Wait for the user to finish; there is no feedback file for code review — the user reviews visually.

---

## Feedback Handling (Replan Loop)

```
Plan submitted → User annotates in UI → User submits feedback
  ↓
Read /tmp/plannotator_feedback.txt
  ↓
approved?  → proceed to coding
  ↓
request_changes? → apply each annotation to the plan → resubmit
  ↓
denied? → report rejection to user; stop
```

**Reading feedback programmatically:**

```bash
# Check feedback status
python3 -c "
import json
fb = json.load(open('/tmp/plannotator_feedback.txt'))
print('Status:', fb.get('status'))
for a in fb.get('annotations', []):
    print(f'  [{a[\"type\"]}] {a[\"content\"]}')
"
```

---

## Annotation Guidance

When the user requests changes, address each annotation concretely:

| Annotation Type | Agent Action |
|-----------------|--------------|
| `delete` | Remove the step entirely from the plan |
| `insert` | Add a new step at the indicated position |
| `replace` | Rewrite the step with the described alternative |
| `comment` | Incorporate the constraint or acceptance criteria |

Keep each replan change minimal — only modify what the annotation targets.

---

## Best Practices

1. Submit plan for review **before** writing any code — catch wrong approaches early
2. Keep each annotation tied to one concrete, actionable change
3. Include acceptance criteria in "request changes" feedback
4. For diff review, annotate exact line ranges tied to expected behavior changes
5. Use image annotation for UI/UX feedback where text is insufficient
6. If the replan loop exceeds 3 rounds, surface the conflict to the user — do not loop indefinitely

---

## References

- [GitHub: backnotprop/plannotator](https://github.com/backnotprop/plannotator)
- [Official site: plannotator.ai](https://plannotator.ai)
- [Setup guide (install, hooks, Obsidian, remote)](references/setup-guide.md)
- [Hook README](https://github.com/backnotprop/plannotator/blob/main/apps/hook/README.md)
- [OpenCode plugin README](https://github.com/backnotprop/plannotator/blob/main/apps/opencode-plugin/README.md)
