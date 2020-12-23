# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

source /usr/local/share/antigen/antigen.zsh

# antigen
antigen theme romkatv/powerlevel10k

antigen use oh-my-zsh

antigen bundle wbingli/zsh-wakatime
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

# Sourcing files
source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh
source ~/.p10k.zsh
source $HOME/.cargo/env

