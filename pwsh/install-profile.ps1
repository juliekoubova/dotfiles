Param ($TargetProfile = $Profile.CurrentUserAllHosts)
$DotfilesProfile = "$(Join-Path $PSScriptRoot profile.ps1 | Resolve-Path)"
$InvokeLine = ". `"${DotfilesProfile}`""

$ProfileLines = @(Get-Content $TargetProfile -ea SilentlyContinue)
$ProfileLines = $ProfileLines -Ne $InvokeLine
$ProfileLines = $ProfileLines += $InvokeLine
Set-Content -LiteralPath $TargetProfile -Value $ProfileLines