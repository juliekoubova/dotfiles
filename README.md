These are my dotfiles. There are many like them, but these are mine. 
Without [chezmoi](https://www.chezmoi.io/), they are useless.

## Installation

### Alpine
```
# apk add chezmoi
$ chezmoi init --apply juliekoubova --source ~/dotfiles
```

### FreeBSD
```
# pkg install chezmoi
$ chezmoi init --apply juliekoubova --source ~/dotfiles
```
### macOS (Apple Silicon)
```shell
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
% /opt/homebrew/bin/brew install chezmoi
% /opt/homebrew/bin/chezmoi init --apply juliekoubova --source ~/dotfiles
```
### macOS (Intel)
```shell
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
% brew install chezmoi
% chezmoi init --apply juliekoubova --source ~/dotfiles
```
### Windows
First, run this in an elevated PowerShell:
```pwsh
# Enable Developer Mode (needed for symlink privileges)
New-Item HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock -ea 0
Set-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock AllowDevelopmentWithoutDevLicense -Type DWord -Value 1

# Enable scripts in Windows PowerShell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force

# Enable Sudo for Windows
sudo config --enable normal
```
Then reboot and execute this in a non-elevated PowerShell:
```pwsh
winget install --id twpayne.chezmoi
chezmoi init --apply juliekoubova --source C:\src\dotfiles
```
Finally, open a n
## Write Access
1. Generate an SSH key if there isn't one yet.

    ```
    # ssh-keygen -t ed25519
    # cat ~/.ssh/id_ed25519.pub | wlcopy
    ```
2. Go to [Settings > SSH and GPG keys](https://github.com/settings/keys) and add it there.
   
3. Change the repo's `origin` remote to use SSH:

    ```
    # git remote set-url origin git@github.com:juliekoubova/dotfiles.git
    ```
