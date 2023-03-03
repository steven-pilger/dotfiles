# LOCALE
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ALIASES / ENV
source ~/.environ

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# DEFAULT EXPORTS
# reset PATH
export VISUAL=nvim
export EDITOR="$VISUAL"
set PATH $HOME/.local/bin/ $PATH

# VI Mode
fish_vi_key_bindings
bind \cx\ce edit_command_buffer

# Pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source
# status is-login; and pyenv init --path | source

# Starship
starship init fish | source

export NVM_DIR=$HOME/.nvm


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/steven/google-cloud-sdk/path.fish.inc' ]; . '/Users/steven/google-cloud-sdk/path.fish.inc'; end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniforge/base/bin/conda
    eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

