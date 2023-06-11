#!/bin/sh
if command -v swaymsg >/dev/null && test -n "${SWAYSOCK}"; then
  swaymsg reload
fi
