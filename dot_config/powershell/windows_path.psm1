Function PrependPath {
  Param (
    [ScriptBlock] $Script,
    [String]      $VariableName = 'PATH'
  )

  $Variable = Get-Item -LiteralPath "Env:${VariableName}" -ea SilentlyContinue
  If ($Variable) {
    [Collections.ArrayList] $Array = @($Variable.Value -Split ';')
    $Array.Reverse()
  } Else {
    [Collections.ArrayList] $Array = @()
  }

  ForEach ($Path In & $Script) {
    If ($Path) {
      $Null = $Array.Add($Path)
    }
  }

  $Array.Reverse()
  Set-Item -LiteralPath "Env:${VariableName}" -Value ($Array -Join ';')
}
