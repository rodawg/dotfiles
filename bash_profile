#!bin/bash

# ::::::::: Preamble ::::::::::::::::::::::::: {{{1

# bash_profile is meant for login invocations.
# OSX conventionally uses a login shell for all interactive
# sessions, so I'm setting environment variables in bashrc
# and using bash_profile for prompts and functions.

# ::::::::: Environtment Variables ::::::::::: {{{1

  # Source .bashrc if it exists
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi

# ::::::::: Aliases :::::::::::::::::::::::::: {{{1

  # Source bash_aliases if it exists
  if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
  fi

# ::::::::: Functions :::::::::::::::::::::::: {{{1

  # Source bash_functions if it exists
  if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
  fi

# ::::::::: Final Config and Plugins ::::::::: {{{1

  # History {{{2
    # Erase duplicates in history
      export HISTCONTROL=erasedups

    # Store 10k history entries
      export HISTSIZE=10000

    # Append to the history file when exiting instead of overwriting it
      shopt -s histappend

  # Case insensitive tab autocomplete {{{2
  bind "set completion-ignore-case on"

  # Git Bash Completion {{{2
  # Activate bash git completion if installed via homebrew
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi

  # Colors {{{2
    # grep
    export GREP_OPTIONS="--color"

    # Enable coloring in the terminal
    export CLICOLOR=1
    if [[ "$THEME" =~ dark ]]; then
      export LSCOLORS="GxBxBxDxBxEgEdxbxgxcxd"
    else
      export LSCOLORS="DxfxCxDxbxegedabagaced"
    fi

    # Order of attributes:
    #  1. directory
    #  2. symbolic link
    #  3. socket
    #  4. pipe
    #  5. executable
    #  6. block special
    #  7. character special
    #  8. executable with setuid bit set
    #  9. executable with setgid bit set
    # 10. directory writable to others, with sticky bit
    # 11. directory writable to others, without sticky bit
    # Default is "exfxcxdxbxegedabagacad"

    # Color designators:
    # a black         A bold black (grey)
    # b red           B bold red
    # c green         C bold green
    # d brown         D bold brown (yellow)
    # e blue          E bold blue
    # f magenta       F bold magenta
    # g cyan          G bold cyan
    # h light grey    H bold light grey (white)
    # x default foreground or background


    # Order of attributes: {{{3
      #  1. directory
      #  2. symbolic link
      #  3. socket
      #  4. pipe
      #  5. executable
      #  6. block special
      #  7. character special
      #  8. executable with setuid bit set
      #  9. executable with setgid bit set
      # 10. directory writable to others, with sticky bit
      # 11. directory writable to others, without sticky bit
      # Default is "exfxcxdxbxegedabagacad"

    # Source .bash_colors if it exists
    if [ -f ~/.bash_colors.sh ]; then
      . ~/.bash_colors.sh
    fi

    # Color designators: {{{3
      # a black       A bold black (grey)
      # b red         B bold red
      # c green       C bold green
      # d brown       D bold brown (yellow)
      # e blue        E bold blue
      # f magenta     F bold magenta
      # g cyan        G bold cyan
      # h light grey  H bold light grey (white)
      # x default foreground or background

# ::::::::: Prompt ::::::::::::::::::::::::::: {{{1

    # Git prompt components
    minutes_since_last_commit() {
      now=`date +%s`
      last_commit=`git log --pretty=format:'%at' -1 2>/dev/null`
      if [ "$?" -eq 0 ]; then
        seconds_since_last_commit=$((now-last_commit))
        minutes_since_last_commit=$((seconds_since_last_commit/60))
        echo $minutes_since_last_commit
      fi
    }
    minutes_color() {
      if [ -z "$1" ]; then
        return
      elif [[ "$1" -gt 30 ]]; then
        echo "${RED}"
      elif [[  "$1" -gt 10  ]]; then
        echo "${YELLOW}"
      else
        echo "${GREEN}"
      fi
    }
    grb_git_prompt() {
      local g="$(__gitdir)"
      if [ -n "$g" ]; then
        local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
        if [ -n "$MINUTES_SINCE_LAST_COMMIT" ]; then
          local COLOR=`minutes_color MINUTES_SINCE_LAST_COMMIT`
          local SINCE_LAST_COMMIT="|${COLOR}$(minutes_since_last_commit)m${NORMAL}"
        fi
        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_PROMPT=`__git_ps1 "(${hi_color}%s$NORMAL${SINCE_LAST_COMMIT})"`
        echo ${GIT_PROMPT}
      fi
    }
    # Build the prompt
    prompt() {
      # some chars for reference: <U+F8FF> ⧉ ℔ λ ⦔ Ω №  ✓
      export PS1="\[╭╺(${BLUE}\u${NORMAL}:${hi_color}\W${NORMAL}) \$(grb_git_prompt) ${NORMAL}\n╰╺⧉ "
      export PS2="   > "
      export PS4="   + "
      }

      hi_color() {
        if [[ "$THEME" =~ dark ]]; then
          echo $WHITE
        else
          echo $BLACK
        fi
      }

    # Call the prompt function
    prompt

# ::::::::: rbenv :::::::::::::::::::::::::::: {{{1

    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

