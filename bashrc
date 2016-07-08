# Preferred apps
export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"

set -o vi

# Add my local bins to path
PATH="$HOME/.cabal/bin:$HOME/bin:${PATH}";
export PATH;

[ -x /usr/bin/keychain ] && eval $(keychain --eval -Q --quiet)

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

# Set default libvirt connection URI
[ -x /usr/bin/virsh ] && export LIBVIRT_DEFAULT_URI=qemu:///system

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

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
