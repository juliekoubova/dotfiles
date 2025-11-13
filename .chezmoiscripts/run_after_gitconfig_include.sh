#!/bin/sh
command -v git >/dev/null && git config set --global include.path .gitconfig_chezmoi
