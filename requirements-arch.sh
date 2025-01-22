#!/bin/bash

sudo pacman -S --needed ttf-jetbrains-mono noto-fonts-emoji

# for LSP
sudo pacman -S --needed \
    pyright clang deno gopls \
    lua-language-server yaml-language-server \
    vscode-html-languageserver vscode-json-languageserver
yay -S --needed jdtls
