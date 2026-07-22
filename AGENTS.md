# Zukan — universal agent instructions

This file is the tool-agnostic core of zukan: a PARA-vault workflow (daily notebook, dev journal, idea lab) for AI coding/writing assistants. Read by any tool that honors `AGENTS.md` (Codex CLI, Cursor, Antigravity, Amp, and others) as well as tools using a differently-named convention file that mirrors this one (`CLAUDE.md` for Claude Code, `GEMINI.md` for Gemini CLI).

Unlike Claude Code, most of these tools have no separate "skill" mechanism to defer to — so the routing logic and each behavior's steps are written out in full below. Follow them directly.

## Vault layout assumed (PARA)

```
0-Daily/        YYYY-MM-DD.md daily notes
1-Projects/     one folder per project
2-Areas/        ongoing responsibilities/life themes
3-Resources/    reference, ideas, learnings
4-Archive/      done/dead
Templates/      Daily Note, Project, Mindstorm, Area
```

Missing pieces are created on first use. Vault root = the directory the tool is running in.

## Routing — check every user message

Decide whether the message is vault content before responding normally. The user will usually NOT type a command; the message itself is the trigger.

| Message looks like | Behavior |
|---|---|
| Day recap, meetings, feelings, cases handled, mixed life/work updates | **Daily capture** |
| Concrete dev progress or technical decision on an existing project | **Dev log** |
| One raw idea / "what if", no commitment to build | **Mindstorm** |
| "I want to build/start…" — committed new project pitch | **Project idea** |
| Question about their own past notes ("when did I…", "that idea about…") | **Recall** |
| "How was my week", retro, summarize recent days | **Weekly review** |
| "Log as we go", "keep vault updated while we work" | **Kiroku** (persistent until "stop kiroku") |
| "Catch the vault up", "log everything we did this chat" | **Furikaeri** (one-shot retroactive sweep) |

Disambiguation: mixed message → Daily capture wins (it routes pieces to sections and cross-links). Progress-only on a known project → Dev log, not Daily. Idea WITH build commitment → Project idea; passing spark → Mindstorm (unsure → Mindstorm, cheap to upgrade later). Questions about vault content → Recall, never answer from memory. Genuine conversation about the vault system itself → no behavior, just answer.

## Daily capture

1. Today's note: `0-Daily/YYYY-MM-DD.md`. Missing → create from `Templates/Daily Note` with placeholders resolved (real date, weekday). Exists → append into existing sections, never duplicate headers.
2. Route each piece of input to its section, don't dump everything in one place: feelings/energy/health → `## Mood / Energy`; work done/bugs fixed/shipped → `## Dev Log`; ideas/"what if" → `## Mindstorm / Ideas`; anything actionable → `## Tasks` as `- [ ]` with due date resolved to an absolute date; meetings/people/everything else → `## Notes`.
3. Cross-link both directions — projects AND areas:
   - Project mentioned that has a folder in `1-Projects/` → wikilink it. Check that project's note for open questions/next steps the day's news answers; if one matches, update it too and link back to today.
   - Scan `2-Areas/` for **thematic** matches (match by meaning, not keyword — a story about a colleague resisting feedback IS cultural-transformation material). Wikilink it; add a dated observation line in the area note linking back to today.
   - Recurring theme with no area note yet (3rd+ daily touching it) → propose creating `2-Areas/<Theme>.md`, don't create silently.
   - Substantial standalone idea (a paragraph) → also create a note in `3-Resources/` from `Templates/Mindstorm`, wikilinked.
4. Footer `Links:` line points to the previous daily note that actually exists, never to itself. No previous note → drop the line.
5. If the project is a git repo, commit: `git add -A && git commit -m "Daily YYYY-MM-DD: <short summary>"`.

Never overwrite existing content; append. Keep the user's wording; tidy grammar only where it helps scanning.

## Project idea

Triggered by a committed pitch ("I want to build…", "new project").

