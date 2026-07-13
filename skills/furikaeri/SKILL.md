---
name: furikaeri
description: Use when the user wants the conversation so far analyzed and the vault updated from it — "/furikaeri", "catch the vault up", "log everything we did this chat", "update notes from this conversation", "what did we do so far, write it down".
---

# Furikaeri 振り返り — retroactive session sweep

Replay the conversation from its beginning to now; write into the vault everything that should have been logged. One-shot; kiroku's backward-looking sibling (kiroku logs forward from activation, furikaeri repairs the past).

## Steps

1. **Replay**: walk the conversation chronologically. Collect every state change:
   - decisions made (with the why argued at the time)
   - things built / created / shipped / published
   - projects or areas born or advanced · milestones/gates passed
   - ideas dropped in passing and never captured
   - growth moments (skill shown, gap exposed, lesson learned)
2. **Diff against the vault**: for each item, check whether it's already recorded (daily note, project status log, changelog, area observations). Already there → skip. The sweep must be idempotent — running it twice changes nothing.
3. **Write the gaps**, using each destination's own convention:
   - day events → the daily note of the day they happened (create past dailies if missing; date them correctly, not today)
   - project decisions/progress → status log + changelog note (changelog-first)
   - structural thinking shifts → mindmap canvas + changelog entry
   - growth moments → matching `2-Areas/` observations
   - uncaptured ideas → mindstorm notes if substantial, daily one-liners if not
4. **Cross-link** everything written: daily ↔ project ↔ area, by meaning.
5. **Report**: one short list — what was added where, what was already covered.
6. **Commit**: single commit `Furikaeri: <date/session> sweep`, push if remote exists.

## Rules

- Log what happened, including reversals: a decision later overturned appears as decision + reversal (the walking path is the point), each with its date.
- Conversation facts beat memory: quote the user's own words for their experiences.
- Multi-day conversations → entries land on their actual days.
- Never log secrets (keys, tokens, one-time codes).
- Read-only toward the conversation; write-only toward gaps — never rewrite existing vault content, only append.

## Common mistakes

- Dumping a session transcript into one note — route by destination convention.
- Everything dated today when the conversation spans days.
- Duplicating entries kiroku or daily already wrote — diff first (step 2 is the skill).
- Logging chatter/explanations — state changes only.
