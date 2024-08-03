@echo off
where nvim >nul 2>&1
if errorlevel 1 (
  echo Neovim not found
  exit 1
)

echo Installing Firenvim
set XDG_CONFIG_HOME=%USERPROFILE%\.config
nvim -i NONE -c "lua require('firenvim')" -c "call firenvim#install(0)" -c qa
