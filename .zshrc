source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
source /home/jumpyvi/.local/other-apps/antigen.zsh
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

#TOOLS PATH
export EDITOR="nvim";
export CHROME_EXECUTABLE=/home/jumpyvi/.local/bin/thorium-browser

#DOTNET
export DOTNET_ROOT="/home/jumpyvi/.nix-profile";
export PATH="$PATH:/home/jumpyvi/.dotnet/tools";

#SSH
export SSH_ASKPASS=/usr/bin/ksshaskpass
export SSH_ASKPASS_REQUIRE=prefer
