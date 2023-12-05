@echo off
echo Setting XDG_CONFIG_HOME to "%USERPROFILE%\.config"
setx XDG_CONFIG_HOME "%USERPROFILE%\.config" || exit 1

echo Setting .autorun.cmd as Command Processor Autorun
reg add ^
  "HKCU\SOFTWARE\Microsoft\Command Processor" ^
  /v Autorun ^
  /t REG_EXPAND_SZ ^
  /d %%UserProfile%%\.autorun.cmd ^
  /f

exit 0
