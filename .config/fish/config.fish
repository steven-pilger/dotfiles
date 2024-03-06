# Disable greeting
set -g fish_greeting

# LOCALE
set LC_ALL en_US.UTF-8
set LANG en_US.UTF-8

# ALIASES / ENV
source ~/.environ
set -x TERM xterm-256color

# Homebrew
switch (uname)
case Darwin
  eval (/opt/homebrew/bin/brew shellenv)
end

# DEFAULT EXPORTS
# reset PATH
set VISUAL nvim
set EDITOR $VISUAL

# VI Mode
set -g fish_key_bindings fish_vi_key_bindings
bind -M insert \cc kill-whole-line repaint
bind \cx\ce edit_command_buffer

# Pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
# set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

if command -q pyenv
  pyenv init - | source
end

# Starship
if command -q starship
  starship init fish --print-full-init | source
end

if command -q zoxide
  zoxide init --cmd cd fish | source
end

if command -q eza
  alias ls='eza'
  alias ll='eza -l'
end

# NVM
set NVM_DIR $HOME/.nvm
# load_nvm > /dev/stderr

