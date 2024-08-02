These are my dotfiles. There are many like them, but these are mine. 
Without [chezmoi](https://www.chezmoi.io/), they are useless.

## Installation

### Alpine
```
# apk add chezmoi
$ chezmoi init --apply juliekoubova --source ~/dotfiles
# julie-setup
```

### FreeBSD
```
# pkg install chezmoi
$ chezmoi init --apply juliekoubova --source ~/dotfiles
```
### MacOS
```
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
% brew install chezmoi
% chezmoi init --apply juliekoubova --source ~/dotfiles
```
### Windows
As Administrator in Windows PowerShell:
```
# Enable Developer Mode (needed for symlink privileges)
New-Item HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock -ea 0
Set-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock AllowDevelopmentWithoutDevLicense -Type DWord -Value 1

# Windows Explorer
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Hidden" 1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ShowSuperHidden" 1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" "FullPath" 1

# UAC
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" "EnableLUA" 1
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" "ConsentPromptBehaviorAdmin" 2
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" "PromptOnSecureDesktop" 1

# sudo
sudo config --enable normal
```
```
C:\src\> winget install --id twpayne.chezmoi
C:\src\> chezmoi init --apply juliekoubova --source C:\src\dotfiles
```

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
