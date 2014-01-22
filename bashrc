# bashrc for interactive bash(1) shells.

# bashrc is meant for non-login invocations. It should
# not print any output - that makes tools like scp fail.

# ::::::::: Environment Variables :::::::::::: {{{1

  # Library Paths {{{2

    # These variables tell your shell where they can find certain
    # required libraries so other programs can reliably call the
    # variable name instead of a hardcoded path.

    # NODE_PATH from Homebrew I believe
    export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

  # Configurations {{{2

    # GIT_MERGE_AUTO_EDIT
    # This variable configures git to not require a message when you merge.
    export GIT_MERGE_AUTOEDIT="no"

    # Editors - MacVim 7.4 option
    # Tells your shell that when a program requires various editors, use MacVim.
    # The -f flag tells your shell to wait until MacVim exits
    export VISUAL="mvim -f"
    export SVN_EDITOR="mvim -f"
    export GIT_EDITOR="mvim -f"
    export EDITOR="mvim -f"

  # Paths {{{2

    # USR_PATHS {{{3

      # The USR_PATHS variable will store all relevant /usr paths for easier usage
      # Each path is seperate via a ":" and we always use absolute paths.

      # A bit about the /usr directory
      # The /usr directory is a convention from linux that creates a common place to put
      # files and executables that the entire system needs access too. It tries to be user
      # independent, so whichever user is logged in should have permissions to the /usr directory.
      # We call that /usr/local. Within /usr/local, there is a bin directory for actually
      # storing the binaries (programs) that our system would want.
      # Homebrew adopts this convetion so things installed via Homebrew
      # get symlinked into /usr/local

      export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"

      # We build our final PATH by combining the variables defined above
      # along with any previous values in the PATH variable.

    # CDPATH {{{3

      # DON'T EXPORT THIS, as it can screw up scripts.
      CDPATH=".:~/Development:~"

    # PATH {{{3

      export PATH="/usr/local/bin:/Users/ivan/.rvm/bin:$PATH"

      # Would this be better? (Note: USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin")
      #export PATH="$USR_PATHS:$PATH"

      ### Added by the Heroku Toolbelt
      export PATH="/usr/local/heroku/bin:$PATH"

      # Add RVM to PATH for scripting
      PATH=$PATH:$HOME/.rvm/bin