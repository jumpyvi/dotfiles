# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# CLI
alias cd='z'
alias docker-laser='docker rm $(docker ps -aq) --force'

# Dev tools
alias flutter='fvm flutter'

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
eval "$(fzf --bash)"
eval "$(starship init bash)"
#eval "$(oh-my-posh init bash --config ~/.posh.omp.json)"
eval "$(zoxide init bash)"
source ~/.local/programs/blesh/ble.sh
