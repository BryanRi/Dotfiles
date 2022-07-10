
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$XDG_CONFIG_HOME/bash/bashrc" ]; then
	    . "$XDG_CONFIG_HOME/bash/bashrc"
    elif [ -f "$HOME/.bashrc" ]; then
	    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH=$PATH":$HOME/bin"
[ -d "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin"


### EXPORTS
# Personal programs, theme, directories
export BROWSER='brave-browser'
export TERMINAL='st'
export EDITOR='nvim'
export SHELL='/bin/fish'
export THEME='Dark'
# Exa theming
export EXA_COLORS='da=37:di=36:ex=38;5;76'                              # file types
export EXA_COLORS="$EXA_COLORS:ur=38;5;220:uw=38;5;160:ux=38;5;76"      # permission bits
export EXA_COLORS="$EXA_COLORS:sn=38;5;76:sb=38;5;76"                   # file size
export EXA_COLORS="$EXA_COLORS:uu=38;5;220:un=38;5;214"                 # users and groups
export TERM='xterm-256color'            # getting proper colors 
# Set the XDG base directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
# Moving config files from $HOME to $XDG_CONFIG_HOME
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal/config"
export CABAL_DIR="$XDG_CACHE_HOME/cabal"
export GHCUP_USE_XDG_DIRS='True'
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc-1.0"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export HISTFILE="$XDG_CONFIG_HOME/bash/history"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export PYTHONSTARTUP="$HOME/.local/bin/PYTHONSTARTUP"         # to move .python_history
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"
export MANPAGER='/bin/bash -c "nvim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
export SUDO_ASKPASS="$HOME/.local/bin/dmenu-askpass"
#export WGETRC="$XDG_CONFIG_HOME/wgetrc"
#export XAUTHORITY="$XDG_CONFIG_HOME/X11/Xauthority"  # could break some DM's (including gdm)
# Other
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries

#kill the bluetooth on start up 
rfkill block bluetooth
