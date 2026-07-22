# 図鑑 zukan

**Field-guide your life.** A Claude Code skillset for running an Obsidian PARA vault as your daily notebook, dev journal, and idea lab — the way a *zukan* (図鑑, "illustrated encyclopedia" — think Pokédex) catalogues creatures.

Born from the vault "Seishin Zukan"; works with any PARA-shaped vault.

## Skills

| Command | Does |
|---|---|
| `/zukan:daily` | Capture life/work/cases into today's daily note, routed to the right sections |
| `/zukan:project-idea` | Spin up a full project folder: master note, mind map canvas, changelog, optional rival scan |
| `/zukan:mindstorm` | Quick idea capture with linking to related notes |
| `/zukan:devlog` | Log a dev-journey entry to today's note + project status log |
| `/zukan:weekly` | Review the week: synthesize dailies, update project statuses |
| `/zukan:recall` | Answer "when/what/where did I…" questions from the vault |
| `/zukan:kiroku` | Persistent session chronicle — logs work into the vault as you go, until "stop kiroku" |
| `/zukan:furikaeri` | Retroactive sweep — analyze the chat from the start, backfill everything into the vault |

## Vault layout assumed (PARA)

```
0-Daily/        YYYY-MM-DD.md daily notes
1-Projects/     one folder per project
2-Areas/        ongoing responsibilities
3-Resources/    reference, ideas, learnings
4-Archive/      done/dead
Templates/      Daily Note, Project, Mindstorm
```

Missing pieces are created on first use. Vault root = the directory Claude Code runs in.

## Install

```bash
# as a plugin (recommended)
claude plugin marketplace add Jouskar/zukan
claude plugin install zukan

# or drop into one vault only — run the sync script:
./sync.sh /path/to/vault
```

`sync.sh` symlinks `skills/` (fine to keep live) but **copies** `commands/` and the Codex/Cursor adapters as real files. This matters: Claude Code's slash-command scanner uses a glob with `followSymlinks:false`, which silently excludes symlinked command files from `/` autocomplete — skills load symlinked, commands do not. Re-run `sync.sh` after pulling zukan updates to refresh the copies.

## Always-on mode (no commands needed)

Two layers make zukan persistent from session start:

1. **`CLAUDE.md` routing table** in your vault root — copy `templates/CLAUDE-example.md` to `<vault>/CLAUDE.md` and adjust. Claude reads it at session start and routes plain messages to skills by content.
2. **Hooks** — copy `hooks/settings-example.json` to `<vault>/.claude/settings.json`. SessionStart announces zukan+kiroku active; UserPromptSubmit re-injects the reminder every message (survives long conversations). Restart Claude Code after adding.

With both, "today I fixed the CI pipeline" auto-routes to `daily` and kiroku logs session work — no slash commands ever.

## Other AI tools (Codex, Cursor, Antigravity, Gemini CLI, ...)

Claude Code's skills mechanism (auto-dereferenced `SKILL.md` files, `/`-command wrappers, hooks) is Claude-specific. Everything above is that native implementation. For other tools, zukan ships **`AGENTS.md`** — a single self-contained file with the full routing table and every behavior's steps inlined (since other tools have no skill file to defer to).

| Tool | What it reads | Setup |
|---|---|---|
| Codex CLI | `AGENTS.md` at repo root (native) | `cp AGENTS.md <vault>/AGENTS.md` |
| Cursor | `AGENTS.md` at repo root (native, recent versions) | same as above |
| Antigravity | `AGENTS.md` (unconfirmed — verify against current docs) | same as above |
| Gemini CLI | `GEMINI.md` | `cp adapters/GEMINI.md <vault>/GEMINI.md` (identical content, different filename) |
| Claude Code | `CLAUDE.md` + `.claude/skills/` + `.claude/commands/` | see Install above |

**Slash commands on other tools** (optional, autocomplete convenience — the AGENTS.md routing works without these):
```bash
cp adapters/codex-prompts/*.md   ~/.codex/prompts/         # Codex: /daily, /devlog, ...
cp adapters/cursor-commands/*.md <vault>/.cursor/commands/  # Cursor: /daily, /devlog, ...
```
These directory conventions are current as of this writing but less stable across tool versions than `AGENTS.md` — if a command doesn't autocomplete, the routing table in `AGENTS.md`/`GEMINI.md` still applies to plain messages, just without slash-typing.

Multiple convention files can coexist in the same vault (`CLAUDE.md` + `AGENTS.md` + `GEMINI.md` side by side) — each tool reads its own and ignores the others.

## Conventions the skills follow

- Git commit after every meaningful change (vault = repo)
- Changelog-first: canvases/mind maps never edited silently; changes logged in the project's changelog note
- Wikilinks everywhere: notes link to projects, projects link back

## Status

v0.1 — `daily` is subagent-tested; the rest follow the same tested conventions but are young. Issues welcome.
