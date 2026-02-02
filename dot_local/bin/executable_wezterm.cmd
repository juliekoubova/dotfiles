@Echo Off
If Exist "%LocalAppData%\Apps\WeztermNightly\wezterm.exe" (
  "%LocalAppData%\Apps\WeztermNightly\wezterm.exe" %*
) Else (
  wezterm.exe %*
)
