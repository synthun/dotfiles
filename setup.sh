#!/bin/sh

CONFIG="$HOME/.config"
BINDIR="$HOME/.local/bin"
FONTSDIR="$HOME/.local/share/fonts"

copy() { cp -rv $1 $2 || exit 1 ; }
del() { rm -rfv $1 || exit 1 ; }
mkd() { mkdir -pv $1 || exit 1 ; }

[ -d "$CONFIG/dunst" ] && del "$CONFIG/dunst"
[ -d "$CONFIG/sxhkd" ] && del "$CONFIG/sxhkd"
[ -d "$CONFIG/sx" ] && del "$CONFIG/sx"
[ ! -d $FONTSDIR ] && mkd $FONTSDIR
[ ! -d $BINDIR ] && mkd $BINDIR

copy "config/*" $CONFIG
copy "fonts/*" $FONTSDIR
copy "bin/*" $BINDIR
