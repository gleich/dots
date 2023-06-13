#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Download Tiktok
# @raycast.mode silent
# @raycast.packageName Navigation

# Optional parameters:
# @raycast.icon images/folder-desktop.png

# Documentation:
# @raycast.description Opens the Desktop folder in the Finder.
# @raycast.argument1 { "type": "text", "placeholder": "name" }
# @raycast.argument2 { "type": "text", "placeholder": "url" }

cd ~/Desktop
yt-dlp "$2" --output "$1.mp4"
open ~/Desktop
