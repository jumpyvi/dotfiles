if status is-interactive
    bind \b backward-kill-word
end
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
set -U fish_greeting
abbr -a vi nvim
abbr -a dk docker
alias cd="z"

starship init fish | source
zoxide init fish | source
