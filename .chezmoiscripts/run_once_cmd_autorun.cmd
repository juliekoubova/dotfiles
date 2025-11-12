@echo off

echo Setting .autorun.cmd as Command Processor Autorun
reg add ^
  "HKCU\SOFTWARE\Microsoft\Command Processor" ^
  /v Autorun ^
  /t REG_EXPAND_SZ ^
  /d %%UserProfile%%\.autorun.cmd ^
  /f

exit 0
