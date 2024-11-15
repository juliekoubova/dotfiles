Using Module './windows_path.psm1'

If (Test-Path Env:JulieWindowsLogin) {
  Return
}

$Env:JulieWindowsLogin = 1

Function FindLastItem($Path) {
  Get-Item -Path $Path -ea SilentlyContinue `
    | Sort-Object FullName -Descending `
    | ForEach-Object FullName `
    | Select-Object -First 1
}

Function EnsureExists([String]$Path) {
  Resolve-Path -LiteralPath $Path -ea 0
}

Function FindVisualStudio() {
  $VSWhere = "${Env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
  If (Get-Command $VSWhere -ea SilentlyContinue) {
    $Global:VSPath = @(& $VSWhere -latest -prerelease -property InstallationPath 2>$null)[-1]
  }
  If ($VSPath) {
    FindLastItem "${VSPath}\VC\Tools\MSVC\*\bin\Hostx64\x64"
    "${VSPath}\Common7\IDE"
    "${VSPath}\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin"
    "${VSPath}\Common7\Tools"
    "${VSPath}\MSBuild\Current\Bin\amd64"
    "${VSPath}\MSBuild\Current\bin\Roslyn"

  }
}

Function FindWindowsSDK() {
  FindLastItem "${Env:ProgramFiles(x86)}\Windows Kits\10\bin\*\x64"
}

Function FindPython() {
  If (Get-Command python -ea SilentlyContinue) {
    # Windows has a python stub exe that launches Microsoft Store
    python --version 2>&1 >$null
    If ($LastExitCode -eq 0) {
      Join-Path $(python -m site --user-site) ..\Scripts -Resolve -ea 0
    }
  }
}


PrependPath {
  FindPython
  FindWindowsSDK
  FindVisualStudio
  EnsureExists "${Env:LocalAppData}\Microsoft\WinGet\Packages\LuaLS.lua-language-server_Microsoft.Winget.Source_8wekyb3d8bbwe\bin"
  EnsureExists "${Env:ProgramFiles}\CMake\bin"
  EnsureExists "${Env:ProgramFiles}\LLVM\bin"
  "${Env:UserProfile}\.local\bin"
}

$Env:LESS = '--mouse'
