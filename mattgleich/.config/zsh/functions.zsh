# cd with fgh (https://github.com/Matt-Gleich/fgh)
fcd() { cd "$(fgh ls "$@" 2>/dev/null)" || ( echo "Failed to find repository" && return 1; ) }

# Copy cat output to clipboard
ccat() { cat "$@" | pbcopy }

# cd into a config directory with ease
conf() { cd ~ && cd ~/.config/"$@" }

