---
name: weekly
description: Use when the user asks to review or summarize a period — "/weekly", "how was my week", "weekly review", "retro", "what did I get done lately", "summarize my last days".
---

# Weekly Review

Synthesize the week from daily notes; surface momentum and drift.

## Steps

1. **Read** the last 7 daily notes in `0-Daily/` (or since last weekly note).
2. **Write** `0-Daily/Week YYYY-Www.md`:
   - **Highlights** — 3-5 things that mattered (from Dev Log + Notes)
   - **Projects moved** — per project: what advanced, wikilinked
   - **Ideas born** — mindstorms captured this week, with links
   - **Dropped balls** — unchecked tasks older than 3 days, surfaced verbatim
   - **Mood curve** — one line if mood data exists
   - **Next week** — 1-3 suggested focuses, phrased as questions not orders
3. **Carry over**: move still-relevant unchecked tasks into today's/next daily note; mark them `(carried)`.
4. **Project statuses**: any project with zero movement for 2+ weeks → note it in the review and ask whether to archive.
5. **Commit**: `Weekly review Www: <one-phrase theme>`.

## Rules

- Quote the user's own words for highlights where possible — recognition beats summary.
- Dropped balls listed without shame framing; they're inventory, not guilt.
- Suggestions max 3; a review that assigns homework gets ignored.

## Common mistakes

- Summarizing what happened but skipping unchecked-task sweep — the sweep is the value.
- Creating the review but not linking the dailies it drew from.
