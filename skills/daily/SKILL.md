---
name: daily
description: Use when the user shares what happened in their day — life events, work updates, cases handled, ideas, moods, todos — or types /daily. Also when they say "log this", "note for today", "add to my journal".
---

# Daily Capture

Route the user's day into today's daily note, connect it to the rest of the vault, commit.

## Steps

1. **Today's note**: `0-Daily/YYYY-MM-DD.md`. Missing → create from `Templates/Daily Note` with template placeholders resolved (real date, weekday). Exists → append into existing sections, never duplicate headers.
2. **Route each piece of input to its section** — don't dump everything in one place:
   - feelings, energy, health → `## Mood / Energy`
   - work done, bugs fixed, code shipped → `## Dev Log`
   - ideas, "what if", sparks → `## Mindstorm / Ideas`
   - anything actionable ("need to", "tomorrow", "don't forget") → `## Tasks` as `- [ ]` with due date if stated
   - meetings, people, everything else → `## Notes`
3. **Cross-link, both directions**:
   - Mention of a project that has a folder in `1-Projects/` → wikilink it: `[[Job Simulator]]`
   - Check the mentioned project's note for open questions or next steps the day's news answers (a person met, a decision made, a blocker cleared). If one matches, update that project note too (check the box / add a dated line) and link today's daily note there.
   - Substantial standalone idea (a paragraph, not a phrase) → also create a note in `3-Resources/` from `Templates/Mindstorm` and wikilink it from the daily.
4. **Fix the footer**: bottom `Links:` line points to the *previous* daily note that actually exists (`[[2026-07-12]]`), never to itself. No previous note → drop the line.
5. **Commit**: `git add -A && git commit` — message like `Daily 2026-07-13: co-founder meeting, CI fix`. Vault not a git repo → skip silently.

## Rules

- Never overwrite existing content; append.
- Keep the user's wording; tidy grammar only where it helps scanning.
- Dates absolute (resolve "tomorrow" → real date).
- Sections stay in template order even when appending.

## Common mistakes

- Everything shoved into `## Notes` — route by content type.
- Leaving template's `{{date:...}}` placeholders unresolved.
- Self-linking footer (`Links: [[<today>]]`) — must be previous day.
- Forgetting the commit — the vault's history IS the diary's spine.
