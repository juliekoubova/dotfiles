Using Module './git.psm1'

If ($IsWindows) {
  & "${PSScriptRoot}/windows_login.ps1"
}

If (Get-Command code-insiders -ea SilentlyContinue) {
  Set-Alias code code-insiders
}

If (Get-Command nvim -ea SilentlyContinue) {
  $Env:EDITOR = 'nvim'
  Set-Alias vim nvim
  Set-Alias vi nvim
}

If (Get-Command less -ea SilentlyContinue) {
  $Env:PAGER = 'less'
}

If (Get-Command starship -ea SilentlyContinue) {
  starship init powershell --print-full-init | Out-String | Invoke-Expression
}

If (Get-Command chezmoi -ea SilentlyContinue) {
  chezmoi completion powershell | Out-String | Invoke-Expression
}

# Use Ctrl+[ to exit insert mode
Set-PSReadLineKeyHandler -Chord 'Ctrl+Oem4' -Function ViCommandMode

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -EditMode Vi

# override starship indicator, it's fucking slow
Set-PSReadLineOption -ViModeIndicator Cursor

Set-Alias ls Get-ChildItem
Set-Alias ll Get-ChildItem
Set-Alias la Get-ChildItem
Set-Alias which Get-Command

Set-Alias ga   GitAdd
Set-Alias gacp GitAddCommitPush
Set-Alias gco  GitCheckout

Function gsoft($Commit) { GitReset -Commit $Commit }
Function ghard($Commit) { GitReset -Commit $Commit -Hard }

Remove-Alias rm -Force -ea SilentlyContinue

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

Function touch {
  Param ($LiteralPath)
  $Item = Get-Item -LiteralPath $LiteralPath -ea SilentlyContinue
  If ($Item) {
    $Item.LastWriteTime = Get-Date
    $Item
  } Else {
    New-Item -Path $LiteralPath -ItemType File
  }
}

. "${PSScriptRoot}/aliases.ps1"
