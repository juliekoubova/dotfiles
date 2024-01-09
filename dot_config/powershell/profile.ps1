If ($IsWindows) {
  & "${PSScriptRoot}/windows_login.ps1"
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

Function gco {
  Param ([String]$Branch)

  If (-Not $Branch) {
    If (Get-Command fzf -ea SilentlyContinue) {
      $Branch = $(
        git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'
        git for-each-ref --sort=-committerdate refs/remotes/ --format='%(refname:short)'
      ) | Select-Object -Unique | fzf
      $Branch = ("$Branch").Trim()
    }
    Else {
      Throw "fzf not available"
    }
  }
  If ($Branch) {
    & git checkout $Branch
  }
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
