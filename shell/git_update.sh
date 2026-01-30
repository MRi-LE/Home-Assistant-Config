#!/bin/bash

# create a logfile name (optional: with date/time)
LOGFILE="/config/git_update.log"

# write timestamp at start of log
echo "==== $(date '+%Y-%m-%d %H:%M:%S') - Starting git_update ====" > "$LOGFILE"
echo "Running script: $0 with commit message: $*" >> "$LOGFILE"

# redirect rest of output (stdout & stderr) into same log (append)
exec >> "$LOGFILE" 2>&1

set -x

git config --global --unset-all safe.directory
git config --global --add safe.directory /config

cd /config

git add .
git status

git commit -m "$1"
git push origin dev

exit

