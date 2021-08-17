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

# Managing dotfiles
alias config='/usr/bin/git --git-dir=/home/bryan/.dotfiles/ --work-tree=/home/bryan'
alias gitcache='git config --global credential.helper cache'

# Calculator without welcome
alias bc='bc -q'

# Weather report
alias weather='curl wttr.in/Winterswijk'
