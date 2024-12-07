#!/usr/bin/bash

if [[ -z $DOTFILES ]]; then
  echo "Env variable 'DOTFILES' not found..."
  echo "Installation canceled..."
  exit 1
fi

echo "Cloning Nvim configuration..."
git clone -b personal https://github.com/Aaron70/kickstart.nvim.git $DOTFILES/.config/nvim
