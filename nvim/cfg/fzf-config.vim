" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" don't search file names
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:60%'), <bang>0)

" use rg for vim's :grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <C-p> :Files<CR>

"nnoremap <silent> <Leader>b :Buffers<CR>
"nnoremap <silent> <Leader>/ :BLines<CR>
"nnoremap <silent> <Leader>' :Marks<CR>
"nnoremap <silent> <Leader>g :Commits<CR>
"nnoremap <silent> <Leader>H :Helptags<CR>
"nnoremap <silent> <Leader>hh :History<CR>
"nnoremap <silent> <Leader>h: :History:<CR>
"nnoremap <silent> <Leader>h/ :History/<CR>

