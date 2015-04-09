install:
	cp bashrc ${HOME}/.bashrc
	cp bash_profile ${HOME}/.bash_profile
	cp bash_logout ${HOME}/.bash_logout
	cp bash_aliases ${HOME}/.bash_aliases
	cp editrc ${HOME}/.editrc
	cp gitconfig ${HOME}/.gitconfig
	cp gpg-agent.conf ${HOME}/.gnupg/gpg-agent.conf
	cp tmux.conf ${HOME}/.tmux.conf
	cp ssh/rc ${HOME}/.ssh/rc
	cp -r tmux.d/* ${HOME}/.tmux.d
	cp tmux_ide.sh ${HOME}/bin/
	cp -r awesome ${HOME}/.config/
	cp xinitrc ${HOME}/.xinitrc
	cp Xresources ${HOME}/.Xresources
	cp Xmodmap ${HOME}/.Xmodmap
	cp xmobarrc ${HOME}/.xmobarrc
	cp xmonad.hs ${HOME}/.xmonad/

