# cd with fgh (https://github.com/Matt-Gleich/fgh)
fcd() { cd "$(fgh ls "$@" 2>/dev/null)" || ( echo "Failed to find repository" && return 1; ) }

ccat() { cat "$@" | pbcopy }
conf() { cd ~/.config/"$@" }

