#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

source ~/.myConfig/bashrcs/alias
export PATH=$PATH:~/.local/bin
# export PATH=$PATH:/home/rin/.local/bin
