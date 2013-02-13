#!/usr/bin/env bash

xrdb -merge ~/.Xdefaults

eval "$(killall gpg-agent & gpg-agent --enable-ssh-support --daemon)"
numlockx

if [[ "$(xrandr | grep 'VGA-0 connected')" != "" ]]; then
  xrandr --output VGA-0 --off;
  xrandr --auto;
  xrandr --output VGA-0 --left-of LVDS;
  xrandr --output LVDS --primary;
fi

urxvtd -q -f -o

mpd ~/.mpdconf

exec ck-launch-session dbus-launch --sh-syntax --exit-with-session awesome \
   >> ~/.awesome_stdout \
  2>> ~/.awesome_stderr
