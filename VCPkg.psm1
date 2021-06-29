Function Select-Vcpkg ([Switch] $Force) {
    $Repos = Split-Path -Parent $PSScriptRoot
    $VcpkgRepo = Join-Path $Repos 'vcpkg'
    If ($Force -Or (Test-Path -Type Container -LiteralPath $VcpkgRepo)) {
        $VcpkgRepo
    }
}
