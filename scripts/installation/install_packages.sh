#!/usr/bin/bash

installer_packages=(
# Essentials
  "base-devel"
  "wl-clipboard"
  "git"
  "github-cli"
  "stow"
  "wget"
  "unzip"
# Desktop
  "dunst"
  "hyprland"
  "hyprlock"
  "hyprpaper"
  "thunar"
  "rofi-wayland"
  "waybar"
  "qt5-wayland"
  "qt6-wayland"
  "xdg-desktop-portal-hyprland"
# Commands
 # Rust Cargo
  "zoxide" 
  "eza" 
 # Linux package manager
  "less"
  "fzf"
  "bat"
  "curl"
# Programs
  "alacritty"
  "docker"
  "lazygit"
  "neovim"
  "tmux"
  "qutebrowser"
  "zsh"
# Fonts
  "noto-fonts"
  # "ttf-juliamono"
  "ttf-jetbrains-mono-nerd"
  "ttf-font-awesome"
)

installer_yay=(
  "oh-my-posh"
)

_isInstalled() {
  package="$1";
  check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
  if [ -n "${check}" ] ; then
    echo 0
    return
  fi;
  echo 1
  return
}

_installPackages() {
  toInstall=();
  for pkg; do
    if [[ $(_isInstalled "${pkg}") == 0 ]]; then
      echo "${pkg} is already installed.";
      continue;
    fi;
    toInstall+=("${pkg}");
  done;
  if [[ "${toInstall[@]}" == "" ]] ; then
    # echo "All pacman packages are already installed.";
    return;
  fi;
  printf "Package not installed:\n%s\n" "${toInstall[@]}";
  sudo pacman --noconfirm -S "${toInstall[@]}";
}

_installPackagesYay() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All packages are already installed.";
        return;
    fi;

    # printf "AUR packags not installed:\n%s\n" "${toInstall[@]}";
    yay --noconfirm -S "${toInstall[@]}";
}


_installYay() {
  if sudo pacman -Qs yay > /dev/null ; then
    echo "yay is already installed!"
  else
    echo "yay is not installed. Will be installed now!"
    _installPackages "base-devel"
    SCRIPT=$(realpath "$0")
    temp_path=$(dirname "$SCRIPT")
    echo $temp_path
    git clone https://aur.archlinux.org/yay-git.git ~/repos/yay-git
    cd ~/repos/yay-git
    makepkg -si
    cd $temp_path
    echo "yay has been installed successfully."
  fi
}

_installYay

echo "Installing packages with pacman..."
_installPackages "${installer_packages[@]}";
if [[ $? -ne 0 ]]; then
  echo "An error occurred..."
  exit 1
fi
read -p "continue"
clear

echo "Installing packages with pacman..."
_installPackagesYay "${installer_yay[@]}";
if [[ $? -ne 0 ]]; then
  echo "An error occurred..."
  exit 1
fi
read -p "continue"
clear

