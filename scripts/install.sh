export dotfiles_path=~/dotfiles
export repos_path=~/repos
export scripts_path=$dotfiles_path/scripts

if [ ! -d $dotfiles_path ]; then 
  echo "The dotfiles folder must be within the home folder and be named 'dotfiles'."
  echo "If you want to rename the folder, update the 'dotfiles_path' varialbe on the install script."
  exit 1
fi

chmod +x $scripts_path/install-dependencies.sh
$scripts_path/install-dependencies.sh
if [ $? -ne 0 ]; then
  echo "Something went wrong while installing dependencies..."
  exit 1
fi

chmod +x $scripts_path/common-configurations.sh
$scripts_path/common-configurations.sh
if [ $? -ne 0 ]; then
  echo "Something went wrong while applying common configurations..."
  exit 1
fi

chmod +x $scripts_path/vm-configurations.sh
$scripts_path/vm-configurations.sh
if [ $? -ne 0 ]; then
  echo "Something went wrong while applying vm configurations..."
  exit 1
fi

chmod +x $scripts_path/git-configurations.sh
$scripts_path/git-configurations.sh
if [ $? -ne 0 ]; then
  echo "Something went wrong while applying git configurations..."
  exit 1
fi

clear
echo "Cloning Nvim configuration..."
git clone https://github.com/Aaron70/nvim.git ~/dotfiles/.config/nvim

clear
echo "Creating Symlinks with Gnu Stow for user $(whoami)..."
cd $dotfiles_path
stow .

read -p "Do you want to apply the dotfiles for the root user? y/n"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sudo stow . -t /root/
fi
