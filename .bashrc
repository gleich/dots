fortune -s | cowsay -f tux

PROMPT_COMMAND='PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"'

alias q=exit
alias c=clear
alias h=history
alias pd=pwd
alias t=time
alias v=vim
alias gc="git commit -m"
alias root="cd ~"
alias gs="git status"
alias gitb="cd Documents/Github"
alias p=python

source bash-wakatime/bash-wakatime.sh;
cd Documents/Github;
