Function Select-Fzf {
  If (-Not (Get-Command fzf -ea SilentlyContinue)) {
    Throw "fzf not available"
  }
  $Result = $Input | fzf
  Return ("$Result").Trim()
}
