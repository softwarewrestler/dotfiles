if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    echo 'Fetching plug.vim...'
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
"--------------------
" fuzzy finder
"--------------------
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

"--------------------
" javascript / Typescript
"--------------------
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'leafgarland/typescript-vim', {'for': ['javascript', 'typescript', 'typescriptreact']}
  "Plug 'peitalin/vim-jsx-typescript'
  Plug 'jparise/vim-graphql', {'for': ['javascript', 'typescript', 'typescriptreact']}
  Plug 'maxmellon/vim-jsx-pretty', {'for': ['javascript', 'typescript', 'typescriptreact']}

" javascript/typescript generic config
autocmd Filetype javascript setlocal ts=2 sw=2 softtabstop=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2  softtabstop=2 expandtab
autocmd Filetype typescriptreact setlocal ts=2 sw=2  softtabstop=2 expandtab
autocmd BufEnter *.tsx set filetype=typescriptreact
au BufRead,BufNewFile *.ts set filetype=typescript

" To help syntax highlighting not get out of sync
" There is a performance cost so disable if I don't like it
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


"--------------------
" Git
"--------------------
  "Git diff in the gutter
  Plug 'airblade/vim-gitgutter'
    
  "git wrapper for vim airline
  Plug 'tpope/vim-fugitive'
    
"--------------------
" Formatting
"--------------------
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
"--------------------
" Make vim pretty
"--------------------
  " file expolorer for vim
  Plug 'preservim/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
  Plug 'Xuyuanp/nerdtree-git-plugin'

  "Rainbow Parenthesis
  Plug 'luochen1990/rainbow'

  " Glyphs for various plugins
  Plug 'ryanoasis/vim-devicons'

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'dracula/vim',{'as': 'dracula'}
"--------------------
" code completion
"--------------------
  " For deoplete
  "Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
  "For async completion
  "Plug 'Shougo/deoplete.nvim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

source ~/.config/nvim/cfg/nerd-tree-config.vim
source ~/.config/nvim/cfg/rainbow-config.vim
source ~/.config/nvim/cfg/airline-config.vim
source ~/.config/nvim/cfg/prettier-config.vim
source ~/.config/nvim/cfg/fzf-config.vim
"source ~/.config/nvim/cfg/vim-jsx-typescript-config.vim
source ~/.config/nvim/cfg/vim-jsx-pretty-config.vim
"source ~/.config/nvim/cfg/deoplete-config.vim
source ~/.config/nvim/cfg/coc-config.vim
source ~/.config/nvim/cfg/gitgutter-config.vim

colorscheme dracula

