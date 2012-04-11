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
alias e='vim'
alias grep='grep --color=auto'
alias pgrep='pgrep -l'
alias rmbaks='find . -name "*~" -exec rm {} \;'

# Local aliases
#
[ -x /usr/bin/notify-send ] && alias tea='echo "notify-send -i dialog-information -t 0 \"Tea!\" \"Your tea is nicely brewed\"" | at now +4 minutes'
[ -x ${HOME}/bin/screenx.sh ] && alias screenx='screenx.sh && sleep 5 && exit'
[ -x /usr/bin/ack-grep ] && alias ack='ack-grep'
