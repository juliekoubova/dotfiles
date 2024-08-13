#!/bin/sh
command -v swaymsg >/dev/null || exit 0
[ -n "${SWAYSOCK}" ] || exit 0

echo "Reloading sway" >&2
exec swaymsg reload
