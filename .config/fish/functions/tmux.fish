function tmux --wraps='TERM=xterm-256color /opt/homebrew/bin/tmux'
  switch (uname)
  case Darwin
    TERM=xterm-256color /opt/homebrew/bin/tmux $argv
  case Linux
    TERM=xterm-256color /bin/tmux $argv
  end
end
