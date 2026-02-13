alias c="clear"
alias vi="nvim"
alias vim="nvim"
alias q="exit"
alias l="ls"
alias sl="ls"
alias cpwd="pwd | pbcopy"
alias pcd="cd (pbpaste)"
alias ore="omf reload"
alias cat="bat -n --theme=OneHalfDark"
alias work="sudo bless -mount /Volumes/kcf -setBoot && sudo shutdown -r now"

# go
alias gmt="go mod tidy"
alias goup="go get -u ./... && go mod tidy && git add . && git commit -m \"chore[deps]: upgrade all\" && gp"

# git
alias gp="git push"
alias gs="git status"
alias gl="git log --no-decorate"
alias gpu="git pull"
alias gcd="cd (git rev-parse --show-toplevel)"

# lazygit
alias lg="lazygit"

# gh
alias gv="gh repo view -w"
alias cl="gh repo clone"
alias wl="gh run list --limit 10"
alias wlw="watch -n 5 -c 'script -q /dev/null gh run list --limit 10 | sed -E \"s/^.*(STATUS)/\1/\"'"
alias ww="gh run watch"
alias wv="gh run view --log"
alias wvf="gh run view --log-failed"

# resin
alias gmap="resin -a -p"
alias gma="resin -a"
