Function Install($Id) {
    Write-Host "Installing $Id..."
    & winget install `
        --id=$Id `
        --source=winget `
        --accept-source-agreements `
        --accept-package-agreements `
        --disable-interactivity
}

Install AgileBits.1Password
Install CoreyButler.NVMforWindows
Install 7zip.7zip
Install Docker.DockerDesktop
Install LLVM.LLVM
Install JanDeDobbeleer.OhMyPosh
Install Prusa3D.PrusaSlicer
Install Debian.Debian
Install VideoLAN.VLC
Install WinDbgNext
Install Neovim.Neovim
Install Microsoft.PowerShell
Install Microsoft.WindowsTerminal
Install Microsoft.VisualStudioCode.Insiders
Install Microsoft.DotNet.SDK.7

dotnet tool install -g dotnet-vs