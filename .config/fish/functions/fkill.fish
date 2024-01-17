function fkill
    kill (ps ax -o pid= -o comm= | fzf --header "Select process to kill"| awk '{print $1}') $argv
end
