#!/usr/bin/env bash

# Ask which tmux session to start
if command -v tmux &>/dev/null; then
  if [ -z "$TMUX" ]; then
    echo ""
    echo "Select a tmux session:"
    echo "1) work"
    echo "2) personal"
    read -rp "Choose [1/2]: " choice

    case "$choice" in
    1)
      SESSION="work"
      ;;
    2)
      SESSION="personal"
      ;;
    *)
      echo "Invalid option, starting without tmux."
      exit 0
      ;;
    esac

    # Attach if exists, otherwise create
    tmux attach -t "$SESSION" 2>/dev/null || tmux new -s "$SESSION"
    exit
  fi
fi
