# Scripts
alias update="sh /Users/matt/Desktop/Matt-Gleich/public/python/scripts/update.sh"
alias mindnode="cd /Users/matt/Desktop/Matt-Gleich/public/python/scripts/ && poetry run python3 mindnode.py"

alias ls="exa -l -a --icons --group-directories-first"
alias tree="exa -a --icons --tree --group-directories-first"
alias cat="bat"
alias vim="nvim"
alias dc="cd"
alias sl="ls"
alias rick="curl -s -L http://bit.ly/10hA8iC | bash"
alias cpwd="pwd | pbcopy"
alias weather="curl wttr.in"

alias clock="tty-clock -tSbBc"
alias ra="ranger"
alias nv="nvim"
alias c="clear"
alias pimportsort="pub run import_sorter:main"
alias fimportsort="flutter pub run import_sorter:main"
alias t="touch"

# git
alias gst="git status"
alias gpu="git pull"
alias gp="git push"
alias gm="gitmoji --commit"
alias gmp="gitmoji --commit && git push"
alias gl="git log"

eval $(thefuck --alias)
