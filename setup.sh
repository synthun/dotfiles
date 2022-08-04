#!/bin/bash

# check if user has sudo or doas installed

if [ ! -e /bin/doas ] && [ -e /bin/sudo ]; then
	root=sudo
elif [ ! -e /bin/sudo ] && [ -e /bin/doas ]; then
	root=doas
elif [ -e /bin/sudo ] && [ -e /bin/doas ]; then
	echo "both sudo and doas are installed in the system or symlink exists."
	read -p "select a binary (sudo, doas): " sord

	case $sord in
		sudo) root=sudo ;;
		doas) root=doas ;;
		*) echo "error: binary $sord does not exist" && exit
	esac
fi

echo && echo "using $root" && echo

echo "what distro are you on (supported options: void)"
read -p "enter here: "

void_install() {
	echo && echo "updating before installation" && echo && sleep 1s
        $root xbps-install -y -Su

        echo && echo "installing required packages" && echo & sleep 1s
        $root xbps-install -y xorg-server base-devel alacritty dunst sxhkd git libX11-devel libXft-devel libXinerama-devel xinit xauth xsetroot xinput libinput xf86-input-libinput

        echo && echo "starting setup" && echo & sleep 1s
        mkdir -p $HOME/.config
        mkdir -p $HOME/.local/share/fonts/

        git clone https://github.com/synthun/dwm $HOME/.config
        git clone https://github.com/synthun/dmenu $HOME/.config
        git clone https://github.com/synthun/dotfiles $HOME/.config
        git clone https://github.com/synthun/fonts $HOME/.config

        cd $HOME/.config/dwm && $root make clean install
        cd $HOME/.config/dmenu && $root make clean install

        cp -r $HOME/.config/dotfiles/sxhkd $HOME/.config
        cp -r $HOME/.config/dotfiles/dunst $HOME/.config
        cp -r $HOME/.config/dotfiles/alacritty $HOME/.config
        cp $HOME/.config/dotfiles/xinitrc $HOME/.xinitrc

	cp $HOME/.config/fonts/jetbrains-mono/* $HOME/.local/share/fonts
	cp $HOME/.config/fonts/san-francisco/* $HOME/.local/share/fonts

	echo && echo "cleaning up" && echo & sleep 1s
	rm -rfv $HOME/.config/dotfiles
	rm -rfv $HOME/.config/fonts

	echo && echo "installation complete, the configuration files for dwm and dmenu are located in $HOME/.config"
}

case $REPLY in
	void) void_install;;
	*) echo "$REPLY does not exist or is not supported"
esac
