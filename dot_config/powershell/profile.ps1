Using Module './git.psm1'

If ($IsWindows) {
  & "${PSScriptRoot}/windows_login.ps1"
}

. "${PSScriptRoot}/aliases.ps1"

Function Script:Has($Command) {
  Return [Boolean](Get-Command $Command -ea SilentlyContinue)
}

If (Has code-insiders) {
  Set-Alias code code-insiders
}

If (Has nvim) {
  $Env:EDITOR = 'nvim'
  Set-Alias vim nvim
  Set-Alias vi nvim
}

If (Has less) {
  $Env:PAGER = 'less'
}

If (Has starship) {
  Function Invoke-Starship-PreCommand {
    Try {
      $Env:STARSHIP_CONFIG = "${Env:XDG_CONFIG_HOME}\starship_termtitle.toml"
      Write-Host -NoNewLine "`e]2;$(starship prompt)`a"
    } Finally {
      Remove-Item Env:STARSHIP_CONFIG
    }
  }
  starship init powershell --print-full-init | Out-String | Invoke-Expression
}

If (Has chezmoi) {
  chezmoi completion powershell | Out-String | Invoke-Expression
}

If ((Has sudo) -And -Not (Has doas)) {
  Set-Alias doas sudo
}

If ((Has doas) -And -Not (Has sudo)) {
  Set-Alias sudo doas
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

Remove-Alias gcm -Force -Scope Global -ea 0
Remove-Alias rm -Force -Scope Global -ea 0

Set-Alias ga    GitAdd
Set-Alias gacm  GitAddCommit
Set-Alias gacmp GitAddCommitPush
Set-Alias gcm   GitCommit
Set-Alias gcmp  GitCommitPush
Set-Alias gco   GitCheckout
Set-Alias gsq   GitSquash
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

