clear
echo "Writing env variables for VM..."
sudo bash -c "echo -e \"$(cat /etc/environment)\n\n# Arch dotfiles env variables for VMs\n$(cat $(pwd)/scripts/.env-vm)\" > /etc/environment" 
if [ $? -ne 0 ]; then
  echo "Couldn't write the env variables..."
  exit 1
fi

clear
echo "Enable VMWare open tools..."
sudo systemctl enable vmtoolsd.service
sudo systemctl enable vmware-vmblock-fuse.service

