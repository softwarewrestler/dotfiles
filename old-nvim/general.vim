"Automatic reloading ov .vimrc
autocmd! bufwritepost .vimrc source %

set termguicolors

" colors i like:
" eighties, helios, base16-material-darker, espresso. base16-outrun-dark, synthwave
set background=dark

" line numbers on
set number
set cursorline
set noshowmode

" display invisible characters (tabs, trailing spaces, etc
" set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" search stuff
set hlsearch
set ignorecase
set smartcase


" tab options
set smarttab
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" file type stuff
filetype on
filetype indent on
filetype plugin on

set omnifunc=syntaxcomplete#Complete

" splits
set splitbelow              " horizontal splits are created at the bottom
set splitright              " vertical splits are created on the right

" Disable swap files
set noswapfile
set nowritebackup
set backupcopy=yes

" Colors
" set t_Co=256
syntax enable

" enable mouse scrolling
set mouse=a

" stop beeping at me
set visualbell


set nocompatible
"set autochdir
set hidden
set linebreak

"set backspace=indent,eol,start

" normal tabs for Makefile and go
autocmd FileType make setlocal noexpandtab
autocmd FileType go setlocal noexpandtab

