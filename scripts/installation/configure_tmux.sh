#!/usr/bin/bash
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else 
  echo "Tmux TMP already exists..."
fi
