#!/bin/sh
if command -v nvim >/dev/null; then
  echo Installing Neovim plugins
  exec nvim -i NONE -c 'Lazy install' -c qa
fi
