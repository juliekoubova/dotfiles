@echo off
wsl --update || exit 1
winget upgrade --all || exit 1
julie-install-nvim || exit 1
