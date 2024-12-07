#!/usr/bin/bash

hydrate_folders() {
  home=$(find ~/ -maxdepth 1 -type d)
  projects=$(find ~/dev -maxdepth 2 -type d)
  dotfiles=$(find ~/hyprland-dotfiles/ -name .git -prune -o -type d)

  folders="$projects
  $home
  $dotfiles
  /home"

  echo -e "$folders" | fzf
}

