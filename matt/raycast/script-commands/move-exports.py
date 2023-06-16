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
for filename in os.listdir(downloads_folder):
    # strava export
    if filename.startswith("export_") and filename.endswith(".zip"):
        os.rename(
            downloads_folder.joinpath(filename),
            home.joinpath(
                "Library/Mobile Documents/com~apple~CloudDocs/Important/exports/strava.zip"
            ),
        )
        moved_strava = True
    # github export
    if len(filename) == 43 and filename.endswith(".tar.gz"):
        os.rename(
            downloads_folder.joinpath(filename),
            home.joinpath(
                "Library/Mobile Documents/com~apple~CloudDocs/Important/exports/github.tar.gz"
            ),
        )
        moved_github = True

if moved_github and not moved_strava:
    print("Moved only github export")
elif not moved_github and moved_strava:
    print("Moved only strava export")
else:
    print("Moved no exports")
