#!/bin/sh
command -v nvim >/dev/null || exit 0
echo Installing Neovim plugins >&2
exec nvim -i NONE -c 'lua require("lazy").sync({ wait = true })' -c qa
