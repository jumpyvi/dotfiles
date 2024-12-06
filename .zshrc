# ZSH Settings
autoload -U select-word-style
select-word-style bash

# -------- Plugins -------- #
source /home/jumpyvi/.local/programs/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/jumpyvi/.local/programs/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /home/jumpyvi/.local/programs/zsh-plugins/zsh-syntax/zsh-syntax-highlighting.plugin.zsh
source /home/jumpyvi/.local/programs/zsh-plugins/docker-zsh-completion/docker-zsh-completion.plugin.zsh
source /home/jumpyvi/.local/programs/zsh-plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
eval "$(starship init zsh)"


# -------- Autocompletion Keybinds -------- #
bindkey              '^I' menu-select
bindkey "$terminfo[kcbt]" menu-select
bindkey -M menuselect              '^I'         menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete
bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
zstyle -e ':autocomplete:*:*' list-lines 'reply=( $(( 5 )) )'


# -------- Ctrl -------- #
# Delete previous word
bindkey '^H' backward-kill-word
bindkey '^[[1;5D' backward-kill-word
# Ctrl+Left: Move backward by word
bindkey '^[[1;5D' backward-word
# Ctrl+Right: Move forward by word
bindkey '^[[1;5C' forward-word 
