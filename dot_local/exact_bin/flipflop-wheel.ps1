#Requires -Version 7
#Requires -RunAsAdministrator
[CmdletBinding()]
Param (
  [Switch] $Disable
)

$Path = 'HKLM:\SYSTEM\CurrentControlSet\Enum\HID\*\*\Device Parameters'
$Value = $Disable ? 0 : 1

Get-ItemProperty -Path $Path -Name FlipFlopWheel -EA SilentlyContinue `
| ForEach-Object {
  $Instance = ($_.PSParentPath -Split '\\')[-2..-1] -Join '\'
  Write-Verbose "${Instance}: FlipFlopWheel -> ${Value}"
  Set-ItemProperty -LiteralPath $_.PSPath -Name FlipFlopWheel -Value $Value
}

Write-Warning "You have to reboot the machine for the setting to take effect"
