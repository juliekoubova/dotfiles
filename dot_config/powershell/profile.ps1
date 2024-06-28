Using Module './git.psm1'

If ($IsWindows) {
  & "${PSScriptRoot}/windows_login.ps1"
}

. "${PSScriptRoot}/aliases.ps1"

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

Remove-Alias gcm -Force -ea 0
Remove-Alias rm -Force -ea 0

Set-Alias ga    GitAdd
Set-Alias gacm  GitAddCommit
Set-Alias gacmp GitAddCommitPush
Set-Alias gco   GitCheckout
Set-Alias gcm   GitCommit
Set-Alias gua   GitUnAdd

Function gres($Commit)  { GitReset -Commit $Commit }
Function gsoft($Commit) { GitReset -Commit $Commit -Soft }
Function ghard($Commit) { GitReset -Commit $Commit -Hard }


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

