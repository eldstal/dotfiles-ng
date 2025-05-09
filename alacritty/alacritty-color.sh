#!/bin/bash

NEWMODE="dark"

if [ "$1" == "dark" ]; then
    NEWMODE="dark"
elif [ "$1" == "light" ]; then
    NEWMODE="light"
else
    CURRENT=$(readlink ~/.alacritty.toml)

    if [[ "$CURRENT" == *dark* ]]; then
        NEWMODE="light"
    else
        NEWMODE="dark"
    fi
fi

TARGET="${HOME}/.alacritty.${NEWMODE}.toml"

if [ -r "${TARGET}" ]; then
    echo "Switching to ${NEWMODE}"
    ln -sf "${TARGET}" ~/.alacritty.toml
fi
