These are my dotfiles. There are many like them, but these are mine. 
Without [chezmoi](https://www.chezmoi.io/), they are useless.

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

### Windows
```
C:\src\> winget install --id twpayne.chezmoi
C:\src\> chezmoi init --apply juliekoubova --source C:\src\dotfiles
```
