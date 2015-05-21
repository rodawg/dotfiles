# Source / Edit bash_profile
alias sbs=". ~/.bash_profile"

alias vi="vim"
alias vbs="vim ~/.bash_profile"
alias vbc="vim ~/.bashrc"
alias vba="vim ~/.bash_aliases"
alias vmx="vim ~/.tmux.conf"

# Edit vimrc
alias vmc="vim ~/.vimrc"

# LS
alias l="ls -lAh"
alias la="ls -A"

# CD
alias cd..="cd .."
alias cd-="cd -"
alias code="cd ~/Development/code"
alias dot="cd ~/Development/resources/dotfiles"
alias dov="cd ~/Development/resources/dotvim"
alias cell="cd /usr/local/Cellar"
alias desk="cd ~/Desktop"
alias pcode="pushd ~/Development/code"
alias pdot="pushd ~/Development/resources/dotfiles"
alias pvimc="pushd ~/Development/resources/dotvim"
alias pcell="cd /usr/local/Cellar"

# JB
alias jb="jobs"

# DF
alias dfh="df -h"

# Screen
alias sls="screen -ls"
alias sr="screen -r"
alias ng="cd ~/Development/code/angular-phonecat && screen -S angular -c ~/.screenng"

# tmux
alias mx="tmux"
alias mxl="tmux ls"
alias mxs="tmux new-session -s"
alias mxa="tmux attach-session -t"

# MV
alias mvv="mv -v"

# RM
alias rmi="rm -i"

# Rails
alias grails="ps aux | grep '[r]ails'"

# Open Downloads in Finder
alias dld="open ~/Downloads"

# Git
alias gst="git status"
alias gasp="git add -p db/schema.rb"

# Spork
alias bork="spork &>/dev/null &"

# iOS Simulator
alias simulator='open /Applications/Xcode.app/Contents/Developer/Applications/iOS\ Simulator.app'

