#!/bin/bash

cd "$(dirname $BASH_SOURCE)"

cat alacritty.toml colors.dark.toml > alacritty.dark.toml
cat alacritty.toml colors.light.toml > alacritty.light.toml
