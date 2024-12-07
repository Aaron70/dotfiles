#!/usr/bin/bash

if [[ -z $INSTALLATION_SCRIPTS ]]; then
  echo "Env variable 'INSTALLATION_SCRIPTS' not found..."
  echo "Dotfiles installation cancelled..."
  exit 1
fi

echo "Configuring git..."
$INSTALLATION_SCRIPTS/configure_git.sh
if [[ $? -ne 0 ]]; then
  exit 1
fi
clear

echo "Configuring zsh..."
$INSTALLATION_SCRIPTS/configure_zsh.sh
if [[ $? -ne 0 ]]; then
  exit 1
fi
clear

echo "Configuring tmux..."
$INSTALLATION_SCRIPTS/configure_tmux.sh
if [[ $? -ne 0 ]]; then
  exit 1
fi
read -p "continue"
clear

echo "Configuring vm..."
$INSTALLATION_SCRIPTS/configure_vm.sh
if [[ $? -ne 0 ]]; then
  exit 1
fi
read -p "continue"
clear

echo "Configurations finished!"
