MISC=~/.console-includes/
source $MISC/aliases
source $MISC/functions
source $MISC/exports

# Load External BASH
if [ -f $MISC/local ]; then
    source $MISC/local
fi

setopt PROMPT_SUBST

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

# Stop sharing history between terminals. It's annoying
unsetopt SHARE_HISTORY

autoload compinit && compinit
zstyle ':completion:*' menu select
