#!/bin/sh
command -v zsh >/dev/null || exit 0
exec zsh <<'EOF'
do_zcompile() {
  echo "ZSH compiling $1" >&2
  zcompile "$1"
}
do_zcompile ~/.aliases
do_zcompile ~/.config/zsh/.zprofile
do_zcompile ~/.config/zsh/.zshrc
do_zcompile ~/.profile
do_zcompile ~/.shrc
do_zcompile ~/.zprofile
EOF

