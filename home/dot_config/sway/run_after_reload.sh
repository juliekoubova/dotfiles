#!/bin/sh
if command -v swaymsg >/dev/null; then
  swaymsg reload
fi
