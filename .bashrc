### ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -f $HOME/.bash_aliases ]]; then
    . $HOME/.bash_aliases
fi

### EXPORT 
export TERM='xterm-256color'                      # getting proper colors 
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries
export EXA_COLORS='da=37:di=36'
# "vim" as manpager
export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

### SET VI MODE
# Comment this line out to enable default emacs-like bindings 
set -o vi 

### PROMPT 
# This is commented out if using starship prompt 
PROMPT_COMMAND='echo -e "\e[0;36m$PWD\e[0m"'
PS1='\e[0;33m[\u@\h]\e[m \e[0;36m\$\e[0m '
#PS1='[\u@\h] \$ '

### SHOPT 
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

shopt -s autocd     # change to named directory 
shopt -s cdspell   # autocorrects cd misspellings 
shopt -s cmdhist    # save multi-line commands in history as single line 
#shopt -s dotglob 
shopt -s histappend     # do not overwrite history 
shopt -s expand_aliases # expand aliases 
shopt -s checkwinsize   # checks term size when bash regains control 

### Ignore upper and lowercase when TAB completion 
bind "set completion-ignore-case on" 

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

[ -f "/home/bryan/.ghcup/env" ] && source "/home/bryan/.ghcup/env" # ghcup-env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bryan/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bryan/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bryan/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bryan/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

### ARCHIVE EXTRACTION 
# usage: ex <file> 
ex () 
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1   ;;       
            *.tar.gz)   tar xzf $1   ;;       
            *.bz2)      bunzip2 $1   ;;       
            *.rar)      unrar x $1   ;;
            *.gz)       gunzip $1    ;;
            *.tar)      tar xf $1    ;;
            *.tbz2)     tar xjf $1   ;;       
            *.tgz)      tar xzf $1   ;;       
            *.zip)      unzip $1     ;;
            *.Z)        uncompress $1;;       
            *.7z)       7z x $1      ;;
            *.deb)      ar x $1      ;;
            *.tar.xz)   tar xf $1    ;;
            *.tar.zst)  unzstd $1    ;;       
            *)          echo "'$1' cannot be extracted via ex()" ;;     
        esac   
    else     
        echo "'$1' is not a valid file"   
    fi 
}

echo "xset set r 200 30, for key repeat"

