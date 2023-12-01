#!/bin/sh
if command -v nvim >/dev/null; then
  echo Installing Neovim plugins
  exec nvim -i NONE -c PlugInstall -c qa
fi
