# Defined in /tmp/fish.9lmHnb/ctags.fish @ line 2
function ctags --wraps=/usr/local/bin/ctags --wraps=/usr/bin/ctags --description 'alias ctags=/usr/bin/ctags'
  switch (uname)
  case Darwin
    /usr/local/bin/ctags  $argv;
  case Linux
    /usr/bin/ctags  $argv;
  end
end
