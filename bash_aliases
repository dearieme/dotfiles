# Global aliases, normally available on all machines
#
alias l='ls'
alias ll='ls -l'
alias l.='ls -A'
alias ll.='ls -al'
alias l10='ls -lt | head'
alias ls='ls --color=auto'
alias du1='du -h --max-depth=1'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias grep='grep --color=auto'
alias fuck='sudo $(history -p \!\!)'
alias vim='nvim'

# Local aliases
#
[ -x /usr/bin/notify-send ] && alias tea='echo "notify-send -i dialog-information -t 0 \"Tea!\" \"Your tea is nicely brewed\"" | at now +4 minutes'
[ -x /usr/bin/ack-grep ]    && alias ack='ack-grep'
[ -x /usr/bin/tmux ]        && alias tmux='tmux -2'
[ -x /usr/bin/Hyprland ]    && alias hypr='ssh-agent Hyprland'

if [ -x /usr/bin/git ]; then
  alias gim='vim -O2 `git status -uall --short | awk '"'"'{print $2}'"'"'`'
  alias gtasks='git log -p -G "(FIXME|TODO)" origin/master.. | grep -E "FIXME|TODO" | sed -e "s/^+ \+//"'
fi

if [ -x /usr/bin/bw ]; then
  alias bwul='export BW_SESSION=`bw unlock --raw`'
  alias vpno='bw get password "Oleeo VPN" | wl-copy --primary --paste-once; nmcli con --ask up scott.thomson_vxdev'
fi

if [ -x /usr/bin/reflector ]; then
  alias mirrors='sudo reflector --latest 20 --protocol http,https --country gb --sort rate --save /etc/pacman.d/mirrorlist'
fi

ping -q -w 1 bignasty > /dev/null 2>&1
[ $? -eq 0 ] && alias mntaud='sudo mount -t nfs -o vers=4,user bignasty:/volume1/music /media'

