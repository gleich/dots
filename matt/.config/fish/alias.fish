# scripts
alias update="sh ~/src/Matt-Gleich/public/python/scripts/update.sh"
alias fetch="cd ~/src/Matt-Gleich/public/shell/dots/bin/fetch && poetry run python3 main.py"
alias mindnode="cd ~/src/Matt-Gleich/public/python/scripts/ && poetry run python3 mindnode.py"

alias ls="exa -a --grid --icons --group-directories-first --classify"
alias lsa="exa -la --icons --git --group-directories-first --classify"
alias tree="exa -a --icons --tree --group-directories-first --classify"
alias cat="bat"
alias dc="cd"
alias sl="ls"
alias rick="curl -s -L http://bit.ly/10hA8iC | bash"
alias cpwd="pwd | pbcopy"
alias ccd="cd (printf '%s' (pbpaste))"
alias weather="curl wttr.in"
alias sch="fcd junior"

alias clock="tty-clock -SbBc"
alias ra="ranger"
alias c="clear"
alias pimportsort="pub run import_sorter:main"
alias fimportsort="flutter pub run import_sorter:main"
alias t="touch"
alias md="mkdir"
alias finfo="exa --long --extended "

# neovim/vim/vi
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# git
alias gst="git status"
alias gpu="git pull"
alias gp="git push"
alias gm="resin"
alias gma="resin -a"
alias gmap="resin -a -p"
alias gl="git log"

# github
alias gv="gh repo view -w"
alias ni="gh issue create"
