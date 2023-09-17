These are my dotfiles. There are many like them, but these are mine.

### Alpine
```console
# apk add chezmoi
$ chezmoi init --apply juliekoubova --source ~/dotfiles
```

### FreeBSD
```console
# pkg install chezmoi
$ chezmoi init --apply juliekoubova --source ~/dotfiles
```

### Windows
```console
C:\src\> winget install --id twpayne.chezmoi
C:\src\> chezmoi init --apply juliekoubova --source C:\src\dotfiles
```
