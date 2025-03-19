#!/usr/bin/env bash

if grep open /proc/acpi/button/lid/LID/state; then
	hyprctl keyword monitor "eDP-1, preferred, auto, @MAIN_MONITOR_SCALE@"
else
	if [[ $(hyprctl monitors | grep "Monitor" | wc -l) != 1 ]]; then
		hyprctl keyword monitor "eDP-1, disable"
	fi
fi

