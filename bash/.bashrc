# If not running interactively, don't do anything.
[ -z "$PS1" ] && return
#Bash files home
MISC=~/.misc/

# History settings, self explanatory.
export HISTCONTROL="ignoreboth:erasedups"
export HISTIGNORE="&:ls:cd ~:cd ..:[bf]g:exit:h:history"
export HISTFILESIZE="300000"
export HISTSIZE="100000"

# PWD for PS1
export MYPS='$(echo -n "${PWD/#$HOME/~}" | awk -F "/" '"'"'{if (length($0) > 14) { if (NF>4) print $1 "/" $2 "/.../" $(NF-1) "/" $NF; else if (NF>3) print $1 "/" $2 "/.../" $NF; else print $1 "/.../" $NF; } else print $0;}'"'"')'

# Vi/VIM style Bash keybindings. Enable this if you like those.
set -o vi

# Bash options, some of these are already set by default, but to be safe I've defined them here again.
shopt -s cdspell                 # Try to correct spelling errors in the cd command.
#shopt -s checkjobs               # Warn if there are stopped jobs when exiting - May not work on all versions.
shopt -s checkwinsize            # Check window size after each command and update as nescessary.
shopt -s cmdhist                 # Try to save all multi-line commands to one history entry.
#shopt -s dirspell                # Try to correct spelling errors for glob matching - May not work on all versions.
shopt -s dotglob                 # include files beginning with a dot in pathname expansion (pressing TAB).
shopt -s expand_aliases          # Self explanatory.
shopt -s extglob                 # Enable extended pattern matching.
shopt -s extquote                # Command line quoting stuff.
shopt -s force_fignore           # Force ignore for files if FIGNORE is set.
shopt -s histappend              # Self explanatory.
shopt -s hostcomplete            # Complete hostnames (TAB).
shopt -s interactive_comments    # Allowing commenting, in an interactive shell.
shopt -s login_shell             # Bash is the login shell, obviously.
shopt -s no_empty_cmd_completion # Self explanatory.
# shopt -s nocaseglob              # Case insensitive pathname expansion (TAB) - you may want to turn this off.
shopt -s progcomp                # Programmable completion stuff.
shopt -s promptvars              # Expansion stuff for prompt strings.
shopt -s sourcepath              # The source command will use the PATH variable.

# Make less more friendly for non-text input files.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If working in a chroot set the variable identifying it.
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot="$(cat /etc/debian_chroot)"
fi

# Reset.
Colour_Off="\e[0m"      # Text Reset.

# Regular Colours.
Black="\e[0;30m"        # Black.
Red="\e[0;31m"          # Red.
Green="\e[0;32m"        # Green.
Yellow="\e[0;33m"       # Yellow.
Blue="\e[0;34m"         # Blue.
Purple="\e[0;35m"       # Purple.
Cyan="\e[0;36m"         # Cyan.
White="\e[0;37m"        # White.

# Bold.
BBlack="\e[1;30m"       # Black.
BRed="\e[1;31m"         # Red.
BGreen="\e[1;32m"       # Green.
BYellow="\e[1;33m"      # Yellow.
BBlue="\e[1;34m"        # Blue.
BPurple="\e[1;35m"      # Purple.
BCyan="\e[1;36m"        # Cyan.
BWhite="\e[1;37m"       # White.

# Underline.
UBlack="\e[4;30m"       # Black.
URed="\e[4;31m"         # Red.
UGreen="\e[4;32m"       # Green.
UYellow="\e[4;33m"      # Yellow.
UBlue="\e[4;34m"        # Blue.
UPurple="\e[4;35m"      # Purple.
UCyan="\e[4;36m"        # Cyan.
UWhite="\e[4;37m"       # White.

# Background.
On_Black="\e[40m"       # Black.
On_Red="\e[41m"         # Red.
On_Green="\e[42m"       # Green.
On_Yellow="\e[43m"      # Yellow.
On_Blue="\e[44m"        # Blue.
On_Purple="\e[45m"      # Purple.
On_Cyan="\e[46m"        # Cyan.
On_White="\e[47m"       # White.

# High Intensty.
IBlack="\e[0;90m"       # Black.
IRed="\e[0;91m"         # Red.
IGreen="\e[0;92m"       # Green.
IYellow="\e[0;93m"      # Yellow.
IBlue="\e[0;94m"        # Blue.
IPurple="\e[0;95m"      # Purple.
ICyan="\e[0;96m"        # Cyan.
IWhite="\e[0;97m"       # White.

# Bold High Intensty.
BIBlack="\e[1;90m"      # Black.
BIRed="\e[1;91m"        # Red.
BIGreen="\e[1;92m"      # Green.
BIYellow="\e[1;93m"     # Yellow.
BIBlue="\e[1;94m"       # Blue.
BIPurple="\e[1;95m"     # Purple.
BICyan="\e[1;96m"       # Cyan.
BIWhite="\e[1;97m"      # White.

# High Intensty backgrounds.
On_IBlack="\e[0;100m"   # Black.
On_IRed="\e[0;101m"     # Red.
On_IGreen="\e[0;102m"   # Green.
On_IYellow="\e[0;103m"  # Yellow.
On_IBlue="\e[0;104m"    # Blue.
On_IPurple="\e[10;95m"  # Purple.
On_ICyan="\e[0;106m"    # Cyan.
On_IWhite="\e[0;107m"   # White.

# Turn on colours.
case "$TERM" in
    *color*)
    color_prompt=yes;;
esac


#case "$TERM" in
#*xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
#    PROMPT_COMMAND='echo -ne "${USER}@${HOSTNAME}\007"'
#    ;;
#*)
#    ;;
#esac

# Prompt, looks like:
# ┌─[username@host]-[time date]-[directory]
# └─[$]->
export PS1="\[$Cyan\]┌─[\[$Green\]\u\[$Blue\]@\[$Red\]\h\[$Cyan\]]-[\[$BYellow\]$(eval 'echo ${MYPS}')\[$Cyan\]]\n\[$Cyan\]└─[\[$Purple\]\$\[$Cyan\]]->\[$Colour_Off\] "
export PS2="\[$Cyan\]Secondary->\[$Colour_Off\] "
export PS3="\[$Cyan\]Select option->\[$Colour_Off\] "
export PS4="\[$Cyan\]+xtrace $LINENO->\[$Colour_Off\] "

# Make MAN pages look better, with some color and formatting.
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;38;5;74m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[38;5;246m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[04;38;5;146m'


# Turn on completion.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

MISC=~/.misc/

# Load External BASH
if [ -f $MISC/.aliases ]; then
    source $MISC/.aliases
fi

# Load External BASH
if [ -f $MISC/.functions ]; then
    source $MISC/.functions
fi

# Load External BASH
if [ -f $MISC/.exports ]; then
    source $MISC/.exports
fi

# Load External BASH
if [ -f $MISC/.local ]; then
    source $MISC/.local
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
command -v archey >/dev/null 2>&1 && archey

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
