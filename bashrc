# Preferred apps
export VISUAL="nvim"
export EDITOR="nvim"
export DIFFPROG="nvim -d"
export PAGER="less"

set -o vi

# Add my local bins to path
PATH="$HOME/.local/bin:$HOME/perl5/bin:${PATH}";
export PATH;

# History control
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTIGNORE="fg"
export HISTCONTROL=ignoredups

# Activate bash-completion, Debian...
[ -r /etc/bash_completion ] && source /etc/bash_completion

# ... Arch...
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# Read my aliases
[ -f ${HOME}/.bash_aliases ] && source ${HOME}/.bash_aliases

# Freshly brewed Perl :)
[ -f ${HOME}/perl5/perlbrew/etc/bashrc ] && source "${PERLBREW_ROOT:-$HOME/perl5/perlbrew}"/etc/bashrc

# Local rust if installed
[ -f ${HOME}/.cargo/env ] && source ${HOME}/.cargo/env

# Set default libvirt connection URI
[ -x /usr/bin/virsh ] && export LIBVIRT_DEFAULT_URI=qemu:///system

# Set diff prog to nvim for pacdiff
[ -x /usr/bin/pacdiff ] && export MERGEPROG="nvim -d"

# Use git for fzf vim plugin
export FZF_DEFAULT_COMMAND='rg --files'

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
