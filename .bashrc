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

#
# Shell prompt
#

# get some colors
GREEN=""
RED=""
YELLOW=""
RESET=""

case $TERM in 
    screen-256color | st-256color)
        GREEN="$(tput setaf 2)"
        RESET="$(tput sgr0)"
        RED="$(tput setaf 1)"
        YELLOW="$(tput setaf 3)"
        ;;
esac


function __ps1_git_branch {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

function __ps1_git_dirty {
    # check if in repo
    git rev-parse --git-dir 2>/dev/null 1>/dev/null && \
        if [[ -z $(git status --porcelain) ]]; then
            echo -n "${GREEN} " 
        else
            # staged modified, added, deleted
            if [[ $(git status --porcelain | grep -e "^M" -e "^A" -e "^D" -c ) != '0' ]]; then
                echo -n "${YELLOW} "
            fi
            # unstaged modifed, added, deleted
            if [[ $(git status --porcelain | grep -e "^.M " -e "^.A " -e "^.D " -e "^??" -c) != '0' ]]; then
                echo -n "${RED} "
            fi
        fi && echo ${RESET}
}

export PS1='[\u@\h] \W $(__ps1_git_branch) $(__ps1_git_dirty)\n\$ '

# colors for ls
source ~/.dir_colors
