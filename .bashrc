#
# ~/.bashrc
#

[[ -f /opt/etc/profile ]] && . /opt/etc/profile

export PAGER=less
export LESS=-R

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias df='df -h'
alias du='du -h'
alias ls='ls --color=auto -h'

