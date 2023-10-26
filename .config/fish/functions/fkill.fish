function fkill
    kill (ps ax --no-headers -o pid,comm | fzf --header "Select process to kill"| awk '{print $1}') $argv
end
