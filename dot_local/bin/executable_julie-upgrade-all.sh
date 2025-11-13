#!/bin/sh

if command -v apk >/dev/null; then
    if [ `id -u` == 0 ]; then
        _sh='sh'
    elif command -v doas >/dev/null; then
        _sh='doas sh'
    elif command -v sudo >/dev/null; then
        _sh='sudo sh'
    else
        echo >&2 "must be root or have doas/sudo available"
        exit 1
    fi
    echo >&2 "Updating apk..."
    $_sh -c "apk update --no-interactive && apk upgrade --no-interactive" || exit 1
fi

if command -v brew >/dev/null; then
    brew update || exit 1
    brew upgrade || exit 1
fi

if command -v flatpak >/dev/null; then
    flatpak update -y || exit 1
fi

julie-install-nvim.sh || exit 1
