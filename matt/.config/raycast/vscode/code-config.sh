#!/bin/bash

# Dependency: This script requires the vscode CLI.
# Install code: https://code.visualstudio.com/docs/editor/command-line
#
# @raycast.schemaVersion 1
# @raycast.title Code Config
# @raycast.mode silent
# @raycast.packageName Visual Studio Code
#
# Optional parameters:
# @raycast.icon ⚙️
# @raycast.currentDirectoryPath ~/.config/
# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Open something from .config with vscode
# @raycast.author Matthew Gleich
# @raycast.authorURL https://github.mattglei.ch
# @raycast.argument1 { "type": "text", "placeholder": "program" }

code $1
echo "Opened ~/.config/$1"
