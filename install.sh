#!/bin/bash

DOTFILES=$(realpath $(dirname "${BASH_SOURCE}"))

function put {
  local SOURCE=$1
  local DEST=$2

  # We're ok with overwriting links
  [ -L "${DEST}" ] && rm "${DEST}"

  if [ -e "${DEST}" ]; then
    echo "Not overwriting ${DEST}."
    return
  fi

  ln -sfv "${DOTFILES}/${SOURCE}" "${DEST}"

}


put nvim ~/.config/nvim
put alacritty.toml ~/.alacritty.toml
