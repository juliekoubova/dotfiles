$Modules = @(
    'oh-my-posh'
    'posh-git'
    'PSReadLine'
)

Set-PSRepository PSGallery -InstallationPolicy Trusted

Update-Module 
Install-Module `
    -AcceptLicense `
    -Confirm:$false `
    -Repository PSGallery `
    -Name $Modules `
    -Scope CurrentUser