#!/bin/sh

if [ `id -u` != "0" ]; then
  echo "Need root" >&2
  exit 1
fi

echo "Updating APK..." >&2
apk update || exit 1

echo "Installing packages..." >&2
exec apk add \
  ansible \
  ansible-lint \
  delta \
  drill \
  exa \
  git \
  git-crypt \
  go \
  htop \
  jq \
  lazygit \
  less \
  python3 \
  neovim \
  ripgrep \
  rsync \
  starship \
  strace \
  tcpdump \
  tree-sitter \
  unzip \
  ;

