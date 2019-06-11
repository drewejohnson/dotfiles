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
__ps1_c_green=""
__ps1_c_red=""
__ps1_c_yellow=""
__ps1_c_reset=""

case $TERM in 
    screen-256color | st-256color)
        __ps1_c_green="$(tput setaf 2)"
        __ps1_c_reset="$(tput sgr0)"
        __ps1_c_red="$(tput setaf 1)"
        __ps1_c_yellow="$(tput setaf 3)"
        ;;
esac


function __ps1_git_branch {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

function __ps1_git_dirty {
    # check if in repo
    git rev-parse --git-dir 2>/dev/null 1>/dev/null && \
        if [[ -z $(git status --porcelain) ]]; then
            echo -n "${__ps1_c_green} " 
        else
            # staged modified, added, deleted
            if [[ $(git status --porcelain | grep -e "^M" -e "^A" -e "^D" -c ) != '0' ]]; then
                echo -n "${__ps1_c_yellow} "
            fi
            # unstaged modifed, added, deleted
            if [[ $(git status --porcelain | grep -e "^.M " -e "^.A " -e "^.D " -e "^??" -c) != '0' ]]; then
                echo -n "${__ps1_c_red} "
            fi
        fi && echo ${__ps1_c_reset}
}


function __ps1_prompt_command {
    # exit status
    local __ps1_exit_stat=$?
    if [[ ${__ps1_exit_stat} == 0 ]]; then
        __ps1_exit_mark=""
    else
        __ps1_exit_mark="${__ps1_c_red}${__ps1_exit_stat}${__ps1_c_reset}"
    fi

    # virtual environment

    if [[ ! -z $VIRTUAL_ENV ]]; then
        __ps1_venv=${__ps1_c_green}\($(basename $VIRTUAL_ENV)\)${__ps1_c_reset}
    else
        __ps1_venv=""
    fi

    # number of jobs
    __ps1_njobs=$(jobs -p | wc -l)
    if [[ ${__ps1_njobs} != '0' ]]; then
        __ps1_job_mark=${__ps1_c_yellow}[${__ps1_njobs}]${__ps1_c_reset}
    else
        __ps1_job_mark=""
    fi

    export PS1='${__ps1_venv}[\u@\h] \W $(__ps1_git_branch) $(__ps1_git_dirty)\n${__ps1_exit_mark}${__ps1_job_mark}\$ '
}

export PROMPT_COMMAND="__ps1_prompt_command"

# colors for ls
source ~/.dir_colors
