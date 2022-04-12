if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -e "fish_aliases" 
    . fish_aliases
end

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "vim"

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
# set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#aaaaaa'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan


### PROMPT ###
set -g fish_prompt_pwd_dir_length 9  # expand the char length of sub directories
function fish_prompt -d "Write out the prompt"
    printf '%s%s%s\n[%s@%s]$ ' \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) $USER $hostname
end
# remove the vi mode prompt
function fish_mode_prompt; end


### FUNCTIONS ###
# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
if [ $fish_key_bindings = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end



### SETTING THE STARSHIP PROMPT ###
#starship init fish | source

