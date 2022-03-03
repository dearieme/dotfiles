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
alias vpno='sudo openvpn --askpass --daemon --config ~/openvpn/scott.thomson_unprivileged.ovpn && pgrep -l openvpn';
alias vpnp='sudo openvpn --askpass --daemon --config ~/openvpn/scott.thomson_vxdev.ovpn && pgrep -l openvpn';
alias vim=nvim
alias vi=nvim

# Local aliases
#
[ -x /usr/bin/notify-send ] && alias tea='echo "notify-send -i dialog-information -t 0 \"Tea!\" \"Your tea is nicely brewed\"" | at now +4 minutes'
[ -x /usr/bin/ack-grep ]    && alias ack='ack-grep'
[ -x /usr/bin/tmux ]        && alias tmux='tmux -2'

if [ -x /usr/bin/git ]; then
  alias gim='vim -O2 `git status -uall --short | awk '"'"'{print $2}'"'"'`'
  alias gtasks='git log -p -G "(FIXME|TODO)" origin/master.. | grep -E "FIXME|TODO" | sed -e "s/^+ \+//"'
fi

if [ -x /usr/bin/xrandr ]; then
  alias exthome='xrandr --output HDMI2 --left-of eDP1 --primary --auto'
  alias extwork='xrandr --output HDMI1 --right-of eDP1 --auto; sleep 1; xrandr --output HDMI2 --right-of HDMI1 --auto; xrandr --output eDP1 --off'
  alias extoff='xrandr --output HDMI1 --off --output HDMI2 --off --output DP1 --off; xrandr --output eDP1 --auto'
fi

if [ -x /usr/bin/bw ]; then
  alias bwul='export BW_SESSION=`bw unlock --raw`'
fi

if [ -x /usr/bin/reflector ]; then
  alias mirrors='sudo reflector --latest 20 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist'
fi

