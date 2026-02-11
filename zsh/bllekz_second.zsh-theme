USER_AND_HOSTNAME_="%n@%m"
PRE_="%(?:%{$fg_bold[green]%}$USER_AND_HOSTNAME_:%{$fg_bold[red]%}$USER_AND_HOSTNAME_)%{$reset_color%}"
CURRENT_PATH_="%{$fg[cyan]%}%~%{$reset_color%}"
GIT_INFO_=' $(git_prompt_info)'

DATE_="%D{%d.%m.%Y}"
TIME_="%*"

PROMPT="$PRE_: $CURRENT_PATH_$GIT_INFO_$ "
RPROMPT="[$DATE_ $TIME_]"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
