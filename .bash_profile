if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/matthewgleich/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/matthewgleich/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/matthewgleich/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/matthewgleich/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Flutter Addition:
export PATH="$PATH:/Users/matthewgleich/flutter/bin"

# Hub Addition (Github extra for git CLI)
eval "$(hub alias -s)"
