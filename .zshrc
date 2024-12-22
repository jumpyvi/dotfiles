for config_file in ~/.zsh/*.zsh; do
    source "$config_file"
done

xhost +local: > /dev/null 2>&1

autoload -Uz compinit
compinit -D


##Files
#History
HISTFILE=$HOME/.zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups

function clean-paste() {
    local content
    # Read the pasted content
    content=$(</dev/stdin)
    # Remove trailing newlines
    content=${content%$'\n'}
    # Insert the cleaned-up content into the line editor
    print -rn -- "$content"
}

# Bind Shift+Insert or Ctrl+Shift+V to the custom paste widget
zle -N clean-paste
bindkey '^[[27;5;86~' clean-paste       # Common sequence for Shift+Insert

