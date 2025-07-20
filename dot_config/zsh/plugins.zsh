source /home/linuxbrew/.linuxbrew/opt/zinit/zinit.zsh
unalias zi 2>/dev/null

zinit light zsh-users/zsh-autosuggestions
zinit light hlissner/zsh-autopair
zinit light hcgraf/zsh-sudo
zinit light zdharma-continuum/fast-syntax-highlighting

zinit load 'zsh-users/zsh-history-substring-search'
zinit ice wait atload'_history_substring_search_config'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zinit ice wait lucid
zinit light Aloxaf/fzf-tab

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'