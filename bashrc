# By: Felipe Avelar
# ~/.bashrc
#

[[ $- != *i* ]] && return

cat ~/.config/archascii.txt
echo

alias sudo="sudo "
alias grep='grep --color=auto'
alias ls='lsd'
alias l='lsd -l'
alias ll='lsd -la'
alias avavelar='clear; ssh felipe@xxxxxxxxxxxxxx'
alias felipao='clear; ssh felipe@xxxxxxxxxxxxxxx'
alias h='helix'
bind 'set completion-ignore-case on'
PS1='\[\e[1;34m\]$(if [ "$PWD" == "$HOME" ]; then echo -e " \[\e[0;90m\]~"; else echo -e " \[\e[0;90m\]\w"; fi)\n\[\e[m\] > '
