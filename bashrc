# Preferred apps
export VISUAL="vim"
export EDITOR="vim"
export PAGER="less"

set -o vi

# Add my local bins to path
PATH="$HOME/.local/bin:$HOME/.vim/pack/bundle/start/fzf/bin:${PATH}";
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

# Use git for fzf vim plugin
export FZF_DEFAULT_COMMAND='git ls-files'

# Set SSH to use gpg-agent where supported
if [[ -x /usr/bin/gpg-connect-agent ]] ; then
  gpg-connect-agent updatestartuptty /bye >/dev/null
  unset SSH_AGENT_PID
  if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
  fi
  export GPG_TTY=$(tty)
fi

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
