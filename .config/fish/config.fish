if status is-interactive
 eval (zellij setup --generate-auto-start fish | string collect)
end

alias ls="eza --color=always --git --icons=always"
alias dir="eza --color=always --long --git"
alias clr="clear"



export EDITOR="nvim";
export DOTNET_ROOT="/home/linuxbrew/.linuxbrew/Cellar/dotnet/8.0.4/libexec";
export PATH="$PATH:/home/jumpyvi/.dotnet/tools";
export PATH="$PATH:/home/jumpyvi/.local/bin"



starship init fish | source
