#!/bin/bash

# Dependency: This script requires Swift, AppKit and SwiftUI

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Create Repository
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName GitHub
# @raycast.icon images/github-logo.png
# @raycast.iconDark images/github-logo-iconDark.png

# Parameters
# @raycast.argument1 { "type": "text", "placeholder": "Repository name" }

# Documentation:
# @raycast.author Thiago Holanda
# @raycast.authorURL https://twitter.com/tholanda
# @raycast.description Create repository on GitHub

access_token="29c033710d7ad2ab9fac2bee63973618e954288a" # Put here, between the double quotes your GitHub Access Token

current_file_name=$(basename "$0")
base_filename="github-create-repository"
swift_filename="$base_filename.swift"

if [ ! -f $base_filename ] && [ -f $swift_filename ]; then
    $(swiftc $swift_filename -emit-executable -o $base_filename)
fi

./$base_filename "$access_token" "$1"
