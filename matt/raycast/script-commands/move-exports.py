#!/usr/bin/python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Move Exports
# @raycast.mode silent
# @raycast.packageName Exports

# Optional parameters:
# @raycast.icon images/folder-desktop.png

# Documentation:
# @raycast.description Moves data exports that I have generated

import os
from pathlib import Path

moved_strava = False
moved_github = False

# moving strava export:
home = Path.home()
downloads_folder = home.joinpath("Downloads")
for file in os.listdir(downloads_folder):
    if file.startswith("export_") and file.endswith(".zip"):
        os.rename(
            downloads_folder.joinpath(file),
            home.joinpath(
                "Library/Mobile Documents/com~apple~CloudDocs/Important/exports/strava.zip"
            ),
        )
        moved_strava = True

# moving github export
