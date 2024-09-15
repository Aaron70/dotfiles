clear
echo "Installing dependencies with pacman..."
sudo pacman -Syu git stow firefox neovim docker \
  wl-clipboard unzip curl pass qt5-wayland qt6-wayland wofi \
  zsh fzf bat zoxide eza tmux \
  alacritty hyprpaper \
  open-vm-tools

if [[ $? -ne 0 ]]; then 
  echo "Couldn't install the dependencies..."
  exit 1
fi

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
