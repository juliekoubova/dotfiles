@Echo Off
Echo Windows Subsystem for Linux
wsl --status >nul 2>&1
If %ErrorLevel% Equ 0 (
  wsl --update
) Else (
  wsl --install --no-distribution
)
