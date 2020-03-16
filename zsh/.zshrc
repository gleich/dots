# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/matthewgleich/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="norm"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    wakatime
    )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias q=exit
alias c=clear
alias h=history
alias pd=pwd
alias t=time
alias v=vim
alias gc="git commit -m"
alias gs="git status"
alias gitb="cd ~/Documents/Github"
alias p=python3
alias sl=ls
alias pdfmv="python3 ~/Documents/Github/School/School_Papers/Automation-Scripts/move-pdf-files.py"
alias mktex="python3 ~/Documents/Github/School/School_Papers/Automation-Scripts/make-template.py"
alias aco="python3 ~/Documents/Github/School/School_Papers/Automation-Scripts/auto-commit.py"
alias study='open -na "Google Chrome" --args --incognito "https://www.youtube.com/watch?v=PErqizZqLjI"'
alias dsa="docker ps -a"
alias dp="docker system prune -a"
alias per="cd ~/Documents/Github/Personal"
alias sch="cd ~/Documents/Github/School/School_Papers"
alias robo="cd ~/Documents/Github/Robotics"
alias da="dart"
alias ta=task
alias gcom='open -na "Google Chrome" --args "https://github.com/Matt-Gleich"'
alias updateEverything="brew update && brew upgrade && brew cask upgrade && flutter upgrade && brew cleanup"
alias gitkraken="/Applications/GitKraken.app/Contents/MacOS/GitKraken -p "
alias cat=ccat
alias dcu="docker-compose up -d"
alias dcd="docker compose down && docker system prune -a"
alias snake='open -a "Google Chrome" --args "https://www.google.com/fbx?fbx=snake_arcade"'
cd ~/Documents/Github;

# added by travis gem
[ -f /Users/matthewgleich/.travis/travis.sh ] && source /Users/matthewgleich/.travis/travis.sh

# Homebrew
export PATH=/usr/local/bin:$PATH

# fuck alias
eval "$(thefuck --alias)"

# Flutter:
export PATH="$PATH:/Users/matthewgleich/development/flutter/bin"
export ENABLE_FLUTTER_DESKTOP=true
source /Users/matthewgleich/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Dart Pub
export PATH="$PATH":"$HOME/.pub-cache/bin"

