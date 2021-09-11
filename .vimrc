"" ================================== color scheme 
syntax on
"let g:airline_theme='onedark'      " does not work for statusline
if (has("autocmd"))
  augroup colorextend
    autocmd!
    " Set comment color to a lighter gray
    autocmd ColorScheme * call onedark#extend_highlight("Comment", { "fg": { "gui": "#9DA1A9" } })
    " even lighter grey
    "autocmd ColorScheme * call onedark#extend_highlight("Comment", { "fg": { "gui": "#ADB1B7" } })
  augroup END
endif
colorscheme onedark

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"" ================================== statusline 
set laststatus=2
set statusline=%<%F\ %h%m%r%y   "" leftside (file-path, help-buffer, modified, readonly, file type)
set statusline+=%=%-14.(%l,%c%V%)\ %P   "" rightside (lineno, columnno, percentage)
highlight StatusLine    ctermfg=7    ctermbg=8      cterm=none

"" ================================== line numbers 
set relativenumber
set number

"" ================================== tab width 
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

"" ================================== search 
set hlsearch "":noh to undo the current search highlight
set incsearch

"" ================================== other 
set smartindent
set scrolloff=10
