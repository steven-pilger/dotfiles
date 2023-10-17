# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -n "$PS1" ]; then
    # Check if 'fish' is available
    if type fish >/dev/null 2>&1; then
        exec fish
    fi
fi
