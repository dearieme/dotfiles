# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# secret agents
[[ -e /usr/bin/gpgconf ]] && gpgconf --launch gpg-agent
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
export GPG_TTY=$(tty)

# Start X on login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 && -e /usr/bin/startx ]] && exec startx
