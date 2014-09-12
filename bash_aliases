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
alias fuck='sudo $(history -p \!\!)'

# Local aliases
#
[ -x /usr/bin/notify-send ] && alias tea='echo "notify-send -i dialog-information -t 0 \"Tea!\" \"Your tea is nicely brewed\"" | at now +4 minutes'
[ -x /usr/bin/ack-grep ] && alias ack='ack-grep'
[ -x /usr/bin/tmux ] && alias tmux='tmux -2'
[ -x /usr/bin/git ] && alias gim='vim -p `git status --short | awk '"'"'{print $2}'"'"'`'

if [ -x /usr/bin/xrandr ]; then
  alias ext1on='xrandr --output VGA1 --mode 1680x1050 --left-of LVDS1';
  alias ext1off='xrandr --output VGA1 --off';
  alias ext2on='xrandr --output LVDS1 --off; xrandr --output HDMI1 --mode 1920x1080; xrandr --output VGA1 --right-of HDMI1 --mode 1920x1080';
  alias ext2off='xrandr --output HDMI1 --off; xrandr --output VGA1 --off; xrandr --output LVDS1 --mode 1366x768';
fi

