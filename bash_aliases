# Global aliases, normally available on all machines
#
alias l='ls'
alias ll='ls -l'
alias l.='ls -A'
alias ll.='ls -al'
alias ls='ls --color=auto'
alias du1='du -h --max-depth=1'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias grep='grep --color=auto'

# Local aliases
#
[ -x /usr/bin/notify-send ] && alias tea='echo "notify-send -i dialog-information -t 0 \"Tea!\" \"Your tea is nicely brewed\"" | at now +4 minutes'
[ -x ${HOME}/bin/screenx.sh ] && alias screenx='screenx.sh && sleep 10 && exit'
[ -x /usr/bin/ack-grep ] && alias ack='ack-grep'
[ -x /usr/bin/tmux ] && alias tmux='tmux -2'

[ -x /usr/bin/cave ] && alias caves='cave sync && cave -c no resolve --complete --purge '\''*/*'\'' --permit-downgrade '\''*/*'\'' --continue-on-failure if-satisfied world' \
  && alias caver='cave -c no resolve --complete --purge '\''*/*'\'' --permit-downgrade '\''*/*'\'' --continue-on-failure if-satisfied world' \
  && alias caverx='cave -c no resolve --complete --purge '\''*/*'\'' --permit-downgrade '\''*/*'\'' --continue-on-failure if-satisfied world -x'

[ -x /usr/bin/git ] && alias gim='vim -p `git status --porcelain | awk '"'"'{print $2}'"'"'`'

