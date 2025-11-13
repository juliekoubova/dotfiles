#!/bin/sh

if command -v apk >/dev/null; then
  apk update || exit 1
  apk upgrade || exit 1
fi

if command -v brew >/dev/null; then
  brew update || exit 1
  brew upgrade || exit 1
fi

julie-install-nvim.sh || exit 1
