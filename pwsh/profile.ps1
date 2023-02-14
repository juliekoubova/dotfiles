If ($IsWindows -And (Get-Command vs -ea SilentlyContinue)) {
    $VSPath = @(vs where preview -prop=InstallationPath)[-1]
    Import-Module (Join-Path $VSPath Common7\Tools\Microsoft.VisualStudio.DevShell.dll)
    $Null = Enter-VsDevShell -VsInstallPath $VSPath -StartInPath (Get-Location) 
}

Set-PSReadLineOption -EditMode Vi

# Use Ctrl+[ to exit insert mode
Set-PSReadLineKeyHandler -Chord 'Ctrl+Oem4' -Function ViCommandMode

If (Get-Command code-insiders) {
    Set-Alias code code-insiders
}

If (Get-Command oh-my-posh) {
    oh-my-posh init pwsh --config "${Env:POSH_THEMES_PATH}/catppuccin_mocha.omp.json"| Invoke-Expression
}

Remove-Alias rm
Remove-Alias ls
Import-Module (Join-Path $PSScriptRoot Aliases.ps1)