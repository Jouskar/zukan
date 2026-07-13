---
name: project-idea
description: Use when the user pitches something they want to build or start — "I want to build…", "new project", "startup idea", "an app/platform/tool that…" — signalling commitment beyond a passing thought. Also on /project-idea.
---

# Project Idea

Turn a pitched idea into a full project folder in `1-Projects/<Name>/`.

## Steps

1. **Folder + master note** `1-Projects/<Name>/<Name>.md` based on `Templates/Project`, filled with:
   - Problem/Why (from the pitch; sharpen it)
   - Core concept + what differentiates it
   - MVP sketch: must-haves vs explicitly-NOT list
   - Open questions the user hasn't answered yet — add ones they didn't think of (naming, legal, GTM, pricing, unit economics)
   - Status log with today's date
2. **Mind map**: `<Name> Mindmap.canvas` (Obsidian JSON Canvas) — central node + branches: concept, rivals, MVP, stack, risks, business. Keep nodes short; canvas is a map, master note is the territory.
3. **Changelog**: `<Name> Changelog.md` — v1 entry describing initial state. Every future canvas/decision change gets logged here first; never edit the canvas silently.
4. **Research offer**: if the user asked for rival analysis or naming, do it (web search; whois for domains via `whois <domain>` — "no match/not found" = available). Otherwise offer as next step, don't block capture.
5. **Link**: today's daily note (if any) gets a line linking the new project. Master note links back to relevant existing notes.
6. **Commit**: `Add <Name> project: initial capture`.

## Rules

- One folder per project; master note name == folder name (wikilink-friendly).
- Names/claims from research must cite sources as markdown links.
- Whois-check before declaring any name "available".

## Common mistakes

- Dumping the pitch verbatim — structure it; the value is the sharpening.
- Creating the canvas without the changelog. Changelog-first is the contract.
- Skipping the "NOT in MVP" list — scope creep starts at capture.
