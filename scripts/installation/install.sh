#!/usr/bin/bash

if [[ -z $INSTALLATION_SCRIPTS ]]; then
  echo "Env variable 'INSTALLATION_SCRIPTS' not found..."
  echo "Dotfiles installation cancelled..."
  exit 1
fi

echo "Updating the system..."
sudo pacman -Syu

echo "Intalling required packages..."
$INSTALLATION_SCRIPTS/install_packages.sh
if [[ $? -ne 0 ]]; then
  exit 1
fi 
read -p "continue"
clear

echo "Intalling Neovim..."
$INSTALLATION_SCRIPTS/install_nvim.sh
if [[ $? -ne 0 ]]; then
  exit 1
fi 
read -p "continue"
clear

echo "Installation finished!"

