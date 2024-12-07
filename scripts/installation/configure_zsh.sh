#!/usr/bin/bash

read -p "Make zsh your default terminal? y/n"
if [[ $REPLY =~ ^[Yy]?$ ]]; then
  echo ""
  chsh -s $(which zsh) 
  read -p "Make zsh the default terminal for root? y/n"
  if [[ $REPLY =~ ^[Yy]?$ ]]; then
    echo ""
    sudo chsh -s $(which zsh) 
  fi
fi
