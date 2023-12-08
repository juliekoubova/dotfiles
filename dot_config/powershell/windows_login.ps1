If (Test-Path Env:JulieWindowsLogin) {
  Return
}

$Env:JulieWindowsLogin = 1

$VSWhere = "${Env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
If (Get-Command $VSWhere -ea SilentlyContinue) {
  $VSPath = @(& $VSWhere -latest -prerelease -property InstallationPath 2>$null)[-1]
  If ($VSPath) {
    Import-Module (Join-Path $VSPath Common7\Tools\Microsoft.VisualStudio.DevShell.dll)
    Write-Host "Entering VS Dev Shell..."
    $Null = Enter-VsDevShell `
      -Arch amd64 `
      -VsInstallPath $VSPath `
      -StartInPath (Get-Location)
    Clear-Host
  }
}

[Collections.ArrayList] $Paths = @($Env:PATH -split ';')

If (Get-Command python -ea SilentlyContinue) {
  # Windows has a python stub exe that launches Microsoft Store
  python --version 2>&1 >$null
  If ($LastExitCode -eq 0) {
    $Scripts = (Join-Path $(python -m site --user-site) ..\Scripts -Resolve)
    If ($Scripts) {
      $Null = $Paths.Add($Scripts)
    }
  }
}

$LuaLSDir =  "${Env:LocalAppData}\Microsoft\WinGet\Packages\LuaLS.lua-language-server_Microsoft.Winget.Source_8wekyb3d8bbwe\bin"
If (Test-Path "${LuaLSDir}\lua-language-server.exe") {
  $Paths.Insert(0,  "${LuaLSDir}")
}

$Paths.Insert(0,  "${Env:UserProfile}\.local\bin")
$Paths = $Paths | Resolve-Path -ea SilentlyContinue | Select-Object -Unique
$Env:PATH = ($Paths -join ';')
$Env:LESS = '--mouse'
