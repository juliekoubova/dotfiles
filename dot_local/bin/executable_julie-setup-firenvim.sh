#!/bin/sh
if command -v nvim >/dev/null; then
  echo Installing Firenvim >&2
  exec nvim -i NONE -c "lua require('firenvim')" -c "call firenvim#install(0)" -c qa
else
  echo Neovim not found >&2
  exit 1
fi
