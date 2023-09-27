# Defined in - @ line 1
function bu --description 'brew update for all apps and casks'
  brew update --force && brew upgrade --casks --greedy $argv;
end
