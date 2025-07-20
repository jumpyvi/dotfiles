# History file path
HISTFILE=~/.config/.zsh_history

# Number of history lines to save in memory and file
HISTSIZE=10000
SAVEHIST=10000

# History options
setopt APPEND_HISTORY              # Append history instead of overwriting
setopt HIST_IGNORE_DUPS            # Don't record duplicate commands
setopt HIST_IGNORE_SPACE           # Don't record commands starting with a space
setopt SHARE_HISTORY               # Share history across all sessions