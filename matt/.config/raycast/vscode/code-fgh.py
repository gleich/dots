#!/usr/bin/env python3

# Dependency: This script requires the vscode CLI.
# Install code: https://code.visualstudio.com/docs/editor/command-line
#
# @raycast.schemaVersion 1
# @raycast.title Code Repo
# @raycast.mode silent
# @raycast.packageName Visual Studio Code
#
# Optional parameters:
# @raycast.icon 📁
# @raycast.currentDirectoryPath ~
# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Open a repo with fgh in vscode
# @raycast.author Matthew Gleich
# @raycast.authorURL https://github.mattglei.ch
# @raycast.argument1 { "type": "text", "placeholder": "Repository" }

import sys
import os

repo = sys.argv[1]

# Getting the path of the repo with fgh ls
repo_path = os.popen(f"fgh ls {repo}").read()

# Opening the path with the vscode cli
code_run = os.popen(f"code {repo_path}").read()

print(f"Opened {repo_path}")
