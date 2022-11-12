# dotfiles

my configuration files

## installation

```
git clone https://github.com/synthun/dotfiles
cd dotfiles
./setup.sh
```

## yash config

the binary i use for yash is in `~/.local/bin/yash-run` and the config is in `~/.config/yash/rc`, just for the sake of keeping a clean home folder

to set it to your main shell, run:

```
# echo "/home/your-user/.local/bin/yash-run" >> /etc/shells
$ chsh -s ~/.local/bin/yash-run
```
