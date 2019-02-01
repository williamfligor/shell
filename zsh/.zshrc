source ~/shell/zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle vi-mode
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme agnoster

antigen apply

MISC=~/.console-includes/
source $MISC/aliases
source $MISC/functions
source $MISC/exports

# Load External BASH
if [ -f $MISC/local ]; then
    source $MISC/local
fi
