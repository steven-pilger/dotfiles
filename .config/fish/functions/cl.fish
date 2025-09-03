# Defined in - @ line 1
function cl --wraps='clear && ls' --description 'alias cl=clear && ls'
  clear -x && ls $argv;
end
