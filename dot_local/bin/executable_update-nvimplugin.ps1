#!/usr/bin/env pwsh
nvim -i NONE -c "lua require('lazy').update({ wait = true })" -c qa
If ($LastExitCode) {
  Exit 1
}

If (Get-Command chezmoi -ea SilentlyContinue) {
  chezmoi add ~/.config/nvim/lazy-lock.json
}

