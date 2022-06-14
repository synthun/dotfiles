# dotfiles

## font installation on void

```
xbps-install fonts-iosevka fontmanager
font-manager SF-Pro-Text-Regular.otf
```

## font installation on arch

install an aur helper if you havent already:

```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

install fonts

```
yay -S apple-fonts ttf-iosevka
```
