if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    echo 'Fetching plug.vim...'
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif




call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

if has('macunix')
    hi CursorLine guifg=NONE guibg=#222E30 guisp=#222E30 gui=NONE ctermfg=NONE ctermbg=54 cterm=NONE
endif
Plug '/projects/notOurs/ijaas/vim'
"=============Java / Maven =============   
Plug 'mikelue/vim-maven-plugin'
"=============Javascript =============   
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd BufEnter *.tsx set filetype=typescript
Plug 'pangloss/vim-javascript' "Better javascript support for Vim
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript'
Plug 'elzr/vim-json'
"=============== Python =========================== 
Plug 'davidhalter/jedi-vim'
"============== XML  ==============================
Plug 'othree/xml.vim'      
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
autocmd Filetype xml nnoremap = :FormatXML<Cr>







    Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'vim-airline/vim-airline' "self explanatory
Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'      "git wrapper for vim airline
    Plug 'tpope/vim-commentary'    "commment blocks of code out
    Plug 'tpope/vim-surround'      "delete, change, add surrounding
    Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}	 "file explorer for vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
Plug 'luochen1990/rainbow'     "Rainbow Parenthesis
Plug 'jiangmiao/auto-pairs'    "Auto closing of parenthesis 
"Plug 'floobits/floobits-neovim'
Plug 'kien/ctrlp.vim'          
Plug 'jceb/vim-orgmode'
Plug 'chriskempson/base16-vim'
Plug 'mileszs/ack.vim'
    Plug 'sheerun/vim-polyglot'                                             " A collection of language packs for Vim
    Plug 'airblade/vim-gitgutter'                                           " Git diff in the gutter
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'                                                 " fzf integration for vim/neovim
Plug 'gmoe/vim-espresso'
au BufRead,BufNewFile *.ts set filetype=typescript
    Plug 'tpope/vim-repeat'                                                 " dot commands for stuff like surround, comment, etc

    Plug 'ryanoasis/vim-devicons'                                           " Glyphs for various plugins
call plug#end()

let g:ackprg = 'ag --nogroup --nocolor --column'
set completeopt-=preview
map <C-b> :TagbarToggle<CR>


" #### airline ####
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme='one'
let g:airline_theme='violet'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'


" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


let g:rainbow_active = 1

" configure netrw
let g:netrw_banner = 0
" 2 - new vertical split; 4 - previous window
let g:netrw_browse_split = 2
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_altv = 1

