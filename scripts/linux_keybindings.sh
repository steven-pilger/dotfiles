#!/usr/bin/env bash

xmodmap -e "keysym Meta_L = Multi_key"
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
