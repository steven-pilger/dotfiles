# LOCALE
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ALIASES / ENV
source ~/.environ

# DEFAULT EXPORTS
export VISUAL=nvim
export EDITOR="$VISUAL"
set PATH $HOME/.poetry/bin/ $PATH

# VI Mode
fish_vi_key_bindings
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/ptgdk/Documents/conda/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
#
#
status --is-interactive; and source (pyenv init -|psub)
starship init fish | source
