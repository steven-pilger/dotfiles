# Defined in - @ line 1
function bu --description 'brew update for all apps and casks'
  sudo echo 'Running Upgrades...'
  brew cleanup --scrub --prune=all
  brew update --force && brew upgrade --force --greedy $argv;
end
