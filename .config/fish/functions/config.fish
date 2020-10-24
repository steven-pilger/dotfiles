# Defined in - @ line 1
function config --wraps='/usr/bin/git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME' --wraps='/usr/bin/git --git-dir=$HOME/dotfiles-repo/ --work-tree=$HOME/' --description 'alias config=/usr/bin/git --git-dir=$HOME/dotfiles-repo/ --work-tree=$HOME/'
  /usr/bin/git --git-dir=$HOME/dotfiles-repo/ --work-tree=$HOME/ $argv;
end
