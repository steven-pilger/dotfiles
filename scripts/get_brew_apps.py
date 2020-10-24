#!/usr/bin/env python3

import subprocess

def get_brew_apps():
    cmd = ['brew', 'cask', 'list']
    prc = subprocess.run(cmd, stdout=subprocess.PIPE)
    
    return prc.stdout.decode('UTF-8').splitlines()


if __name__ == "__main__":
    apps = get_brew_apps()
    out_string = ''
    for i in apps:
        out_string += i + ' '
    print(out_string)

