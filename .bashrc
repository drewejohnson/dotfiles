#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

# powerline
powerline-daemon -q
if [ $TERM != 'xterm-256color' ]; then
    
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
fi

