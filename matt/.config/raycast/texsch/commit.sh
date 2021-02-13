#!/bin/bash

# Dependency: This script requires texsch
# Install code: https://ll.mattglei.ch/g/texsch/
#
# @raycast.schemaVersion 1
# @raycast.title texsch commit
# @raycast.mode compact
# @raycast.packageName texsch
#
# Optional parameters:
# @raycast.icon ✏️
# @raycast.currentDirectoryPath ~/github/Matt-Gleich/private/tex/Junior-Year

# @raycast.needsConfirmation true
#
# Documentation:
# @raycast.description Commit and push texsch changes
# @raycast.author Matthew Gleich
# @raycast.authorURL https://github.mattglei.ch

texsch commit

git add .
git commit --amend --no-edit
git push --force
