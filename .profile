#!/bin/sh
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

### if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$XDG_CONFIG_HOME/bash/bashrc" ]; then
	    . "$XDG_CONFIG_HOME/bash/bashrc"
    elif [ -f "$HOME/.bashrc" ]; then
	    . "$HOME/.bashrc"
    fi
#else
    # If not running bash then set $UID manually
#    export UID="$(echo SUSER | xargs -I {} grep '^{}:' /etc/passwd | cut -d : -f 3)"
fi

### set PATH so it includes user's private bin if it exists
[ -d "$HOME/.local/mybin" ] && PATH="$PATH:$HOME/.local/mybin"
[ -d "$HOME/.local/bin"   ] && PATH="$PATH:$HOME/.local/bin"


### EXPORTS
# Set the XDG user directories
export XDG_DESKTOP_DIR="$HOME/dox/top"
export XDG_DOCUMENTS_DIR="$HOME/dox"
export XDG_DOWNLOAD_DIR="$HOME/dox/dls"
export XDG_PICTURES_DIR="$HOME/dox/pix"

# Set the XDG base directories
export XDG_CACHE_HOME="$HOME/.cache"        # Analagous to /var/cache
export XDG_CONFIG_HOME="$HOME/.config"      #              /etc
export XDG_DATA_HOME="$HOME/.local/share"   #              /usr/share
export XDG_STATE_HOME="$HOME/.local/state"  #              /var/lib
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Personal programs, theme, directories and other variables useful for aliases
# and scripting.
export BROWSER='librewolf'
export DMENU='dmenu -i -p'
export EDITOR='vis'
export MY_BIN_DIR="$HOME/.local/mybin"  # My personal script directory
export MY_MAIN_USB="$XDG_DOCUMENTS_DIR/mnt/verbatim" # Mount point for my main usb
export SHELL='/bin/fish'
export SUDO='doas'  # replace with 'sudo -A' if using sudo instead of doas
export TERMINAL='st'
export THEME='dark'

# Exa theming
export EXA_COLORS='da=37:di=36:ex=38;5;76'                  # file types
export EXA_COLORS="$EXA_COLORS:ur=38;5;220:uw=38;5;160:ux=38;5;76:ue=38;5;76"   # permission bits
export EXA_COLORS="$EXA_COLORS:sn=38;5;76:sb=38;5;76"       # file size
export EXA_COLORS="$EXA_COLORS:uu=38;5;220:un=38;5;214"     # users and groups
export TERM='xterm-256color'            # getting proper colors 

# Moving config files from $HOME to their proper XDG location
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal/config"         # Haskell
export CABAL_DIR="$XDG_CACHE_HOME/cabal"                    # Haskell
export CARGO_HOME="$XDG_DATA_HOME/cargo"                    # Rust
export GHCUP_USE_XDG_DIRS='True'                            # Haskell
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"        # Jupyter (Python)
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PYTHONSTARTUP="$MY_BIN_DIR/PYTHONSTARTUP"            # to move .python_history
export VIMINIT="source $XDG_CONFIG_HOME/nvim/init.vim"
#export VIMRUNTIME="source $XDG_CONFIG_HOME/vim/"
export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
#export MANPAGER="nvim -c 'set ft=man' -"
#export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
export SUDO_ASKPASS="$MY_BIN_DIR/dmenu-askpass"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export XAUTHORITY="$XDG_CONFIG_HOME/X11/Xauthority"  # could break some DM's

# Other
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries

### Change some default settings
doas rfkill block bluetooth
# Custom scripts
doas chbrightness 4000

### Start the X server
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then 
    cat << EOF
Which window manager would you like to start:
    default)   dwm
    a      )   awesome
    x      )   xmonad
    none   )   Stay in tty
EOF
    read WM
    [ "$WM" != 'none' ] && exec startx "$XDG_CONFIG_HOME/X11/xinitrc" "$WM"
fi
