#!/usr/bin/env bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  # shellcheck disable=SC2015
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    #shellcheck source=/dev/null
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# custom functions
#Transfer.sh relatedstuff
## syntax transfer file.txt
transfer() { if [ $# -eq 0 ]; then printf "No arguments specified. Usage:\netransfer <file>"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> "$tmpfile"; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> "$tmpfile" ; fi; cat "$tmpfile"; rm -f "$tmpfile"; echo "";}

gentree()
{
    # Function generates directory tree from current folder
    #ignoring .git folder with directories first.
    # Expects: tree to be installed
    # Arguments: Single file name
    # Output: the output is written to file in the argument.

    #check availability of tree
    if command -v tree >&/dev/null; then
      if [ $# -eq 0 ]; then
        echo "No arguments specified. Usage: ${FUNCNAME[0]} <file to write tree to>"; return 2;
      elif [ $# -gt 1 ]; then
        printf "Invalid number of arguements. Additional arguements will be ignored.\nUsage:${FUNCNAME[0]} <file to write tree to>" ;
      fi;
        tree -a -I .git --dirsfirst > ${1} && printf "$(tput setaf 3)Generated tree file ${1}.$(tput sgr0)\n";
        cat ${1};
        return 0;
    else
      echo "Program tree is not installed. Please install tree.";
      return 1;
    fi
}

#Dotfiles
dotfile()
{
  # Function to stow the files in a Dotfiles directory.
  # Expects: stow to be installed, Directory Dotfiles to be present in home folder.
  # Arguments: Directory to be stowed
  # Output: Files in the directory are stowed.

  if command -v stow >&/dev/null; then
    if [ $# -eq 0 ]; then
        echo "No arguments specified. Usage: ${FUNCNAME[0]} <dir-to-stow>"; return 1;
    elif [ $# -gt 1 ]; then
        echo "Invalid number of arguements. Additional arguements will be ignored  Usage:  ${FUNCNAME[0]} <dir-to stow>"
    fi;
        CDIR=$PWD cd $HOME/Dotfiles && stow $1 && cd $CDIR && echo "$(tput setaf 3)DotFiles stowed. Reflecting config-files in $HOME/DotFiles/$1.";
        echo "Changes might not be reflected, till you relauch your program$(tput sgr0)";
  else
    echo "Program stow is not installed. Please install stow.";
    return 1;
  fi
}
#Restart services
restartsv()
{
    if [ $# -eq 0 ]; then echo "restart: Restart a service using systemd"
    echo "Error: No arguments specified. Usage:restart <service>"; return 1;
    elif [ $# -gt 1 ]; then
        echo "Invalid number of arguements. Additional arguements will be ignored  Usage:restart <service>"
    fi;
    if [ $UID -ne 0 ]; then
        # shellcheck disable=SC2032
        # shellcheck disable=SC2033
        sudo service $1 restart && echo "$(tput setaf 3)$1$(tput sgr0) Restarted"
    fi;
}



#Anaconda paths
#export PATH=/home/prasad/.anaconda3/bin:$PATH
#Add Custom Script paths
export PATH=~/.local/bin:$PATH
export PATH=$HOME/Android/Sdk/platform-tools:$PATH
export PATH=$HOME/Android/Sdk/build-tools/25.0.3:$PATH

#Add GPG
GPG_TTY=$(tty)
export GPG_TTY

#sudo openvpn --config /path/to/config.ovpn --auth-retry interact

ghost()
{
    if [ $# -eq 0 ]; then echo "Connect to Openvpn"
    echo "Error: No arguments specified. Usage:ghost <config>"; return 1;
    elif [ $# -gt 1 ]; then
        echo "Invalid number of arguements. Additional arguements will be ignored  Usage:ghost <config>"
    fi;
    if [ $UID -ne 0 ]; then
        sudo openvpn --config ~/.config/openvpn/$1.ovpn --auth-retry interact
    fi;
}


rnm()
{
    if [ $UID -ne 0 ]; then
        # shellcheck disable=SC2033
        sudo service network-manager restart && echo "$(tput setaf 3)network-manager $(tput sgr0)Restarted"
    fi;
}

 mv2 ()
{

        cd "$HOME"/Projects/Git/$1 && echo "$(tput setaf 3)Okay! Moved to: $(tput sgr0)${1}"

}


# The next line updates PATH for the Google Cloud SDK.
# shellcheck source=/dev/null
if [ -f '/home/prasad/.google-cloud/google-cloud-sdk/path.bash.inc' ]; then source '/home/prasad/.google-cloud/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
# shellcheck source=/dev/null
if [ -f '/home/prasad/.google-cloud/google-cloud-sdk/completion.bash.inc' ]; then source '/home/prasad/.google-cloud/google-cloud-sdk/completion.bash.inc'; fi
