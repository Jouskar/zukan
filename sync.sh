#!/usr/bin/env bash
# Install/refresh zukan into a vault as real files (not symlinks).
#
# Why: Claude Code's slash-command scanner uses a glob with
# followSymlinks:false, which excludes symlinked files as matches entirely.
# Skills (.claude/skills/) load fine symlinked; commands (.claude/commands/)
# silently don't show up in "/" autocomplete if symlinked. Copy, don't link.
#
# Usage: ./sync.sh /path/to/vault

set -euo pipefail
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VAULT="${1:?Usage: ./sync.sh /path/to/vault}"

mkdir -p "$VAULT/.claude/skills" "$VAULT/.claude/commands" \
         "$VAULT/.codex/prompts" "$VAULT/.cursor/commands"

# Skills: symlinks are fine here and keep them live-updating.
for d in "$SRC"/skills/*/; do
  name="$(basename "$d")"
  ln -sfn "$d" "$VAULT/.claude/skills/$name"
done

# Commands / prompts: must be real files, not symlinks (see note above).
cp "$SRC"/commands/*.md "$VAULT/.claude/commands/"
cp "$SRC"/adapters/codex-prompts/*.md "$VAULT/.codex/prompts/"
cp "$SRC"/adapters/cursor-commands/*.md "$VAULT/.cursor/commands/"

echo "zukan synced into $VAULT — restart your AI tool to pick up new commands."
