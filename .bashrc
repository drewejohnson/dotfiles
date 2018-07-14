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

# promptline - link to vim-airline colors
# like powerline but smaller
source ~/.config/shell_prompt.sh

