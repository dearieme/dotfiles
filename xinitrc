#!/usr/bin/env bash

xrdb -merge ~/.Xresources
numlockx

# Start DBUS
source /etc/X11/xinit/xinitrc.d/30-dbus

xsetroot -cursor_name left_ptr

setxkbmap gb
xmodmap ~/.Xmodmap

xscreensaver -no-splash &
unclutter &
urxvtd -q -f -o

exec xmonad
