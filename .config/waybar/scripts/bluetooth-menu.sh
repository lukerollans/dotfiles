#!/usr/bin/env bash
set -euo pipefail

notify() {
	command -v notify-send >/dev/null && notify-send -a "bluetooth" "$@" || true
}

if ! bluetoothctl show | grep -q "Powered: yes"; then
	bluetoothctl power on >/dev/null
fi

paired_macs=$(bluetoothctl devices Paired | awk '{print $2}')
connected_macs=$(bluetoothctl devices Connected | awk '{print $2}')

in_list() { grep -qx "$1" <<<"$2"; }

build_entries() {
	while read -r _ mac name; do
		[ -z "$mac" ] && continue
		if in_list "$mac" "$connected_macs"; then
			printf '󰂱  %s|%s|disconnect\n' "$name" "$mac"
		elif in_list "$mac" "$paired_macs"; then
			printf '󰂯  %s|%s|connect\n' "$name" "$mac"
		else
			printf '󰂲  %s (unpaired)|%s|pair\n' "$name" "$mac"
		fi
	done < <(bluetoothctl devices)
}

menu=$(build_entries)
menu+=$'\n''󰂰  Scan for new devices…||scan'
menu+=$'\n''  Open blueman-manager||blueman'

choice=$(printf '%s' "$menu" | wofi --dmenu --prompt "Bluetooth" --width 380 --height 320 --cache-file /dev/null) || exit 0

mac=$(awk -F'|' '{print $2}' <<<"$choice")
action=$(awk -F'|' '{print $3}' <<<"$choice")
label=$(awk -F'|' '{print $1}' <<<"$choice")
name=${label#* }

case "$action" in
	connect)
		notify "Connecting…" "$name"
		bluetoothctl connect "$mac" >/dev/null && notify "Connected" "$name" || notify "Connect failed" "$name"
		;;
	disconnect)
		bluetoothctl disconnect "$mac" >/dev/null && notify "Disconnected" "$name"
		;;
	pair)
		notify "Pairing…" "$name"
		if bluetoothctl pair "$mac" >/dev/null 2>&1; then
			bluetoothctl trust "$mac" >/dev/null 2>&1 || true
			bluetoothctl connect "$mac" >/dev/null 2>&1 && notify "Connected" "$name" || notify "Paired" "$name"
		else
			notify "Pair failed" "$name"
		fi
		;;
	scan)
		notify "Scanning…" "Discovering devices for 10s"
		bluetoothctl --timeout 10 scan on >/dev/null 2>&1 || true
		exec "$0"
		;;
	blueman)
		command -v blueman-manager >/dev/null && blueman-manager &
		;;
esac
