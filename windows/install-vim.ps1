#Requires -RunAsAdministrator

$NVimConfigDir = (Join-Path $Env:LocalAppData nvim)
$NvimDotfilesDir = (Join-Path (Split-Path $PSScriptRoot) Vim)

If (Test-Path $NVimConfigDir) {
    Write-Warning "Neovim config directory already exists:"
    Get-Item -LiteralPath $NVimConfigDir
} Else {
    New-Item -ItemType SymbolicLink -Path $NVimConfigDir -Target $NvimDotfilesDir
}

Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" `
| New-Item "$NvimDotfilesDir/site/autoload/plug.vim" -Force
