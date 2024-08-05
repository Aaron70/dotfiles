clear
echo "Writing env variables for VM..."
sudo bash -c "echo -e \"$(cat /etc/environment)\n\n# Arch dotfiles env variables \n$(cat $scripts_path/.env-common)\" > /etc/environment" 
if [ $? -ne 0 ]; then
  echo "Couldn't write the env variables..."
  exit 1
fi

clear
read -p "Make zsh your default terminal? y/n"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo ""
  chsh -s $(which zsh) 
  read -p "Make zsh the default terminal for root? y/n"
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    sudo chsh -s $(which zsh) 
  fi
fi
