#!/usr/bin/env bash
set -euo pipefail

# 0. Exit if no staged or unstaged changes in tracked files
if git diff --quiet && git diff --cached --quiet; then
  echo "✖ No changes to commit or push."
  exit 0
fi

# 1. Create a temp file for your commit message
msgfile=$(mktemp /tmp/commitmsg.XXXXXX)
trap 'rm -f "$msgfile"' EXIT

# 2. Read your multi-line message
echo "Enter your commit message; finish with Ctrl-D:"
cat > "$msgfile"

# 3. Commit changes in each submodule (if any)
git submodule foreach --quiet '
  if ! git diff --quiet HEAD --; then
    echo "→ Committing in submodule \$sm_path..."
    git add -A
    git commit -F "$MSGFILE"
  fi
' MSGFILE="$msgfile"

# 4. Commit in the superproject (updates submodule pointers too)
echo "→ Committing in superproject..."
git add -A
git commit -F "$msgfile"
echo "✔ Commit(s) created."

# 5. Push superproject and submodules together
echo "→ Pushing everything (superproject + submodules)…"
git push --recurse-submodules=on-demand
echo "✔ Push complete."
