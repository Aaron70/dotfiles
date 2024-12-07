#!/usr/bin/bash

read -p "You want to configure git? y/n"
if [[ ! $REPLY =~ ^[Yy]?$ ]]; then
  echo "Skipping git configurations..."
  exit 0 
fi

clear
read -p "Enter your github email: " email
git config --global user.email $email
read -p "Enter your github username: " username 
git config --global user.name $username
gh auth login
