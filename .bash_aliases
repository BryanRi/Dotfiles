# Lazy way to get back 1/2 dirs
alias ..='cd ..'
alias ...='cd ../..'

# system
alias ssn='shutdown now'
alias wifioff='nccli radio wifi off'
alias wifion='nccli radio wifi on'

# commands with extra flags
alias mvi='mv -i'
alias cpi='cp -i'
alias ll='exa -al --color=always --group-directories-first' # ls replacement

# xclip copy and paste 
alias xcopy='xclip -selection c'
alias xpaste='xclip -selection c -o'
## clear clipboard
alias xcc='xclip -sel clip < /dev/null' 

# Package installer for python3
alias pip='pip3'

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
alias tcache='git confit --global credential.helper cache'
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
alias dot='/usr/bin/git --git-dir=/home/bryan/.dotfiles/ --work-tree=/home/bryan'
alias dots='dot status'
alias dota='dot add'
alias dotau='dot add --update'
alias dotc='dot commit -m'
alias dotp='dot push'

# Calculator without welcome
alias bc='bc -q'

# Weather report
alias weather='curl wttr.in/'

