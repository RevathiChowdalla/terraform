#!/bin/bash
cd /path/to/your/repo

# Add all changes
git add .

# Check if there are any staged changes to commit
if ! git diff --cached --quiet; then
    git commit -m "Automated commit on $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main
else
    echo "No changes to commit."
fi
