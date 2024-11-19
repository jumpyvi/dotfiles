ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/programs}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

xhost +local: > /dev/null 2>&1

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

fpath+=~/.zfunc
autoload -Uz compinit
compinit
zinit cdreplay -q

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#office like controls
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word

if [[ $TERM != "dumb" ]]; then
  eval "$(starship init zsh)"
#eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/prompt.toml)"
fi

# Aliases
alias -- 'clr'='clear'

alias -- 'docker-purge'='$HOME/.scripts/zsh/docker-purge.zsh'


# Docker
docker-compose() {
  file=${1:-docker-compose.yml}
  docker compose -f "$file" up
}
alias -- 'dkc'='docker-compose'
alias -- 'dkp'='docker-purge'
alias -- 'dks'='docker stats'
alias -- 'dkx'='docker exec -it'

alias -- 'fuckpptx'='libreoffice --headless --invisible --convert-to pdf *.pptx'

function ls() {
  if command -v eza >/dev/null 2>&1; then
    eza --color=always --git --icons=always "$@"
  else
    command ls "$@"
  fi
}

function dir() {
  if command -v eza >/dev/null 2>&1; then
    eza --color=always --long --git --icons=always "$@"
  else
    command dir "$@"
  fi
}

function vi() {
  if command -v nvim>/dev/null 2>&1 ; then
    command nvim "$@"
  elif command -v vim >/dev/null 2>&1 ; then
    command vim "$@"
  elif command -v vi >/dev/null 2>&1 ; then
    command vi "$@"
  else
    command nano "$@"
  fi
}

#TOOLS PATH
export EDITOR="nvim";
export PATH="$PATH:/home/jumpyvi/.local/bin"
export PATH="$PATH:/home/jumpyvi/.cargo/bin"
export PATH="/home/jumpyvi/.local/programs/pixi/bin:$PATH"

#SSH
#export SSH_ASKPASS=/usr/bin/ksshaskpass
#export SSH_ASKPASS_REQUIRE=prefer

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
#eval "$(zellij setup --generate-auto-start zsh)"
alias neofetch="fastfetch"
eval "$(pixi completion --shell zsh)"
eval $(thefuck --alias)
