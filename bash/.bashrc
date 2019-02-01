# Prompt, looks like:
# ┌─[username@host]-[time date]-[directory]
# └─[$]->
export PS1="\[$Cyan\]┌─[\[$Green\]\u\[$Blue\]@\[$Red\]\h\[$Cyan\]]-[\[$BYellow\]$(eval 'echo ${MYPS}')\[$Cyan\]]\n\[$Cyan\]└─[\[$Purple\]\$\[$Cyan\]]->\[$Colour_Off\] "
export PS2="\[$Cyan\]Secondary->\[$Colour_Off\] "
export PS3="\[$Cyan\]Select option->\[$Colour_Off\] "
export PS4="\[$Cyan\]+xtrace $LINENO->\[$Colour_Off\] "

set -o vi

MISC=~/.console-includes/
source $MISC/aliases
source $MISC/functions
source $MISC/exports

# Load External BASH
if [ -f $MISC/.local ]; then
    source $MISC/.local
fi
