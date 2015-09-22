# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X on login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 && -e /usr/bin/startx ]] && exec startx
