# dotfiles

## font installation on void

```
xbps-install fonts-iosevka
mkdir ~/.local/share/fonts
mv SF-Pro-Text_Regular.otf ~/.local/share/fonts
mv JetBrainsMono-Regular.ttf ~/.local/share/fonts
```

## font installation on gentoo
```
emerge -a jetbrains-mono
mkdir ~/.local/share/fonts
mv SF-Pro-Text_Regular.otf ~/.local/share/fonts
mv iosevka-regular.ttf ~/.local/share/fonts
```
iosevka is in the repositories but it is masked

## font installation on arch

install an aur helper if you havent already
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

install fonts
```
yay -S ttf-jetbrains-mono-git ttf-iosevka apple-fonts
```

![image](https://user-images.githubusercontent.com/84999468/176069951-8a6b8535-7c34-463f-a14b-ca55920be46f.png)
