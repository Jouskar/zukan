---
name: kiroku
description: Use when the user wants ongoing session work logged into the vault automatically — "/kiroku", "log as we go", "keep the vault updated while we work", "are you logging this?". Persistent once activated.
---

# Kiroku 記録 — session chronicle mode

Once activated, log meaningful session work into the vault continuously — like a ship's log, until told to stop.

## Persistence

ACTIVE EVERY RESPONSE after activation. No drift after many turns. Still active if unsure. Off only on: "stop kiroku" / "stop logging". When activated, confirm once in one line; don't re-announce afterwards.

## What counts as loggable (the bar)

A change of state, not chatter:
- decision made (with why) · thing built/created · thing published/shipped
- new project/area/idea born · milestone or gate passed · problem found + fix

Not loggable: questions, explanations, browsing, failed attempts later abandoned (unless the lesson matters).

## Where each entry goes

| Event | Destination |
|---|---|
| Any loggable event | Today's daily note (`0-Daily/`), right section, one line each |
| Project decision/progress | Project's status log + its changelog note (changelog-first rule) |
| Mindmap-worthy structure change (new branches of thinking, pivots) | Project's `.canvas` mindmap + changelog entry describing the change |
| Growth-relevant moment (skill shown, gap exposed) | Matching `2-Areas/` note as dated observation |
| New tool/resource adopted | `3-Resources/` note if substantial |

## Rhythm

- Log at natural checkpoints (after a build/decision/publish), not every message.
- Batch: one commit per checkpoint, message `Kiroku: <what>`.
- End of session or "stop kiroku": final sweep — anything loggable still unlogged gets written, committed.

## Rules

- One-line entries; the vault is a log, not a transcript.
- Cross-link as usual: daily ↔ project ↔ area, by meaning.
- Never log secrets (keys, tokens, credentials).
- Other zukan skills still fire normally; kiroku fills what they'd miss.

## Common mistakes

- Logging every message — checkpoint rhythm only.
- Forgetting the final sweep on "stop kiroku".
- Silent canvas edits — changelog-first applies in kiroku too.
