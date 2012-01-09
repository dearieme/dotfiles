# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp that can't
# tolerate any output so test for interactivity and return if necessary
if [[ $- != *i* ]]; then
	return
fi

# colors for ls, etc.
if [[ -f ~/.dir_colors ]]; then
	eval `dircolors -b ~/.dir_colors`
else
	eval `dircolors -b /etc/DIR_COLORS`
fi
alias ls="ls --color=auto"

# Change the window title of X terminals 
case $TERM in
	xterm*|rxvt*|Eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac

# Prompt
export PS1='\[\033[01;35m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '

# Preferred apps
export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"

if [ -f /usr/bin/most ]; then
  export PAGER="/usr/bin/most"
  export MOST_SWITCHES="-w"
else
  export PAGER="/usr/bin/less"
fi

# activate bash-completion:
[ -f /etc/profile.d/bash-completion.sh ] && source /etc/profile.d/bash-completion.sh

# Add my bin to path
PATH="$HOME/bin:${PATH}";
export PATH;

# My history control
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTIGNORE="fg"
export HISTCONTROL=ignoredups

# Read my aliases
[ -f ${HOME}/.bash_aliases ] && source ${HOME}/.bash_aliases

# Freshly brewed Perl :)
[ -f ${HOME}/perl5/perlbrew/etc/bashrc ] && source ${HOME}/perl5/perlbrew/etc/bashrc 

