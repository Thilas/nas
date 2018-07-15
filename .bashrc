#
# ~/.bashrc
#

[[ -f /opt/etc/profile ]] && . /opt/etc/profile

[[ -f /opt/bin/less ]] && export PAGER=less && export LESS=-R

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

alias df='df -h'
alias du='du -h'
alias ls='ls --color=auto -h'
