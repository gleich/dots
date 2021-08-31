# scripts
alias update="sh ~/src/gleich/public/shell/scripts/update.sh"
alias fetch="cd ~/src/gleich/public/vim-script/dots/bin/fetch && poetry run python3 main.py"
alias mindnode="cd ~/src/gleich/public/shell/scripts/ && poetry run python3 mindnode.py"

alias ls="exa -a --git --icons --group-directories-first --classify"
alias lsa="exa -la --git --icons --group-directories-first --classify"
alias tree="exa -a --tree --git-ignore --icons --group-directories-first --classify"
alias cat="bat"
alias icat="kitty +kitten icat"
alias dc="cd"
alias sl="ls"
alias rick="curl -s -L http://bit.ly/10hA8iC | bash"
alias cpwd="pwd | pbcopy"
alias ccd="cd (printf '%s' (pbpaste))"
alias weather="curl wttr.in"
alias sch="fcd junior"
alias tmp="cd ~/tmp"
alias tv="cd ~/src/gleich/private/tex/junior && zathura (fzf)"
alias lg="lazygit"
alias q="exit"
alias ssh="kitty +kitten ssh"
alias sch="fcd senior"

alias clock="tty-clock -SbBc"
alias ra="ranger"
alias c="clear"
alias pimportsort="pub run import_sorter:main"
alias fimportsort="flutter pub run import_sorter:main"
alias t="touch"
alias md="mkdir"

# neovim/vim/vi
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias iv="nvim"

# git
alias gst="git status"
alias gpu="git pull"
alias gp="git push"
alias gm="resin"
alias gma="resin -a"
alias gmap="resin -a -p"
alias gl="git log"
alias amenda="git add . && git commit --amend --no-edit"
alias gb="git checkout -b"

# github
alias gv="gh repo view -w"
alias ni="gh issue create"
alias ci="gh workflow view"

# texsch
alias autob="texsch auto-build"
alias new="texsch create"
