#Requires -Version 7

Function Select-Fzf([String] $Query, [Switch] $Ansi) {
  If (-Not (Get-Command fzf -ea SilentlyContinue)) {
    Throw "fzf not available"
  }
  $FzfParams = @()
  If ($Ansi) {
    $FzfParams += '--ansi'
  }
  If ($Query) {
    $FzfParams += @('-q', $Query)
  }
  $Result = $Input | fzf @FzfParams
  Return ("$Result").Trim()
}
