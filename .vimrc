""https://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/

"" statusline
set laststatus=2
set statusline=%<%F\ %h%m%r%y   "" leftside (file-path, help-buffer, modified, readonly, file type)
set statusline+=%=%-14.(%l,%c%V%)\ %P   "" rightside (lineno, columnno, percentage)
highlight StatusLine    ctermfg=7    ctermbg=8      cterm=none

"" line numbers
set relativenumber
set number

"" tab width
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

"" search
set hlsearch "":noh to undo the current search highlight
set incsearch

"" other
set smartindent
set scrolloff=10
