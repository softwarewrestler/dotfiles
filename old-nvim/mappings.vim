" Exit insert mode
inoremap kj <ESC>
inoremap kJ <ESC>
inoremap Kj <ESC>
inoremap KJ <ESC>
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap jK <ESC>
inoremap JK <ESC>

" disable arrow keys
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>

" Moving around splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" Moving over virtual lines
"nnoremap k gk
"nnoremap j gj
"nnoremap 0 g0
"nnoremap $ g$
"nnoremap ^ g^

" cycle over buffers
nmap <right> :bnext<CR>
nmap <left> :bprevious<CR>

