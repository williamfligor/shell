#/bin/zsh
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}-[%{$reset_color%}%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[cyan]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✘%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔%{$reset_color%}"

PROMPT='%{$fg[cyan]%}┌─[%{$reset_color%}%{$fg[green]%}%n%{$reset_color%}%{$fg[blue]%}@%{$reset_color%}%{$fg[red]%}%m%{$reset_color%}%{$fg[red]%}%{$fg[cyan]%}]-[%{$reset_color%}%{$fg[yellow]%}${(%):-%35<...<%~%<<}%{$reset_color%}%{$fg[cyan]%}]$(git_prompt_info)
%{$fg[cyan]%}└─[%{$fg[red]%}%]$%{$reset_color%}%{$fg[cyan]%}]⇒%{$reset_color%}  '
