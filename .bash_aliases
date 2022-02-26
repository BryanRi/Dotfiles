# webgoat
alias webgoat='java -jar ~/Downloads/webgoat-server-8.2.2.jar'

# Lazy way to get back 1/2 dirs
alias ..='cd ..'
alias ...='cd ../..'
alias ru='cd /media/br/ru'
alias fp='cd /media/br/ru/fp/'

# system
alias ssn='shutdown now'
alias wifioff='nmcli radio wifi off'
alias wifion='nmcli radio wifi on'

# mount usb, writable by non-root users
#alias mounto='sudo mount -o gid=users,fmask=113,dmask=002'
alias mounto='sudo mount -o uid=1000,fmask=113,dmask=002'
alias mtu='sudo mount -o uid=1000,fmask=113,dmask=002 /dev/sda1 /media/br/'
alias mto='sudo umount /dev/sda1'

# apt
alias apti='sudo apt install'
alias aptr='sudo apt remove'
alias aptu='sudo apt update'
alias aptuu='sudo apt update && sudo apt upgrade'
alias aptar='sudo apt autoremove'

# pacman and yay
alias pacs='doas pacman -S'
alias pacsyu='doas pacman -Syyu'                 # update only standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='doas rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='doas pacman -Rns (pacman -Qtdq)'  # remove orphaned packages

# get fastest mirrors
alias mirror="doas reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="doas reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="doas reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="doas reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|ta    il -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# commands with extra flags
alias mvi='mv -i'
alias cpi='cp -i'
alias ll='exa -al --color=always --group-directories-first' # ls replacement

# xclip copy and paste 
alias xcopy='xclip -selection c'
alias xpaste='xclip -selection c -o'
## clear clipboard
alias xcc='xclip -sel clip < /dev/null' 

# Programming
alias pip='pip3'
alias note='~/anaconda3/bin/jupyter-notebook'

# Download an audio file from youtube with youtube-dl
alias yt-dl-audio='youtube-dl -x --audio-format mp3'

# Git
alias ta='git add'
alias taa='git add .'
alias taaa='git add --all'
alias tau='git add --update'
alias tb='git branch'
alias tbd='git branch --delete '
alias tc='git commit'
alias tcache='git config --global credential.helper cache'
alias tcon='git config --global user.name "Your_Name" && git config --global user.email "Your-Email"'
alias tcm='git commit --message'
alias tcf='git commit --fixup'
alias tcl='git clone'
alias tco='git checkout'
alias tcob='git checkout -b'
alias tcom='git checkout master'
alias tcos='git checkout staging'
alias tcod='git checkout develop'
alias td='git diff'
alias tda='git diff HEAD'
alias ti='git init'
alias tlg='git log --graph --oneline --decorate --all'
alias tld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias tm='git merge --no-ff'
alias tma='git merge --abort'
alias tmc='git merge --continue'
alias tp='git pull'
alias tpr='git pull --rebase'
alias tr='git rebase'
alias ts='git status'
alias tss='git status --short'
alias tst='git stash'
alias tsta='git stash apply'
alias tstd='git stash drop'
alias tstl='git stash list'
alias tstp='git stash pop'
alias tsts='git stash save'
## Managing dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dots='dot status'
alias dota='dot add'
alias dotau='dot add --update'
alias dotc='dot commit -m'
alias dotp='dot push'

# Calculator without welcome
alias bc='bc -q'

# Weather report
alias weather='curl wttr.in/'

