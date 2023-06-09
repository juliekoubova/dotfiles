If ($IsWindows -And (Get-Command vs -ea SilentlyContinue)) {
    $VSPath = @(vs where preview -prop=InstallationPath)[-1]
    Import-Module (Join-Path $VSPath Common7\Tools\Microsoft.VisualStudio.DevShell.dll)
    $Null = Enter-VsDevShell -VsInstallPath $VSPath -StartInPath (Get-Location) 
}

Set-PSReadLineOption -EditMode Vi

# Use Ctrl+[ to exit insert mode
Set-PSReadLineKeyHandler -Chord 'Ctrl+Oem4' -Function ViCommandMode

If (Get-Command code-insiders -ea SilentlyContinue) {
    Set-Alias code code-insiders
}

If (Get-Command nvim -ea SilentlyContinue) {
  $Env:EDITOR = 'nvim'
  Set-Alias vim nvim
}

If (Get-Command starship -ea SilentlyContinue) {
  Invoke-Expression "$(& starship init powershell --print-full-init | Out-String)"
}
