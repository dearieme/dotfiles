#/bin/sh

urxvtc -e tmux -2 new-session -d -s ide \; source-file ~/.tmux.d/ide \; attach

