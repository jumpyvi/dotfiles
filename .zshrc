source /home/linuxbrew/.linuxbrew/share/antigen/antigen.zsh
autoload -Uz compinit
compinit

antigen use oh-my-zsh

antigen bundle git
antigen bundle sudo
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

alias ls="eza --color=always --git --icons=always"
alias dir="eza --color=always --long --git"

if [[ $TERM != "dumb" ]]; then
  eval "$(starship init zsh)"
fi

# Aliases
alias -- 'clr'='clear'

export EDITOR="nvim";
export DOTNET_ROOT="/home/linuxbrew/.linuxbrew/Cellar/dotnet/8.0.4/libexec";
export PATH="$PATH:/home/jumpyvi/.dotnet/tools";
export SSH_ASKPASS=/usr/bin/ksshaskpass
export SSH_ASKPASS_REQUIRE=prefer

eval $(thefuck --alias f)

