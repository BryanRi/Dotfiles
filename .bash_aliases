# Lazy way to get back 1/2 dirs
alias ..="cd .."
alias ...="cd ../.."

# system
alias ssn="shutdown now"
alias wifioff="nccli radio wifi off"
alias wifion="nccli radio wifi on"

# Copy and paste 
alias xcopy="xclip -selection c"
alias xpaste="xclip -selection c -o"

# Package installer for python3
alias pip="pip3"

# Download an audio file from youtube with youtube-dl
alias yt-dl-audio="youtube-dl -x --audio-format mp3"

# Git
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcache='git config --global credential.helper cache'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gcl='git clone'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'
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

