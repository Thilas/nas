#
# ~/.bashrc
#

[[ -f /opt/etc/profile ]] && . /opt/etc/profile

[[ -f /opt/bin/less ]] && export PAGER=less && export LESS=-R

[[ -f ~/.git/git-completion.bash ]] && . ~/.git/git-completion.bash
[[ -f ~/.git/git-prompt.sh ]] && . ~/.git/git-prompt.sh

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

export GIT_PS1_SHOWUPSTREAM='git verbose'
GIT_PS1='\[\033[01;37m\]`status=$(git status --porcelain=v1 2> /dev/null);[[ $(echo -e "$status"|grep "^ M ") ]]&&echo "\[\033[31m\]"||([[ -n $status ]]&&echo "\[\033[33m\]"||echo "\[\033[96m\]")`$(__git_ps1 "(%s) ")'
export PS1="$GIT_PS1$PS1"

alias df='df -h'
alias du='du -h'
alias ls='ls --color=auto -h'

