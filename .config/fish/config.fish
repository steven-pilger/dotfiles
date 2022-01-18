# LOCALE
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ALIASES / ENV
source ~/.environ

# DEFAULT EXPORTS
# reset PATH
export VISUAL=nvim
export EDITOR="$VISUAL"
set PATH $HOME/.poetry/bin/ $PATH
set PATH $HOME/.pyenv/bin/ $PATH

# VI Mode
fish_vi_key_bindings

# set DEVICE (uname -n)
# if test $DEVICE = 'srv01312'
#     eval /compute/miniconda3/condabin/conda "shell.fish" "hook" $argv | source
# else if test $DEVICE = 'mbpro.wombat'
#     eval /usr/local/bin/conda "shell.fish" "hook" $argv | source
# else if test $DEVICE = 'PTGDK-MBPro'
#     # eval (minikube docker-env)
#     eval $HOME/Documents/conda/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# else
#     eval $HOME/Documents/conda/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# end
# 
# Pyenv
status is-login; and pyenv init --path | source
# pyenv init - | source
# Starship
starship init fish | source
