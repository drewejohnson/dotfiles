# shell stuff
alias less='less -r'                          # raw control characters
alias grep='grep -n --color'                  # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
alias ls='ls -hF --color=tty'                 # classify files in colour
alias ll='ls -rhtl'                           # long list
alias la='ls -a'
alias up="cd .."
alias u2="cd ../../"
# Git
alias gs="git status "
alias gl="git log --decorate=full "
alias gch="git checkout "
alias gcm="git commit -m "
alias gb="git branch "
alias gca="git commit -a -m "
alias gd="git diff "
# external programs
alias ipy=ipython
alias py=python
alias pydb="python -m pdb"
alias fetch="neofetch --config ~/.config/neofetch/config.conf"
