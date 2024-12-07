#!/usr/bin/bash

if [[ -z $DOTFILES ]]; then
  echo "Env variable 'DOTFILES' not found..."
  echo "Dotfiles installation cancelled..."
  exit 1
fi

if [[ -z $INSTALLATION_SCRIPTS ]]; then
  echo "Env variable 'INSTALLATION_SCRIPTS' not found..."
  echo "Dotfiles installation cancelled..."
  exit 1
fi

echo "Installing..."
$INSTALLATION_SCRIPTS/install.sh
if [[ $? -ne 0 ]]; then
  echo "An error occurred..."
  exit 1
fi
read -p "continue"
clear

echo "Configuring..."
$INSTALLATION_SCRIPTS/configure.sh
if [[ $? -ne 0 ]]; then
  echo "An error occurred..."
  exit 1
fi
read -p "continue"
clear

cd $DOTFILES
stow .
