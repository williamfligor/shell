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
