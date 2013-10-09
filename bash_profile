# ======================
# = FLATIRON PROFILE ===
# ======================
# Configuring Our Prompt
# ======================

  # This function is called in your prompt to output your active git branch.
  function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }

  # This function builds your prompt. It is called below
  function prompt {
    # Define some local colors
    local         RED="\[\033[0;31m\]" # This syntax is some weird bash color thing I never
    local   LIGHT_RED="\[\033[1;31m\]" # really understood
    local        CHAR=""
    # ♥ ☆ - Keeping some cool ASCII Characters for reference

    # Here is where we actually export the PS1 Variable which stores the text for your prompt
    export PS1="\[\e]2;\u@\h\a[\[\e[37;44;1m\]\t\[\e[0m\]]$RED\$(parse_git_branch) \[\e[32m\]\W\[\e[0m\]\n\[\e[0;31m\]$CHAR \[\e[0m\]"
      PS2='> '
      PS4='+ '
    }

  # Finally call the function and our prompt is all pretty
  prompt

  # For more prompt coolness, check out Halloween Bash:
  # http://xta.github.io/HalloweenBash/

  # If you break your prompt, just delete the last thing you did.
  # And that's why it's good to keep your dotfiles in git too.

# Environment Variables
# =====================
  # Library Paths
  # These variables tell your shell where they can find certain
  # required libraries so other programs can reliably call the variable name
  # instead of a hardcoded path.

    # NODE_PATH
    # Node Path from Homebrew I believe
    export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

    ## PYTHON_SHARE	# This is deprecated
    ## Python Shared Path from Homebrew I believe
    #export PYTHON_SHARE='/usr/local/share/python'

    # Those NODE & Python Paths won't break anything even if you
    # don't have NODE or Python installed. Eventually you will and
    # then you don't have to update your bash_profile

  # Configurations

    # GIT_MERGE_AUTO_EDIT
    # This variable configures git to not require a message when you merge.
    export GIT_MERGE_AUTOEDIT='no'

    ## Editors - Sublime option
    ## Tells your shell that when a program requires various editors, use sublime.
    ## The -w flag tells your shell to wait until sublime exits
    # export VISUAL="subl -w"
    # export SVN_EDITOR="subl -w"
    # export GIT_EDITOR="subl -w"
    # export EDITOR="subl -w"

    # Point vim to newest (brewed) version
    alias vim='/usr/local/Cellar/vim/7.4.027/bin/vim'

    # Editors - Vim 7.4 option
    # Tells your shell that when a program requires various editors, use the
    # newest version of vim (brewed in the Cellar).
    export VISUAL="vim"
    export SVN_EDITOR="vim"
    export GIT_EDITOR="vim"
    export EDITOR="vim"

  # Paths

    # The USR_PATHS variable will just store all relevant /usr paths for easier usage
    # Each path is seperate via a : and we always use absolute paths.

    # A bit about the /usr directory
    # The /usr directory is a convention from linux that creates a common place to put
    # files and executables that the entire system needs access too. It tries to be user
    # independent, so whichever user is logged in should have permissions to the /usr directory.
    # We call that /usr/local. Within /usr/local, there is a bin directory for actually
    # storing the binaries (programs) that our system would want.
    # Also, Homebrew adopts this convetion so things installed via Homebrew
    # get symlinked into /usr/local
    export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"

    # Hint: You can interpolate a variable into a string by using the $VARIABLE notation as below.

    # We build our final PATH by combining the variables defined above
    # along with any previous values in the PATH variable.

    # Our PATH variable is special and very important. Whenever we type a command into our shell,
    # it will try to find that command within a directory that is defined in our PATH.

    # This is deprecated!
#    # Read http://blog.seldomatt.com/blog/2012/10/08/bash-and-the-one-true-path/ for more on that.
#    export PATH="$USR_PATHS:$PYTHON_SHARE:$PATH"


    # If you go into your shell and type: $PATH you will see the output of your current path.
    # For example, mine is:
    # /Users/avi/.rvm/gems/ruby-1.9.3-p392/bin:/Users/avi/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/avi/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/avi/.rvm/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/local/mysql/bin:/usr/local/share/python:/bin:/usr/sbin:/sbin:

# Helpful Functions
# =====================

# A function to CD into the desktop from anywhere
# so you just type desktop.
# HINT: It uses the built in USER variable to know your OS X username

# USE: desktop
#      desktop subfolder
function desktop {
  cd /Users/$USER/Desktop/$@
}

# A function to easily grep for a matching process
# USE: psg postgres
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# A function to extract correctly any archive based on extension
# USE: extract imazip.zip
#      extract imatar.tar
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Aliases
# =====================
  # LS
  alias l='ls -lah'

  # Git
  alias gst="git status"
  alias gl="git pull"
  alias gp="git push"
  alias gd="git diff | mate"
  alias gc="git commit -v"
  alias gca="git commit -v -a"
  alias gb="git branch"
  alias gba="git branch -a"


# Final Configurations and Plugins
# =====================
  # Git Bash Completion
  # Will activate bash git completion if installed
  # via homebrew
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi

export PATH=/usr/local/bin:/Users/ivan/.rvm/gems/ruby-1.9.3-p448/bin:/Users/ivan/.rvm/gems/ruby-1.9.3-p448@global/bin:/Users/ivan/.rvm/rubies/ruby-1.9.3-p448/bin:/Users/ivan/.rvm/bin:$PATH

# Case insensitive tab autocomplete
bind "set completion-ignore-case on"

# A function to easily grep for a matching file
# USE: lg filename
function lg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ls -la | grep "[$FIRST]$REST"
}

# Coloring
# =====================
# Enable coloring in the terminal
export CLICOLOR=1
# Specify how to color specific items
export LSCOLORS=GxFxCxDxBxegedabagaced
#The color designators are as follows: 
#
#a black 
#b red 
#c green 
#d brown 
#e blue 
#f magenta 
#g cyan 
#h light grey 
#A bold black, usually shows up as dark grey 
#B bold red 
#C bold green 
#D bold brown, usually shows up as yellow 
#E bold blue 
#F bold magenta 
#G bold cyan 
#H bold light grey; looks like bright white 
#x default foreground or background 
#
#Note that the above are standard ANSI colors. The actual 
#display may differ depending on the color capabilities of 
#the terminal in use. 
#
#The order of the attributes are as follows: 
#
#1. directory 
#2. symbolic link 
#3. socket 
#4. pipe 
#5. executable 
#6. block special 
#7. character special 
#8. executable with setuid bit set 
#9. executable with setgid bit set 
#10. directory writable to others, with sticky bit 
#11. directory writable to others, without sticky 
#bit 
#
#The default is "exfxcxdxbxegedabagacad", i.e. blue fore- 
#ground and default background for regular directories, 
#black foreground and red background for setuid executa- 
#bles, etc. 

  # RVM
  # Mandatory loading of RVM into the shell
  # This must be the last line of your bash_profile always
  [[ -s "/Users/$USER/.rvm/scripts/rvm" ]] && source "/Users/$USER/.rvm/scripts/rvm"
