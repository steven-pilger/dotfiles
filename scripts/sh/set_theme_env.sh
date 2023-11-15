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
else
    echo "Unsupported operating system"
    exit 1
fi

lwd=$pwd

# setting application themes appropriately
cd ~/.config/kitty/
if (($dark == 1)); then
	echo 'Setting dark theme...'
	# kitty
	# cat onedark.conf > current_theme.conf
	kitty +kitten themes --reload-in=all Catppuccin-Frappe
	# fish
	fish_config theme save "Catppuccin Frappe"
	# tmux
	cd ~
	cat .tmuxline.dark.conf > .tmuxline.conf
elif (($dark == 0)); then
	echo 'Setting light theme...'
	# kitty
	# cat onelight.conf > current_theme.conf
	kitty +kitten themes --reload-in=all Catppuccin-Latte
	# tmux
	cd ~
	cat .tmuxline.light.conf > .tmuxline.conf
else
	echo 'Setting dark theme...'
	# kitty
	# cat onedark.conf > current_theme.conf
	kitty +kitten themes --reload-in=all Catppuccin-Frappe
	# tmux
	cd ~
	cat .tmuxline.dark.conf > .tmuxline.conf
fi

cd $lwd
