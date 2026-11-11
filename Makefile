include config.mk

SHELL := /bin/bash

PREFIX ?= ${HOME}
CONFIG_DIR := ${PREFIX}/.config

SSH_DIR      := ${PREFIX}/.ssh
GPG_DIR      := ${PREFIX}/.gnupg
PICTURES_DIR := ${PREFIX}/Pictures
KITTY_DIR    := ${CONFIG_DIR}/kitty
MAKO_DIR     := ${CONFIG_DIR}/mako
NIRI_DIR     := ${CONFIG_DIR}/niri
NOCTALIA_DIR := ${CONFIG_DIR}/noctalia
ZATHURA_DIR  := ${CONFIG_DIR}/zathura

TMP_CONFIG_FILE := config.tmp

install:
	install -d ${SSH_DIR} ${GPG_DIR} ${KITTY_DIR} ${MAKO_DIR} \
		${NIRI_DIR} ${NOCTALIA_DIR} ${ZATHURA_DIR} ${PICTURES_DIR}
	
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
	install -m 644 Pictures/runival_sky_cwt.jpg ${PICTURES_DIR}/runival_sky_cwt.jpg
	install -m 644 ssh/rc ${SSH_DIR}/rc
	install -m 644 gpg-agent.conf ${GPG_DIR}/gpg-agent.conf
	install -m 644 mako/config ${MAKO_DIR}/config
	install -m 644 noctalia/config.toml ${NOCTALIA_DIR}/config.toml
	install -m 644 zathurarc ${ZATHURA_DIR}/zathurarc

	sed -e 's/@MAIN_MONITOR_SCALE@/$(MAIN_MONITOR_SCALE)/g' \
	    -e 's|@EXT_MONITOR@|$(EXT_MONITOR)|g' \
	    niri/config.kdl > $(TMP_CONFIG_FILE)
	install -m 644 ${TMP_CONFIG_FILE} ${NIRI_DIR}/config.kdl
	
	sed -e 's|@KITTY_FONT_SIZE@|$(KITTY_FONT_SIZE)|g' \
	    kitty.conf > $(TMP_CONFIG_FILE)
	install -m 755 ${TMP_CONFIG_FILE} ${KITTY_DIR}/kitty.conf
	
	rm -f ${TMP_CONFIG_FILE}
