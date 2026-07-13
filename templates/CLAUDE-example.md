# Seishin Zukan — vault instructions

This is an Obsidian PARA vault (daily notebook, dev journal, idea lab), managed with the zukan skillset (`.claude/skills/`, source: `~/Projects/zukan`).

## Skill routing — check EVERY user message

Before responding to any message, decide whether it is vault content. If it matches a row below, invoke that skill via the Skill tool — the user usually will NOT type a command; the message itself is the trigger.

| Message looks like | Skill |
|---|---|
| Day recap, meetings, feelings, cases handled, mixed life/work updates | `daily` |
| Concrete dev progress or technical decision on an existing project | `devlog` |
| One raw idea / "what if", no commitment to build | `mindstorm` |
| "I want to build/start…" — committed new project pitch | `project-idea` |
| Question about their own past notes ("when did I…", "that idea about…") | `recall` |
| "How was my week", retro, summarize recent days | `weekly` |
| "Log as we go", "keep vault updated while we work" | `kiroku` (persistent until "stop kiroku") |
| "Catch the vault up", "log everything we did this chat" | `furikaeri` (one-shot retroactive sweep) |

## Disambiguation

- Mixed message (day stuff + idea + progress) → `daily` wins; it routes pieces to sections and cross-links projects.
- Progress-only on a known project → `devlog`, not `daily`.
- Idea WITH build commitment → `project-idea`; passing spark → `mindstorm`. Unsure → `mindstorm` (cheap to upgrade later).
- Questions about vault content → `recall`, never answer from memory.
- Genuine conversation/questions about the vault system itself → no skill, just answer.

## Conventions

- Git: branch `master`, commit after each meaningful change.
- Changelog-first: never silently edit canvases/mindmaps or overwrite big notes — log in the project's changelog note first.
- Wikilinks both directions: daily ↔ project ↔ area. Content maps to `2-Areas/` by MEANING, not keyword — a story about a difficult team conversation belongs to [[Cultural Transformation]] even if those words never appear. Area notes accumulate dated observation lines linking back to their source dailies.
- Templates live in `Templates/`; PARA folders `0-Daily` … `4-Archive`.
