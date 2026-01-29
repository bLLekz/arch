PROMPT='%n@%m: [%~] > '
RPROMPT='[%*]'

# Shift + Left/Right to select character by character
bindkey "\e[1;2D" backward-char-fully
bindkey "\e[1;2C" forward-char-fully

# Ctrl + Left/Right to move word by word
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e[5C" forward-word
bindkey "^[[D" backward-word
bindkey "^[[C" forward-word

# Ctrl + Shift + Left/Right to select word by word
bindkey "\e[1;6D" select-backward-word
bindkey "\e[1;6C" select-forward-word

# Shift + Home/End to select to start/end of line
bindkey "\e[1;2H" select-line-beginning
bindkey "\e[1;2F" select-line-end

# Ctrl + Shift + Home/End
bindkey "\e[1;6H" select-line-beginning
bindkey "\e[1;6F" select-line-end
