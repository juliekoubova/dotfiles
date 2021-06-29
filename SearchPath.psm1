Function Add-SearchPath([String]$Path) {
    $Separator = ';'
    If ($IsMacOS -Or $IsLinux) {
        $Separator = ':'
    }

    $Items = @($Env:PATH -Split $Separator)
    $Items += $Path
    $Env:PATH = ($Items | Select-Object -Unique) -Join $Separator
}

