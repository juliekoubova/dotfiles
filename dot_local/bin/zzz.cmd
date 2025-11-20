@echo off
where psshutdown >nul 2>&1
if %ErrorLevel% Equ 0 (
  psshutdown -d -t 0 -nobanner
) else (
  shutdown /h /t 0
)
