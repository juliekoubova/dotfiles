@Echo Off
Echo Windows Subsystem for Linux
wsl --status >nul 2>&1
If %ErrorLevel% Equ 0 (
  sudo --disable-input wsl --update
) Else (
  sudo --disable-input wsl --install --no-distribution
)
