@Echo Off
If Exist "%LocalAppData%\Apps\NvimNightly\bin\nvim.exe" (
  Start /AboveNormal /B /Wait "" "%LocalAppData%\Apps\NvimNightly\bin\nvim.exe" %*
) Else (
  Start /AboveNormal /B /Wait "" nvim.exe %*
)
