#!/bin/bash

# Dependency: This script requires texsch
# Install code: https://ll.mattglei.ch/g/texsch/
#
# @raycast.schemaVersion 1
# @raycast.title texsch separate
# @raycast.mode silent
# @raycast.packageName texsch
#
# Optional parameters:
# @raycast.icon 📂
# @raycast.currentDirectoryPath ~/github/Matt-Gleich/private/tex/Junior-Year

# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Separate the PDF files from the LaTeX files
# @raycast.author Matthew Gleich
# @raycast.authorURL https://github.mattglei.ch

texsch separate >> /dev/null

echo "Separated Files"
