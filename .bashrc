# Preferred apps
export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"

if [ -f /usr/bin/most ]; then
  export PAGER="/usr/bin/most"
  export MOST_SWITCHES="-w"
else
  export PAGER="/usr/bin/less"
fi

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

