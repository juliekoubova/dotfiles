#!/bin/sh
# {{ include "dot_config.crontab" | sha256sum }}
crontab="${XDG_CONFIG_HOME:-$HOME/.config}/crontab"
echo Installing crontab:
cat "$crontab"
exec crontab "$crontab"
