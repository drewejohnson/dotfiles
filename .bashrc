#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=~/.local/bin:$PATH
export XDG_CONFIG_HOME=~/.config
export EDITOR=vim
export VISUAL=vim
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export BSTINPUTS=~/.latex
#
# Aliases
#
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#
# Functions
#
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -f ~/.bash_gt ]; then
    . ~/.bash_gt
fi

export PS1='[\u@\h] \W\n\$ '

# colors for ls
source ~/.dir_colors
