# Scripts
alias update="sh /Users/matt/github/Matt-Gleich/public/python/scripts/update.sh"
alias fetch="cd /Users/matt/github/Matt-Gleich/public/shell/dots/bin/fetch && poetry run python3 main.py"
alias mindnode="cd /Users/matt/github/Matt-Gleich/public/python/scripts/ && poetry run python3 mindnode.py"

alias ls="exa -a --grid --icons --group-directories-first --classify"
alias lsa="exa -la --icons --git --group-directories-first --classify"
alias tree="exa -a --icons --tree --group-directories-first --classify"
alias cat="bat"
alias vim="nvim"
alias dc="cd"
alias sl="ls"
alias rick="curl -s -L http://bit.ly/10hA8iC | bash"
alias cpwd="pwd | pbcopy"
alias weather="curl wttr.in"

alias clock="tty-clock -tSbBc"
alias ra="ranger"
alias v="nvim"
alias c="clear"
alias pimportsort="pub run import_sorter:main"
alias fimportsort="flutter pub run import_sorter:main"
alias t="touch"
alias finfo="exa --long --extended "

# git
alias gst="git status"
alias gpu="git pull"
alias gp="git push"
alias gm="gitmoji --commit"
alias gma="git add . && gitmoji --commit"
alias gmp="gitmoji --commit && git push"
alias gl="git log"

eval $(thefuck --alias)
