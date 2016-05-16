#!/usr/bin/env bash

xrdb -merge ~/.Xresources
numlockx

xsetroot -cursor_name left_ptr

setxkbmap gb
xmodmap ~/.Xmodmap

xscreensaver -no-splash &
unclutter &
xfce4-power-manager &
urxvtd -q -f -o

exec xmonad
