@echo off
where nvim >nul 2>&1
if not errorlevel 1 (
  echo Installing Neovim plugins
  set XDG_CONFIG_HOME=%USERPROFILE%\.config
  nvim -i NONE -c "Lazy install" -c qa
)
