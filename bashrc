# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ytsubs='ytfzf -t -cS --sort-by=upload_date'
alias yt='ytfzf -t'
alias lock='slock'
alias xbi='sudo xbps-install'
alias xbr='sudo xbps-remove -Oo'
alias xbu='sudo xbps-install -Suv'
alias xbq='xbps-query -Rs'
alias wgu='wg-quick up za-jnb-wg-002'
alias wgd='wg-quick down za-jnb-wg-002'
alias bgfill='feh --bg-fill'
alias bgtile='feh --bg-tile'
alias hi='scrot -a 0,0,1366,768'

PS1='[\u@\h \W]\$ '
