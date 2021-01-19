#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Get project link
# @raycast.mode silent
# @raycast.packageName Raycast Scripts
#
# Optional parameters:
# @raycast.icon 🛠
# @raycast.currentDirectoryPath ~
# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Copy a project link to my system clipboard
# @raycast.author Matthew Gleich
# @raycast.authorURL https://github.mattglei.ch
# @raycast.argument1 { "type": "text", "placeholder": "Repo Name", "percentEncoded": true }

echo "https://ll.mattglei.ch/g/$1/" | pbcopy
echo "Copied link to clipboard"
