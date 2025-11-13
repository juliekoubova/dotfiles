#!/bin/sh
command -v nvim >/dev/null || exit 0
echo >&2 Installing Neovim plugins
nvim --headless -S .config/nvim/lua/chezmoi_apply.lua -c qa
