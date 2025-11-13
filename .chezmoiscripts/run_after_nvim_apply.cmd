@Echo Off
Where nvim >nul 2>&1
If %ErrorLevel% Equ 0 (
  Echo Installing Neovim plugins
  Set XDG_CONFIG_HOME=%USERPROFILE%\.config
  nvim --headless -S "%XDG_CONFIG_HOME%\nvim\lua\chezmoi_apply.lua" -c qa
)
