# Preferred apps
export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"

if [ -f /usr/bin/most ]; then
  export PAGER="/usr/bin/most"
  export MOST_SWITCHES="-w"
else
  export PAGER="/usr/bin/less"
fi

set -o vi

# Add my bin to path
PATH="$HOME/bin:${PATH}";
export PATH;

# History control
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTIGNORE="fg"
export HISTCONTROL=ignoredups

# Activate bash-completion, Gentoo...
[ -f /etc/profile.d/bash-completion.sh ] && source /etc/profile.d/bash-completion.sh

# ... Debian...
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Read my aliases
[ -f ${HOME}/.bash_aliases ] && source ${HOME}/.bash_aliases

# Freshly brewed Perl :)
[ -f ${HOME}/perl5/perlbrew/etc/bashrc ] && source ${HOME}/perl5/perlbrew/etc/bashrc 

# Prompts, make root special
if [[ ${EUID} == 0 ]] ; then
  PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
  PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

export PS1
