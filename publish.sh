#!/usr/bin/env bash
set -euo pipefail

# 0. Exit if no staged or unstaged changes in tracked files
if git diff --quiet && git diff --cached --quiet; then
  echo "✖ No changes to commit or push."
  exit 0
fi

# 1. Create a temp file for your commit message
msgfile=$(mktemp /tmp/commitmsg.XXXXXX)

# 2. Ensure the temp file is removed when the script exits
trap 'rm -f "$msgfile"' EXIT

# 3. Read your multi-line message
echo "Enter your commit message; finish with Ctrl-D:"
cat > "$msgfile"

# 4. Bail out if there’s nothing to commit in tracked files
if git diff-index --quiet HEAD --; then
  echo "✖ No changes to commit."
  exit 0
fi

# 5. Commit all tracked changes (-a) and recurse into submodules if needed
git commit -a \
    --recurse-submodules=on-demand \
    -F "$msgfile"

echo "✔ Commit created."

# 6. Push superproject and any submodules with new commits
echo "→ Pushing superproject and submodules…"
git push \
    --recurse-submodules=on-demand

echo "✔ Push complete."
