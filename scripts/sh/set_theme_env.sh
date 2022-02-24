#!/usr/bin/env bash

# getting current theme and defaul working directory
lwd=$pwd
dark=$(defaults read -g AppleInterfaceStyle 2> /dev/null)
if [[ $dark == *"Dark"* ]]; then
	echo "System is in Dark mode"
	dark=1
else
	echo "System is in Light mode"
	dark=0
fi

# setting application themes appropriately
cd ~/.config/kitty/
if (($dark == 1)); then
	echo 'Setting dark theme...'
	# kitty
	cat onedark.conf > current_theme.conf
	# tmux
	cd ~
	cat .tmuxline.dark.conf > .tmuxline.conf
elif (($dark == 0)); then
	echo 'Setting light theme...'
	# kitty
	cat onelight.conf > current_theme.conf
	# tmux
	cd ~
	cat .tmuxline.light.conf > .tmuxline.conf
else
	echo 'Setting dark theme...'
	# kitty
	cat onedark.conf > current_theme.conf
	# tmux
	cd ~
	cat .tmuxline.dark.conf > .tmuxline.conf
fi

cd $lwd
