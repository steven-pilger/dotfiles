# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="$PATH:$HOME/.local/bin"

if [ -n "$PS1" ]; then
    # Check if 'fish' is available
    if type fish >/dev/null 2>&1; then
        exec fish
    fi
fi
