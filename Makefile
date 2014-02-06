install:
	cp bashrc ${HOME}/.bashrc
	cp bash_profile ${HOME}/.bash_profile
	cp bash_logout ${HOME}/.bash_logout
	cp bash_aliases ${HOME}/.bash_aliases
	cp gitconfig ${HOME}/.gitconfig
	cp tmux.conf ${HOME}/.tmux.conf
	cp -r tmux.d/* ${HOME}/.tmux.d
	cp -r awesome ${HOME}/.config/
	cp xinitrc ${HOME}/.xinitrc
	cp Xresources ${HOME}/.Xresources
