#!/bin/bash

DOTFILES=$(realpath $(dirname "${BASH_SOURCE}"))

function put {
  local SOURCE=$1
  local DEST=$2

  local DESTDIR=$(dirname "${DEST}")

  # We're ok with overwriting links
  [ -L "${DEST}" ] && rm "${DEST}"

  if [ -e "${DEST}" ]; then
    echo "Not overwriting ${DEST}."
    return
  fi

  [ -d "${DESTDIR}" ] || mkdir -v -p ${DESTDIR}

  ln -sfv "${DOTFILES}/${SOURCE}" "${DEST}"

}

put fontconfig/80-terminalfont.conf ~/.config/fontconfig/conf.d/80-terminalfont.conf
fc-cache --verbose --really-force

put nvim ~/.config/nvim
put alacritty/alacritty.light.toml ~/.alacritty.light.toml
put alacritty/alacritty.dark.toml ~/.alacritty.dark.toml
put alacritty/alacritty-color.sh ~/.local/bin/alacritty-color.sh
ln -sf ~/.alacritty.dark.toml ~/.alacritty.toml
put tmux.conf ~/.tmux.conf

