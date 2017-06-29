#!/usr/bin/env bash
# ~/.bash-aliases: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# collection of aliases

# Custom alias for weather
alias weather='curl wttr.in'

#update wallpaper
#alias uwp='python ~/.local/bin/bing-wallpaper/bing.py'

# Colorful grep cmds
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#show open ports
alias ports='netstat -tulanp'

## pass options to free ##
alias meminfo='free -m -l -t'

#disk space
alias diskinfo='df -H'

## Get server cpu info ##
alias cpuinfo='lscpu'

## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'


# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias update='sudo apt update'
    alias upgradable='sudo apt list --upgradable'
    alias agi='sudo apt install'
    alias apt-clean='sudo apt-get clean'
    alias dpkg-reconfigure='reconfig'
fi

#clear time saver
alias c=clear
alias e=exit
alias q=exit
alias dot='cd ~/Dotfiles'
alias documents='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias desktop='cd ~/Desktop'
alias music='cd ~/Music'
alias videos='cd ~/Videos'
alias pinggoogle='ping google.com'
alias pingdns='ping 8.8.8.8'
alias ext='gnome-shell-extension-tool'
alias bashrc='gedit ~/.bashrc'
alias greph='history |grep'

#Michu
#To generate tree for repository minchu
alias minchu-tree='tree -a -I .git -I ".git|untrackedfiles" --dirsfirst >minchu.tree'


#fun
alias sindhu='echo "$(tput setaf 3)Hi ${USER}, How can I help?$(tput sgr0)"'
alias ilu='echo "$(tput setaf 3)Ohhh!! Love you too Hon!$(tput sgr0)"'
alias gurr='echo "$(tput setaf 3)Oops! Did I do somrthing wrong?? Sorry!!!$(tput sgr0)"'

#restart services
alias lightdm-restart='sudo service lightdm restart'
alias nmr='sudo service network-manager restart'

#Restart imwhell
alias updatescroll='killall imwheel && imwheel'

# filter processes
alias pfilter='ps -faux | grep'

#Project dir aliases
alias valarie-beacon='cd $HOME/Projects/Git/google-analytics-beacon'
alias gabeacon='cd $HOME/Projects/Git/google-analytics-beacon'
alias gominchu='cd $HOME/Projects/Git/minchu'
alias fingerprint='cd $HOME/Projects/Git/valarie-server'
alias linkit='cd $HOME/Projects/Git/minchu && ./cp2stow -c'
