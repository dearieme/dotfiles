include config.mk

SHELL := /bin/bash

PREFIX ?= ${HOME}
CONFIG_DIR := ${PREFIX}/.config

SSH_DIR      := ${PREFIX}/.ssh
GPG_DIR      := ${PREFIX}/.gnupg
HYPR_DIR     := ${CONFIG_DIR}/hypr
KITTY_DIR    := ${CONFIG_DIR}/kitty
MAKO_DIR     := ${CONFIG_DIR}/mako
WAYBAR_DIR   := ${CONFIG_DIR}/waybar
NIRI_DIR     := ${CONFIG_DIR}/niri
SWAYIDLE_DIR := ${CONFIG_DIR}/swayidle

TMP_CONFIG_FILE := config.tmp

install:
	install -d ${SSH_DIR} ${GPG_DIR} ${HYPR_DIR} ${KITTY_DIR} ${MAKO_DIR} \
		${WAYBAR_DIR} ${NIRI_DIR} ${SWAYIDLE_DIR}
	
	install -m 644 Xmodmap ${PREFIX}/.Xmodmap
	install -m 644 bash_aliases ${PREFIX}/.bash_aliases
	install -m 644 bash_logout ${PREFIX}/.bash_logout
	install -m 644 bash_profile ${PREFIX}/.bash_profile
	install -m 644 bashrc ${PREFIX}/.bashrc
	install -m 644 editrc ${PREFIX}/.editrc
	install -m 644 inputrc ${PREFIX}/.inputrc
	install -m 644 ghci ${PREFIX}/.ghci
	install -m 644 gitconfig ${PREFIX}/.gitconfig
	install -m 644 gitignore ${PREFIX}/.gitignore
	install -m 644 tmux.conf ${PREFIX}/.tmux.conf
	
	install -m 644 ssh/rc ${SSH_DIR}/rc
	install -m 644 gpg-agent.conf ${GPG_DIR}/gpg-agent.conf
	
	sed -e 's/@MAIN_MONITOR_SCALE@/$(MAIN_MONITOR_SCALE)/g' \
	    -e 's|@EXT_MONITOR@|$(EXT_MONITOR)|g' \
	    hypr/hyprland.conf > $(TMP_CONFIG_FILE)
	install -m 644 ${TMP_CONFIG_FILE} ${HYPR_DIR}/hyprland.conf
	
	install -m 644 hypr/hyprpaper.conf ${HYPR_DIR}/hyprpaper.conf
	install -m 644 hypr/hyprlock.conf ${HYPR_DIR}/hyprlock.conf
	install -m 644 hypr/hypridle.conf ${HYPR_DIR}/hypridle.conf

	sed -e 's/@MAIN_MONITOR_SCALE@/$(MAIN_MONITOR_SCALE)/g' \
	    -e 's|@EXT_MONITOR@|$(EXT_MONITOR)|g' \
	    niri/config.kdl > $(TMP_CONFIG_FILE)
	install -m 644 ${TMP_CONFIG_FILE} ${NIRI_DIR}/config.kdl

	install -m 644 swayidle/config ${SWAYIDLE_DIR}/config
	
	sed -e 's/@MAIN_MONITOR_SCALE@/$(MAIN_MONITOR_SCALE)/g' \
	    hypr/lid_switch.sh > $(TMP_CONFIG_FILE)
	install -m 755 ${TMP_CONFIG_FILE} ${HYPR_DIR}/lid_switch.sh
	
	sed -e 's|@KITTY_FONT_SIZE@|$(KITTY_FONT_SIZE)|g' \
	    kitty.conf > $(TMP_CONFIG_FILE)
	install -m 755 ${TMP_CONFIG_FILE} ${KITTY_DIR}/kitty.conf
	
	install -m 644 mako/config ${MAKO_DIR}/config
	
	sed -e 's|@WAYBAR_HEIGHT@|$(WAYBAR_HEIGHT)|g' \
		waybar/config > $(TMP_CONFIG_FILE)
	install -m 755 ${TMP_CONFIG_FILE} ${WAYBAR_DIR}/config
	
	install -m 644 waybar/style.css ${WAYBAR_DIR}/style.css
	sed -e 's|@WAYBAR_FONT_SIZE@|$(WAYBAR_FONT_SIZE)|g' \
		waybar/style.css > $(TMP_CONFIG_FILE)
	install -m 755 ${TMP_CONFIG_FILE} ${WAYBAR_DIR}/style.css
	
	rm -f ${TMP_CONFIG_FILE}
