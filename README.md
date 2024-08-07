# Dotfiles configuration

This repo contains my dotfiles configurations. Some configurations might be in a different repo but the installation script will clone and install it as well.


## Installation 

Clone this repository into the home folder, checkout the branch you want to apply, give execution permissions to `scripts/install.sh` and run the script.

```bash
git clone https://github.com/Aaron70/dotfiles.git ~/dotfiles
cd dotfiles
git checkout os/archlinux
chmod +x scripts/install.sh 
./scripts/install.sh
```

> This repo uses [GNU Stow](https://www.gnu.org/software/stow/) to create symlinks for the configuration files, so this repository must be cloned into the _**home**_ directory of your user `~`.


## Branch structure 

You’ll find some branches with the following form `os/*`. Each branch contains its OS specific configurations. Since I use Arch (BTW) the branches `os/archlinux` and `os/windows` will contain the configurations for **ArchLinux** and **Windows** respectively.
Those branches prefixed with `os/vm-` means that has been tested in a virtual machine. 

##  Dotfiles configurations 

This section describes the different dotfiles configurations that will be installed after the running the installation script.

### Window Manager

Currently the configured tiling window manager is [_Hyprland_](https://hyprland.org/). You’ll find the configurations files for hyprland under `.config/hypr`.

The folder structure configuration is the following:

```
hypr
  | hyprland.conf
  | hyprpaper.conf
  |-conf
     | {configuration} // This is a place holder
        | default.conf
        | other.conf
```

On the root we’ll find the `hyprland.conf` and `hyprpaper.conf` files. Under the folder `conf` you’ll find the different folders representing a section in the configuration for hyprland. 

Inside of those folders are the files which has the actual configurations, this structure allow to have multiple flavors of configuration for each section, the default one is `default.conf`. You can change the flavor for each section by going to the `hyprland.conf` file and changing the path to the flavor you want in the section of your interest.


### Terminal

The configured terminal is [Alacritty](https://alacritty.org/). You’ll find the configurations file for alacritty under `.config/alacritty`.

The folder structure configuration is the following:

```
alacritty
  | alacritty.toml 
  |-themes
     | *
```

On the root we’ll find the `alacritty.toml` which contains the configuration and the `themes` contains some themes.


### Shell

The configured terminal is [Zsh](https://github.com/ohmyzsh/ohmyzsh). You’ll find the configurations file in `.zshrc`. This file is placed at the root of this repo.

#### Prompt theme

As prompt theme I use [ohmyposh](https://ohmyposh.dev/). You can find the files configuration under `ohmyposh/`. Here you can add various prompt themes files currently there is just a `zen.toml` which is a minimalist theme.

Then you can add the following line into your shell file to apply it:

```bash
eval "$(oh-my-posh init zsh --config ~/ohmyposh/zen.toml)"
```

### Tmux

I use [Tmux](https://github.com/tmux/tmux) to make my developtment workflow more comfortable. As a plugin manager for Tmux I use [tmp](https://github.com/tmux-plugins/tpm) so make sure to follow his installation instructions.  

### Editor

My favorite editor is neovim which its configuration is in another repository.
You can find it [here](https://github.com/aaron70/nvim), this repo will clone the respective branch from the vim configuration repo.