1. Folder + master note `1-Projects/<Name>/<Name>.md` (base on `Templates/Project` if present): Problem/Why, core concept + differentiator, MVP sketch (must-haves vs explicit NOT-list), open questions (include ones the user didn't think of — naming, legal, GTM, pricing), status log with today's date.
2. Mind map: `<Name> Mindmap.canvas` (Obsidian JSON Canvas format) if the tool can write it — central node + branches (concept, rivals, MVP, stack, risks, business).
3. Changelog: `<Name> Changelog.md` — log every future change here first, before editing the canvas/master note silently.
4. If asked for rival/name research: do it; whois a domain via `whois <domain>` (\"no match/not found\" = available); cite sources.
5. Link from today's daily note if one exists. Commit: `Add <Name> project: initial capture`.

## Mindstorm

Triggered by a raw spark, no build commitment.

1. Note: `3-Resources/<Short Title>.md` (or `Templates/Mindstorm` if present): Spark (trigger, in the user's words), Core concept (2-5 sentences), Open questions (2+, include ones the user didn't raise), Related (wikilinks — projects, areas, resources by meaning).
2. If it clearly belongs to an existing project or area, file it there instead and link both ways.
3. Backlink from today's daily `## Mindstorm / Ideas` if a daily note already exists.
4. Commit: `Mindstorm: <short title>`.

One idea per note. Title = a noun phrase someone would search for later, not "Idea 2026-07-13".

## Dev log

Triggered by concrete progress or a technical decision on an existing project.

1. Identify the project; ambiguous → check `1-Projects/`, still unclear → ask.
2. Append to the project's status log: `- YYYY-MM-DD: <what happened>`. Decisions with a "why" → also the project's changelog note if one exists.
3. Same line + wikilink into today's daily `## Dev Log` (create the daily note if missing).
4. If this closes an open question/next-step checkbox in the project note, check it off with the date.
5. If it also reflects an ongoing `2-Areas/` theme (by meaning), add a dated line there too.
6. Commit: `Devlog <project>: <short summary>`.

Past tense, concrete ("wired LiteLLM fallback" not "worked on AI stuff"). Record decisions WITH their why.

## Weekly review

1. Read the last 7 daily notes (or since the last weekly note).
2. Write `0-Daily/Week YYYY-Www.md`: Highlights (3-5 things, quote the user's words where possible), Projects moved (per project, wikilinked), Areas pulse (per touched area, one-line trend; untouched areas listed as dormant), Ideas born (mindstorms this week, linked), Dropped balls (unchecked tasks older than 3 days, verbatim), Mood curve (if data exists), Next week (1-3 suggestions, phrased as questions).
3. Carry over still-relevant unchecked tasks into the next daily, marked `(carried)`.
4. Project with zero movement for 2+ weeks → flag it, ask about archiving.
5. Commit: `Weekly review Www: <one-phrase theme>`.

## Recall

Read-only. Answer from the vault, with receipts.

1. Search the vault (grep, case-insensitive, try synonyms and names first). Date-shaped questions → also scan `0-Daily/` filenames.
2. Read only matching sections.
3. Answer in 1-3 sentences, then cite: wikilink + verbatim quote. Multiple hits → newest first, max 5.
4. No hit → say so plainly, list what was tried, offer to search git history (`git log -S<term>`) if this is a git repo.

Never answer from general knowledge when the question is about the user's own notes. Never modify notes or commit.

## Kiroku — persistent session chronicle

Activated by "log as we go" / "keep the vault updated while we work". Stays active every response until "stop kiroku"/"stop logging".

Log loggable checkpoints only (decision made with why, thing built/shipped/published, milestone/gate passed, problem found+fixed) — not every message, not chatter/explanations. Route each to: today's daily (right section), the touched project's status log + changelog (changelog-first — never edit a canvas/mindmap silently), a matching area's dated observation (by meaning). Batch commits per checkpoint: `Kiroku: <what>`. On "stop kiroku": final sweep of anything still unlogged, then commit. Never log secrets.

## Furikaeri — retroactive sweep

Triggered by "catch the vault up", "log everything we did this chat", one-shot (not persistent).

1. Replay the conversation from its start; collect every state change (decisions+why, builds/ships, projects/areas advanced, ideas dropped in passing, growth moments).
2. Diff against the vault — skip anything already recorded; must be idempotent (running twice changes nothing).
3. Write the gaps using each destination's own convention above, dated to when they actually happened (not "today" for a multi-day conversation; create past daily notes if missing).
4. Cross-link everything written (daily ↔ project ↔ area, by meaning).
5. Report what was added vs already covered. One commit: `Furikaeri: <date/session> sweep`.

Log decisions including reversals (decision + reversal, each dated — the walking path matters). Never log secrets.

## Conventions

- Git: default branch as already set in the repo; commit after each meaningful change; skip commit silently if not a git repo.
- Changelog-first: never silently edit canvases/mindmaps or overwrite big notes — log the change in the project's changelog note first.
- Wikilinks (or the tool's native link syntax) both directions: daily ↔ project ↔ area.
- Content maps to `2-Areas/` by MEANING, not keyword.
