@Echo off
If Exist "%ProgramFiles%\PowerShell\7-preview\pwsh.exe" (
  "%ProgramFiles%\PowerShell\7-preview\pwsh.exe" %*
  Exit
)
If Exist "%ProgramFiles%\PowerShell\7\pwsh.exe" (
  "%ProgramFiles%\PowerShell\7\pwsh.exe" %*
  Exit
)
powershell.exe %*
