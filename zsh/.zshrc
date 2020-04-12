# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zmodload zsh/zprof

MISC=~/.console-includes/
source $MISC/aliases
source $MISC/functions
source $MISC/exports

# Load External BASH
if [ -f $MISC/local ]; then
    source $MISC/local
fi

setopt PROMPT_SUBST

if [ ! -f ~/.zsh_plugins.sh ]; then
    zsh_plugin_gen
fi
source ~/.zsh_plugins.sh


# Stop sharing history between terminals. It's annoying
unsetopt SHARE_HISTORY

autoload compinit && compinit
zstyle ':completion:*' menu select

# zprof

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
