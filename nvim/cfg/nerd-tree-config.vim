autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>

let NERDTreeMinimalUI = 1

let g:NERDTreeGitStatusUseNerdFonts = 1
