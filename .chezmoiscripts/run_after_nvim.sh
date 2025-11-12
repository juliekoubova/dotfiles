#!/bin/sh
command -v nvim >/dev/null || exit 0
echo Installing Neovim plugins >&2
pwd
nvim --headless -S .config/nvim/lua/post_apply.lua -c qa
