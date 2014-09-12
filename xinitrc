#!/usr/bin/env bash

xrdb -merge ~/.Xresources
numlockx

# Start DBUS
source /etc/X11/xinit/xinitrc.d/30-dbus

# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

if [[ "$(xrandr | grep 'VGA1 connected')" != "" ]]; then
  xrandr --output VGA1 --mode 1680x1050 --left-of LVDS1;
fi

xsetroot -cursor_name left_ptr

setxkbmap gb
xmodmap ~/.Xmodmap

xscreensaver -no-splash &
urxvtd -q -f -o

exec xmonad
