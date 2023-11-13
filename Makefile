install:
	cp -r tmux.d/* ${HOME}/.tmux.d
	cp Xmodmap ${HOME}/.Xmodmap
	cp Xresources ${HOME}/.Xresources
	cp bash_aliases ${HOME}/.bash_aliases
	cp bash_logout ${HOME}/.bash_logout
	cp bash_profile ${HOME}/.bash_profile
	cp bashrc ${HOME}/.bashrc
	cp editrc ${HOME}/.editrc
	cp ghci ${HOME}/.ghci
	cp gitconfig ${HOME}/.gitconfig
	cp gitignore ${HOME}/.gitignore
	cp gpg-agent.conf ${HOME}/.gnupg/gpg-agent.conf
	cp hypr/hyprland.conf ${HOME}/.config/hypr/hyprland.conf
	cp hypr/lid_switch.sh ${HOME}/.config/hypr/lid_switch.sh
	chmod 755 ${HOME}/.config/hypr/lid_switch.sh
	cp helix/config.toml ${HOME}/.config/helix/config.toml
	cp kitty.conf ${HOME}/.config/kitty/kitty.conf
	cp mako/config ${HOME}/.config/mako/config
	cp ssh/rc ${HOME}/.ssh/rc
	cp swayidle/config ${HOME}/.config/swayidle/config
	cp tmux.conf ${HOME}/.tmux.conf
	cp tmux_ide.sh ${HOME}/.local/bin/
	cp waybar/config ${HOME}/.config/waybar/config
	cp waybar/style.css ${HOME}/.config/waybar/style.css
	cp xinitrc ${HOME}/.xinitrc
