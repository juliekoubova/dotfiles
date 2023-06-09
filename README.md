### Windows
```
winget install --id git.git 
winget install --id twpayne.chezmoi
git clone https://github.com/juliekoubova/dotfiles.git
New-Item ~\.config\chezmoi -Type Directory -Force

Set-Content `
    -LiteralPath ~\.config\chezmoi\chezmoi.toml `
    -Value "sourceDir = '$((Get-Item dotfiles).FullName)'"
```
