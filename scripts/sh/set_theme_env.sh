#!/usr/bin/env bash

# Determine the operating system
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    dark=$(defaults read -g AppleInterfaceStyle 2> /dev/null)
    if [[ $dark == *"Dark"* ]]; then
        echo "macOS is in Dark mode"
        dark=1
    else
        echo "macOS is in Light mode"
        dark=0
    fi
    kitty=/opt/homebrew/bin/kitty
    tmux=/opt/homebrew/bin/tmux
elif [[ "$(uname)" == "Linux" ]]; then
    # Ubuntu/Linux
    theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
    if [[ $theme == *"dark"* || $theme == *"night"* ]]; then
        echo "Ubuntu/Linux is in Dark mode"
        dark=1
    else
        echo "Ubuntu/Linux is in Light mode"
        dark=0
    fi
    kitty=kitty
    tmux=tmux
else
    echo "Unsupported operating system"
    exit 1
fi

# setting application themes appropriately
if (($dark == 1)); then
	echo 'Setting dark theme...'
	# kitty
	$kitty +kitten themes --reload-in=all Catppuccin-Frappe
	# tmux
	cat .tmuxline.dark.conf > .tmuxline.conf
	$tmux source ~/.tmux.conf
elif (($dark == 0)); then
	echo 'Setting light theme...'
	# kitty
	$kitty +kitten themes --reload-in=all Catppuccin-Latte
	# tmux
	cat .tmuxline.light.conf > .tmuxline.conf
	$tmux source ~/.tmux.conf
else
	echo 'Setting dark theme...'
	# kitty
	$kitty +kitten themes --reload-in=all Catppuccin-Frappe
	# tmux
	cat .tmuxline.dark.conf > .tmuxline.conf
	$tmux source ~/.tmux.conf
fi
cd $lwd

