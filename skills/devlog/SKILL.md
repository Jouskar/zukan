---
name: devlog
description: Use when the user reports concrete development progress or a technical decision on an existing project — "shipped", "fixed", "implemented", "refactored", "decided to use X", "milestone", "finally works". Also on /devlog, "progress update".
---

# Dev Log

Record development progress in two places: the day and the project.

## Steps

1. **Which project?** Identify from the message; ambiguous → check `1-Projects/` folders; still unclear → ask.
2. **Project note**: append to its `## Status log` (or Status Log section): `- YYYY-MM-DD: <what happened>`. Decisions with a "why" → also the project changelog note if one exists (changelog-first convention).
3. **Daily note**: `## Dev Log` gets the same line + wikilink to the project. Create today's note from `Templates/Daily Note` if missing.
4. **Done items**: if the progress completes an open question / next-step checkbox in the project note, check it off with the date.
5. **Commit**: `Devlog <project>: <short summary>`.

## Rules

- Past tense, concrete: "wired LiteLLM fallback" not "worked on AI stuff".
- Decisions recorded WITH their why — future-you audits reasoning, not outcomes.
- Never renumber/rewrite old log entries; append only.

## Common mistakes

- Logging only in the daily note — the project note is the primary record.
- Recording the what without the why for decisions.
