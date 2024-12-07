#!/usr/bin/bash

if [[ ! -z $TMUX ]]; then
  exit 0
fi

option_prefix_rgx="^[1-9]\. "

start_without_tmux="Start without session."
create_session="Create new session."
options="$start_without_tmux
$create_session"

sessions="$(tmux list-sessions 2>/dev/null | cut -d: -f1 | awk '{print "Session: " $0}')"
if [[ ! -z $sessions ]]; then
  options="$options\n$sessions"
fi

if [[ $# -ge 1 ]]; then
  selected=$1
  if [[ -z $2 ]]; then
    dir="~"
  else
    dir=$2
  fi
else
  selected=$(echo -e "$options" | awk '{print NR ". " $0}' | fzf)
fi

if [[ -z $selected ]]; then
  echo "Option not selected."
  exit 1
fi

if expr "$selected" : ".*$start_without_tmux.*" >&/dev/null; then
  exit 0
elif expr "$selected" : ".*$create_session.*" >&/dev/null; then
  tmux new
elif expr "$selected" : "$option_prefix_rgx.*" >&/dev/null; then
  session=$(echo $selected | cut -d: -f2) 
  echo "Session $session"
  if [[ -z $TMUX ]]; then
    tmux attach-session -t $session
  elif tmux list-sessions | grep -q "^$1:"; then
    tmux switch-client -t $session
  else
    tmux new-session -s $session
  fi
else
  echo "Invalid option '$selected'."
  exit 1
fi

