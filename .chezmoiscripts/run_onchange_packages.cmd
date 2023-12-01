@echo off

call :install BurntSushi.ripgrep.MSVC
call :install Git.Git
call :install JesseDuffield.lazygit
call :install Microsoft.PowerShell
call :install Microsoft.VisualStudioCode.Insiders
call :install Microsoft.WindowsTerminal.Preview
call :install Mozilla.Firefox
call :install Neovim.Neovim
call :install Starship.Starship
call :install dandavison.delta
call :install gsass1.NTop
call :install jftuga.less
call :install junegunn.fzf
call :install voidtools.Everything
exit 0

:install
setlocal
echo Installing %1
winget install ^
  --accept-package-agreements ^
  --id "%1" ^
  --no-upgrade ^
  --silent ^
  --source winget
echo.
endlocal
goto :eof

