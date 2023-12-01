#!/bin/sh
if command -v zsh >/dev/null 2>&1; then
  exec zsh -c "
zcompile ~/.aliases
zcompile ~/.config/zsh/.zprofile
zcompile ~/.config/zsh/.zshrc
zcompile ~/.profile
zcompile ~/.shrc
zcompile ~/.zprofile
"
fi
