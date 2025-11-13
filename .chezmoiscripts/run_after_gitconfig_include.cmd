@Echo Off
where git >nul 2>&1
If %ErrorLevel% Equ 0 (
  git config set --global include.path .gitconfig_chezmoi
)
