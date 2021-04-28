# Scripts
alias update="sh /Users/matt/src/Matt-Gleich/public/python/scripts/update.sh"
alias fetch="cd /Users/matt/src/Matt-Gleich/public/shell/dots/bin/fetch && poetry run python3 main.py"
alias mindnode="cd /Users/matt/src/Matt-Gleich/public/python/scripts/ && poetry run python3 mindnode.py"

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
alias sch="fcd Junior-Year"

alias clock="tty-clock -SbBc"
alias ra="ranger"
alias v="nvim"
alias c="clear"
alias pimportsort="pub run import_sorter:main"
alias fimportsort="flutter pub run import_sorter:main"
alias t="touch"
alias md="mkdir"
alias finfo="exa --long --extended "

# git
alias gst="git status"
alias gpu="git pull"
alias gp="git push"
alias gm="gitmoji --commit"
alias gma="git add . && git status && gitmoji --commit"
alias gl="git log"

# Docker
alias dcup="docker-compose up"
alias dcdn="docker-compose down"
alias dsprune="docker system prune -a"
