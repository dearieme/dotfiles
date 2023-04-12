install:
	cp bashrc ${HOME}/.bashrc
	cp bash_profile ${HOME}/.bash_profile
	cp bash_logout ${HOME}/.bash_logout
	cp bash_aliases ${HOME}/.bash_aliases
	cp editrc ${HOME}/.editrc
	cp gitconfig ${HOME}/.gitconfig
	cp gitignore ${HOME}/.gitignore
	cp kitty.conf ${HOME}/.config/kitty/kitty.conf
	cp ghci ${HOME}/.ghci
	cp gpg-agent.conf ${HOME}/.gnupg/gpg-agent.conf
	cp tmux.conf ${HOME}/.tmux.conf
	cp ssh/rc ${HOME}/.ssh/rc
	cp -r tmux.d/* ${HOME}/.tmux.d
	cp tmux_ide.sh ${HOME}/.local/bin/
	cp xinitrc ${HOME}/.xinitrc
	cp Xresources ${HOME}/.Xresources
	cp Xmodmap ${HOME}/.Xmodmap
	cp sway/config ${HOME}/.config/sway/config
	cp waybar/config ${HOME}/.config/waybar/config
	cp waybar/style.css ${HOME}/.config/waybar/style.css
	cp hypr/hyprland.conf ${HOME}/.config/hypr/hyprland.conf
