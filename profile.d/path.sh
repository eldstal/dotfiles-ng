#!/bin/bash
# Find all subdirectories of ~/.local/bin and add them to $PATH

readarray -d '' NEW_DIRS < <(find ${HOME}/.local/bin -type d -and -not -path '*/.git/*' -print0)

export PATH="${PATH}:${HOME}/.local/bin"

for DIR in "${NEW_DIRS[@]}"; do
    if echo "${PATH}" | tr ':' '\n' | grep --line-regexp --fixed-strings --quiet "${DIR}"; then
        continue
    fi

    export PATH="${PATH}:${DIR}"
done
