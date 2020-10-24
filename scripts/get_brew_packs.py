#!/usr/bin/env python3

import subprocess

def get_brew_packs():
    cmd = ['brew', 'leaves']
    prc = subprocess.run(cmd, stdout=subprocess.PIPE)
    
    return prc.stdout.decode('UTF-8').splitlines()


if __name__ == "__main__":
    packs = get_brew_packs()
    out_string = ''
    for i in packs:
        out_string += i + ' '
    print(out_string)

