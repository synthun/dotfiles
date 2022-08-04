#!/bin/bash

echo "!! THIS SCRIPT IS A WORK IN PROGRESS AND IS NOT GUARANTEED TO WORK !!"
echo

# check if user has doas or sudo installed

if [ -x "$(command -v /bin/sudo)" ]; then
	root='sudo'
fi

if [ -x "$(command -v /bin/doas)" ]; then
	root='doas'
fi

if [ -x "$(command -v /bin/doas)" -a -x "$(command -v /bin/sudo)" ]; then
	echo "both doas and sudo are installed on the system or symlink exists."
	read -p "use sudo? (y/n): " usesudo

	if [ $usesudo == 'y' ]; then
		root='sudo'
	elif [ $usesudo == 'n' ]; then
		root='doas'
	else
		echo "option $usesudo is invalid"
	fi
fi

echo using $root
echo

# installation

echo "available options: void"
read -p "enter your distro: " distro

if [ $distro == 'void' ]; then
	echo
	echo "updating system before beginning installation..."
	$root xbps-install -y -Su

	echo
	echo "installing tools and dependencies"
	$root xbps-install -y base-devel xorg-server libXft-devel libX11-devel libXinerama-devel git alacritty sxhkd dunst xsetroot nitrogen xauth xinit

	mkdir -p $HOME/.config && cd $HOME/.config
	
	config=$HOME/.config

	git clone https://github.com/synthun/dwm
	git clone https://github.com/synthun/dotfiles
	git clone https://github.com/synthun/fonts
	git clone https://github.com/synthun/dmenu

	cd $config/dwm
	$root make clean install
	
	cd $config/dmenu
	$root make clean install

	cp -r $config/dotfiles/alacritty $config
	cp -r $config/dotfiles/dunst $config
	cp -r $config/dotfiles/sxhkd $config
	cp $config/dotfiles/xinitrc $HOME/.xinitrc
	
	cd $config
	
	git clone https://github.com/synthun/fonts
	mkdir -p $HOME/.local/share/fonts
	cd fonts
	cp jetbrains-mono/* $HOME/.local/share/fonts
	cp san-francisco/* $HOME/.local/share/fonts
else
	echo "$distro does not exist"
fi
