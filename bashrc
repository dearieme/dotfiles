# Preferred apps
export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"

VIMPPATH=`which vimpager`
if [ -e $VIMPPATH ]; then
  export PAGER=$VIMPPATH
  alias less=$PAGER
  alias zless=$PAGER
else
  export PAGER="/usr/bin/less"
fi

set -o vi

# Add my local bins to path
PATH="$HOME/.cabal/bin:$HOME/bin:${PATH}";
export PATH;

# History control
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTIGNORE="fg"
export HISTCONTROL=ignoredups

# Activate bash-completion, Gentoo...
[ -r /etc/profile.d/bash-completion.sh ] && source /etc/profile.d/bash-completion.sh

# ... Debian...
[ -r /etc/bash_completion ] && source /etc/bash_completion

# ... Arch...
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

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
