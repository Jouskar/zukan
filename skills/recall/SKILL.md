---
name: recall
description: Use when the user asks about their own past notes or memories in the vault — "when did I…", "what was that idea about…", "did I ever write/mention…", "find my note on…", "who was the person I met…". Also on /recall.
---

# Recall

Answer from the vault, with receipts.

## Steps

1. **Search** the vault with Grep (case-insensitive, try synonyms; people/project names first). Date-shaped questions → also scan `0-Daily/` filenames around the implied period.
2. **Read** only the matching sections, not whole files.
3. **Answer** directly in 1-3 sentences, then cite: wikilink + quote of the exact line(s) it came from. Multiple hits → newest first, max 5.
4. **Not found** → say so plainly, list the 2-3 searches tried, offer to search git history (`git log -S<term>` — catches deleted content).

## Rules

- Never answer from general knowledge when the question is about THEIR notes; no hit = "not in the vault".
- Quote verbatim; the user recognizes their own words.
- Read-only: recall never modifies notes, never commits.

## Common mistakes

- One grep, one term, giving up — synonyms and project names catch most misses.
- Paraphrasing instead of quoting — kills the "ah yes, that day" recognition.
- Forgetting git history for "I'm sure I wrote this once" cases.
