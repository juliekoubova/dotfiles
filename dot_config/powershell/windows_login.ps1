If (Test-Path Env:JulieWindowsLogin) {
  Return
}

$Env:JulieWindowsLogin = 1

[Collections.ArrayList] $Paths = @($Env:PATH -split ';')
$Paths.Reverse()

Function AddPathIfExists([String]$Path) {
  If ($Path -And (Test-Path $Path)) {
    $Null = $Paths.Add($Path)
  }
}

Function FindLastItem($Path) {
  Get-Item -Path $Path -ea SilentlyContinue `
    | Sort-Object FullName -Descending `
    | ForEach-Object FullName `
    | Select-Object -First 1
}

Function FindVisualStudio() {
  $VSWhere = "${Env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
  If (Get-Command $VSWhere -ea SilentlyContinue) {
    $Global:VSPath = @(& $VSWhere -latest -prerelease -property InstallationPath 2>$null)[-1]
  }
  If (-Not $VSPath) {
    Return
  }
  AddPathIfExists (FindLastItem "${VSPath}\VC\Tools\MSVC\*\bin\Hostx64\x64")
  AddPathIfExists "${VSPath}\Common7\IDE"
  AddPathIfExists "${VSPath}\Common7\Tools"
  AddPathIfExists "${VSPath}\MSBuild\Current\Bin\amd64"
  AddPathIfExists "${VSPath}\MSBuild\Current\bin\Roslyn"
}

Function FindWindowsSDK() {
  AddPathIfExists (FindLastItem "${Env:ProgramFiles(x86)}\Windows Kits\10\bin\*\x64")
}

If (Get-Command python -ea SilentlyContinue) {
  # Windows has a python stub exe that launches Microsoft Store
  python --version 2>&1 >$null
  If ($LastExitCode -eq 0) {
    $Scripts = (Join-Path $(python -m site --user-site) ..\Scripts -Resolve)
    If ($Scripts) {
      AddPathIfExists $Scripts
    }
  }
}

FindWindowsSDK
FindVisualStudio

AddPathIfExists "${Env:LocalAppData}\Microsoft\WinGet\Packages\LuaLS.lua-language-server_Microsoft.Winget.Source_8wekyb3d8bbwe\bin"
AddPathIfExists "${Env:ProgramFiles}\CMake\bin"
AddPathIfExists "${Env:ProgramFiles}\LLVM\bin"
AddPathIfExists "${Env:UserProfile}\.local\bin"
AddPathIfExists 
$Paths.Reverse()
$Paths = $Paths | Resolve-Path -ea SilentlyContinue | Select-Object -Unique
$Env:PATH = ($Paths -join ';')

$Env:LESS = '--mouse'
