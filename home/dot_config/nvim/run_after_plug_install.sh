#!/bin/sh
if command -v nvim >/dev/null; then
  exec nvim +PlugInstall +qall
fi
