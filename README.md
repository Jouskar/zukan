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

# or drop skills into one vault only
cp -r skills/* <vault>/.claude/skills/
```

## Conventions the skills follow

- Git commit after every meaningful change (vault = repo)
- Changelog-first: canvases/mind maps never edited silently; changes logged in the project's changelog note
- Wikilinks everywhere: notes link to projects, projects link back

## Status

v0.1 — `daily` is subagent-tested; the rest follow the same tested conventions but are young. Issues welcome.
