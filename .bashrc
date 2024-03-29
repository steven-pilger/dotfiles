# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="$PATH:$HOME/.local/bin"

# source: https://unix.stackexchange.com/a/360986
case "$-" in
    *i*)        ;;
    *)   return ;;
esac

# Fish exclude machines, partial matches are also supported, e.g. slurm.
exclude_machines=(
    "slurm"
    "green-ext"
    #"hjort"
)
exclude_machines_list=$(IFS="|"; echo "${exclude_machines[*]}")

# Detect the platform (similar to $OSTYPE)
OS="`uname`"
case $OS in
  'Linux')
    OS='Linux'
    # Check if libpcre2-32.so.0 is installed
    if ! ldconfig -p | grep -q libpcre2-32.so.0; then
        echo "Error: libpcre2-32.so.0 is not installed."
    else
        if uname -n | egrep -q $exclude_machines_list; then
            # Do something if the machine is in the list
            echo 'Machine in list of excluded machines for fish shell. Using fallback.'
        else
            if command -v fish > /dev/null 2>&1 ; then
               exec fish
            fi
        fi
    fi
    ;;
  'FreeBSD')
    OS='FreeBSD'
    ;;
  'WindowsNT')
    OS='Windows'
    ;;
  'Darwin') 
    OS='Mac'
    if command -v fish > /dev/null 2>&1 ; then
       exec fish
    fi
    ;;
  *) ;;
esac

# if [ -n "$PS1" ]; then
#     # Check if 'fish' is available
#     if type fish >/dev/null 2>&1; then
#         exec fish
#     fi
# fi

