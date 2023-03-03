# Defined in - @ line 1
function tmux --wraps='TERM=xterm-256color /opt/homebrew/bin/tmux' --description 'alias tmux=TERM=xterm-256color /usr/local/bin/tmux'
  TERM=xterm-256color /opt/homebrew/bin/tmux $argv;
end
