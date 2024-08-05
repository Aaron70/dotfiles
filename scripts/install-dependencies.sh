clear
echo "Installing dependencies with pacman..."
sudo pacman -Syu git stow firefox neovim \
  wl-clipboard unzip curl pass \
  zhs fzf bat zoxide eze tmux \
  alacritty hyprpaper \
  open-vm-tools

clear
echo "Checking if yay is installed..."
yay --version &> /dev/null
if [ $? -ne 0 ]; then 
  echo "Installing yay..."
  if [ ! -d $repos_path/ ]; then 
    mkdir $repos_path
  fi
  cd $repos_path 
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  if [ $? -ne 0 ]; then
    echo "Can not install yay..."
    exit 1
  fi
  cd $dotfiles_path
fi

clear
echo "Installing dependencies with Yay!..."
yay -S oh-my-posh jlink

clear
echo "Installing fonts..."
sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts

clear
echo "Installing Tmux Pluging Manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
