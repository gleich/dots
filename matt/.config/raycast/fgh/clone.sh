#!/bin/bash

# Dependency: This script requires the vscode CLI.
# Install code: https://code.visualstudio.com/docs/editor/command-line
#
# @raycast.schemaVersion 1
# @raycast.title fgh clone
# @raycast.mode fullOutput
# @raycast.packageName fgh
#
# Optional parameters:
# @raycast.icon ⬇️
# @raycast.currentDirectoryPath ~/.config/
# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Open something from .config with vscode
# @raycast.author Matthew Gleich
# @raycast.authorURL https://github.mattglei.ch
# @raycast.argument1 { "type": "text", "placeholder": "OWNER/NAME" }

fgh clone $1
