## this file is .zsh for the pclone alias.

# flags
alias \
	cp='cp -v' \
	mv='mv -v' \
	rm='rm -v' \
	du='du -h' \
	free='free -m' \
	md='mkdir -pv' \
	df='df -Th --sync' \
	grep='grep --color=auto' \
	dmesg='dmesg --color=always' \
	jp2a='jp2a --color --color-depth=24' \
	wget='wget --hsts-file=~/.cache/wget-hsts' \
	bat='bat --style numbers,header --theme ansi' \
	exa='exa --color=always --group-directories-first' \
	nvidia-settings='nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings'


# pclone='clone git@${${$(xclip -o)#https://}/\//:}' \
# shortcuts
alias \
	redo='doas !!' \
	edit='$EDITOR' \
	de='doasedit' \
	rf='rm -rf' \
	rl='exec $SHELL' \
	clone='git clone $(xclip -o)' \
	ex='chmod -v a+x' \
	vpu='git pull --rebase upstream master' \
	get='wget "$(xclip -o)"' \
	mine='chown $USER:$USER -Rv' \
	lsv='doas sv status /var/service/*' \
	pclone='clone git@github.com:wael444/' \
	udevrel='udevadm control --reload-rules && udevadm trigger' \
	ytdla='yt-dlp -f bestaudio --restrict-filenames' \
	ytdln='yt-dlp -f bestvideo+bestaudio --restrict-filenames' \
	makec='doas grc make {uninstall,install,clean}' 

# exa
alias \
	ll='exa -lab' \
	la='ll --no-time' \
	le='ll -s time' \
	lo='ll -s size' \
	ls='exa -aF -s type' \
	tree='exa -aT -s type'

# xbps
alias \
	xe='doas xbps-install' \
	xg='xbps-query' \
	xu='doas xbps-install -Syuv' \
	xr='doas xbps-remove' \

# edit function
function e() {
	case $# in
		0) 
			local edit="$(fd -H -c never -E .git -t f . "$HOME" | fzf)"
			[ -n "$edit" ] && edit "$edit"
		;;
		1) 
			[ -e "$1" ] && edit "$@" || edit "$(fd -H1g $1)"
		;;
	esac
}

# hella useful
alias \
	run='$(m path | fzf --print-query | tail -1)' \
	c='cd "$(fd -H -c never -E .git -E void-packages -t d . "$PWD" | fzf)"' \
	hst="history 1 -1 | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -sel c" \
	doas='doas ' \
	sudo='doas ' \
	usbunbind='lspci -D | awk '"'/USB 3.1 Host/ {print \$1}'"' | doas tee /sys/bus/pci/drivers/xhci_hcd/unbind'

# vim: ft=zsh
