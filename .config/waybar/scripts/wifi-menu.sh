#!/usr/bin/env bash
set -euo pipefail

notify() {
	command -v notify-send >/dev/null && notify-send -a "wifi" "$@" || true
}

if [ "$(nmcli radio wifi)" = "disabled" ]; then
	nmcli radio wifi on
	sleep 1
fi

nmcli device wifi rescan >/dev/null 2>&1 || true

active_ssid=$(nmcli -t -f ACTIVE,SSID device wifi list | awk -F: '$1=="yes"{print $2; exit}')

build_entries() {
	nmcli -t -f IN-USE,SSID,SIGNAL,SECURITY device wifi list |
		awk -F: -v active="$active_ssid" '
			{
				ssid=$2; signal=$3; security=$4
				if (ssid == "" || seen[ssid]++) next
				icon = (signal >= 75 ? "󰤨" : signal >= 50 ? "󰤥" : signal >= 25 ? "󰤢" : "󰤟")
				lock = (security == "" || security == "--") ? " " : "󰌾"
				mark = (ssid == active) ? "  " : "  "
				printf "%s%s %s %s|%s\n", mark, icon, lock, ssid, ssid
			}'
}

menu=$(build_entries)
[ -n "$active_ssid" ] && menu+=$'\n''󰖪  Disconnect|__disconnect__'
menu+=$'\n''󰑐  Rescan|__rescan__'
menu+=$'\n''  Toggle wifi off|__off__'

choice=$(printf '%s' "$menu" | wofi --dmenu --prompt "Wi-Fi" --width 380 --height 360 --cache-file /dev/null) || exit 0

ssid=$(awk -F'|' '{print $2}' <<<"$choice")

case "$ssid" in
	__disconnect__)
		iface=$(nmcli -t -f DEVICE,TYPE device | awk -F: '$2=="wifi"{print $1; exit}')
		[ -n "$iface" ] && nmcli device disconnect "$iface" >/dev/null && notify "Disconnected"
		;;
	__rescan__)
		exec "$0"
		;;
	__off__)
		nmcli radio wifi off && notify "Wi-Fi off"
		;;
	"")
		exit 0
		;;
	*)
		if nmcli -t -f NAME connection show | grep -qx "$ssid"; then
			notify "Connecting…" "$ssid"
			nmcli connection up id "$ssid" >/dev/null && notify "Connected" "$ssid" || notify "Connect failed" "$ssid"
		else
			security=$(nmcli -t -f SSID,SECURITY device wifi list | awk -F: -v s="$ssid" '$1==s{print $2; exit}')
			if [ -z "$security" ] || [ "$security" = "--" ]; then
				notify "Connecting…" "$ssid"
				nmcli device wifi connect "$ssid" >/dev/null && notify "Connected" "$ssid" || notify "Connect failed" "$ssid"
			else
				password=$(wofi --dmenu --password --prompt "Password for $ssid" --width 380 --height 80 --cache-file /dev/null) || exit 0
				notify "Connecting…" "$ssid"
				if nmcli device wifi connect "$ssid" password "$password" >/dev/null 2>&1; then
					notify "Connected" "$ssid"
				else
					notify "Connect failed" "$ssid"
				fi
			fi
		fi
		;;
esac
