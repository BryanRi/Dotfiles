### Source fish aliases and variables ###
[ -f $XDG_CONFIG_HOME/fish/fish_aliases ] && . $XDG_CONFIG_HOME/fish/fish_aliases
[ -f $XDG_CONFIG_HOME/fish/fish_abbreviations ] && . $XDG_CONFIG_HOME/fish/fish_abbreviations
[ -f $XDG_CONFIG_HOME/fish/theme.env ] && . $XDG_CONFIG_HOME/fish/theme.env

### EXPORT ###
set fish_greeting           # Supresses fish's intro message

### SET EITHER EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end

### Colorscheme ###
set     fish_color_normal            brcyan
set     fish_color_autosuggestion    aaaaaa
set     fish_color_command           brcyan
set     fish_color_error             ff6c6b
set     fish_color_param             brcyan
# Colorscheme: Base16 Default Light
set -U  fish_color_quote             f7ca88
set -U  fish_color_redirection       brgreen
set -U  fish_color_end               ba8baf
set -U  fish_color_comment           f7ca88
set -U  fish_color_match             7cafc2
set -U  fish_color_selection         white      --bold --background=brblack
set -U  fish_color_search_match      bryellow   --background=brblack
set -U  fish_color_history_current              --bold
set -U  fish_color_operator          7cafc2
set -U  fish_color_escape            86c1b9
set -U  fish_color_cwd               green
set -U  fish_color_cwd_root          red
set -U  fish_color_valid_path                    --underline
set -U  fish_color_user              brgreen
set -U  fish_color_host              normal
set -U  fish_color_cancel                        --reverse
set -U  fish_pager_color_prefix      normal      --bold --underline
set -U  fish_pager_color_progress    brwhite     --background=cyan
set -U  fish_pager_color_completion  normal
set -U  fish_pager_color_description B3A06D
set -U  fish_pager_color_selected_background     --background=brblack

### PROMPT ###
set -g fish_prompt_pwd_dir_length 9  # expand the char length of sub directories
function fish_prompt -d "Write out the prompt"
    set -l fish_color_host blue
    set -l fish_color_user yellow
    printf '%s%s\n%s[%s%s%s@%s%s%s]%s$%s ' \
        (set_color --bold $fish_color_cwd) (prompt_pwd) \
        (set_color --bold "#993299") \
        (set_color --bold $fish_color_user) $USER \
        (set_color --bold red) \
        (set_color --bold $fish_color_host) $hostname \
        (set_color --bold "#993299") \
        (set_color --bold "#66b266") \
        (set_color normal)
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

function ex --description "Expand or extract bundled & compressed files"
    set --local ext (echo $argv[1] | awk -F. '{print $NF}')
    switch $ext
        case tar  # non-compressed, just bundled
            tar -xvf $argv[1]
        case gz
            if test (echo $argv[1] | awk -F. '{print $(NF-1)}') = tar # tar bundle compressed with gzip
                tar -zxvf $argv[1]
            else  # single gzip
                gunzip $argv[1]
            end
        case tgz  # same as tar.gz
            tar -zxvf $argv[1]
        case bz2  # tar compressed with bzip2
            tar -jxvf $argv[1]
        case rar
            unrar x $argv[1]
        case zip
            unzip $argv[1]
        case '*'
            echo "unknown extension '$ext'"
    end
end
