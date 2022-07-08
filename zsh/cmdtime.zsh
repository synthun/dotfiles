## 100% stolen, but rewritten *wink*
function _cmdtime() {
	case $1 in
		b) 
			zmodload zsh/datetime
			printf '%s' "$EPOCHREALTIME"
		;;
		f) 
			[ "${__cmdtime}" = 0 ] && return 0 
			[ -z "${__scmdtime}" ] && return 0 
			local ecmdtime="$(_cmdtime b)"
			local tdiff="$((ecmdtime - __scmdtime))"
			local h="$(printf '%u' $((tdiff / 3600)))"
			local m="$(printf '%u' $(((tdiff - h * 3600) / 60)))"
			local s="$(printf '%.3f' $((tdiff - 60 * m - 3600 * h)))"
			[ ! "${h%.*}" -eq 0 ] && format="${s}s"
			[ ! "${m%.*}" -eq 0 ] && format+=" ${m}m "
			[ ! "${s%.*}" -eq 0 ] && format+="${s%?}s"
			printf '%s' "${format:-${${${s#*.}#0}#0}ms} "
		;;
	esac
}
