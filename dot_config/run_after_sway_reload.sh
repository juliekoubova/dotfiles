#!/bin/sh
command -v swaymsg >/dev/null || exit
[ -n "${SWAYSOCK}" ] || exit

echo "Reloading sway" >&2
exec swaymsg reload
