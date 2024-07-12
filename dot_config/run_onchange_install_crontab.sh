#!/bin/sh
# {{ include "dot_config.crontab" | sha256sum }}
crontab="${XDG_CONFIG_HOME:-$HOME/.config}/crontab"
command -v crontab >/dev/null || exit 0
echo Installing crontab:
cat "$crontab"
exec crontab "$crontab"
