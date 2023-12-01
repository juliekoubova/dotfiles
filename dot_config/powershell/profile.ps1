If ($IsWindows) {
  $VSWhere = "${Env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
  If (Get-Command $VSWhere -ea SilentlyContinue) {
    $VSPath = @(& $VSWhere -latest -prerelease -property InstallationPath 2>$null)[-1]
    If ($VSPath) {
      Import-Module (Join-Path $VSPath Common7\Tools\Microsoft.VisualStudio.DevShell.dll)
      $Null = Enter-VsDevShell -VsInstallPath $VSPath -StartInPath (Get-Location) 
    }
  }

  If (Get-Command python -ea SilentlyContinue) {
    # Windows has a python stub exe that launches Microsoft Store
    python --version 2>&1 >$null
    If ($LastExitCode -eq 0) {
      $Paths = @($Env:PATH -split ';')
      $Scripts = (Join-Path $(python -m site --user-site) ..\Scripts -Resolve)
      If ($Scripts) {
        $Env:PATH = ($Paths + $Scripts) -join ';'
      }
    }
  }
}

$Env:LESS = '--mouse'

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
  starship init powershell --print-full-init | Out-String | Invoke-Expression
}

If (Get-Command chezmoi -ea SilentlyContinue) {
  chezmoi completion powershell | Out-String | Invoke-Expression
}

Set-Alias ls Get-ChildItem
Set-Alias ll Get-ChildItem
Set-Alias la Get-ChildItem
Set-Alias which Get-Command

Remove-Alias rm -Force -ea SilentlyContinue

Function ga {
  Param ([String]$Path = '--all')
  git add $Path
}

Function rm {
  Param (
    [Alias('r')]
    [Switch]$Recurse,
    [Alias('f')]
    [Switch]$Force,
    [Switch]$rf
  )
  Remove-Item `
    -Path $args `
    -Recurse:($Recurse -or $rf) `
    -Force:($Force -or $rf)
}

. "${PSScriptRoot}/aliases.ps1"
