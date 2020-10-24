# Defined in - @ line 1
function bu --wraps='brew update --force && brew upgrade --fetch-HEAD --display-times && brew cu -a -y --cleanup --no-brew-update' --description 'alias bu=brew update --force && brew upgrade --fetch-HEAD --display-times && brew cu -a -y --cleanup --no-brew-update'
  brew update --force && brew upgrade --fetch-HEAD --display-times && brew cu -a -y --cleanup --no-brew-update $argv;
end
