ARROW_="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} )"
USER_AND_HOSTNAME_=" %{$fg[green]%}%n@%m%{$reset_color%}"
DELIMITER_="%{$fg[cyan]%}%~%{$reset_color%}"
GIT_INFO_=' $(git_prompt_info)'

DATE_="%D{%d.%m.%Y}"
TIME_="%*"

PROMPT="$ARROW_$USER_AND_HOSTNAME_$DELIMITER_$GIT_INFO_"
RPROMPT="[$DATE_ $TIME_]"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
