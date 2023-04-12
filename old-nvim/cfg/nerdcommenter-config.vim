" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


"Comment out the current line or text selected in visual mode.
"[count]<leader>cc |NERDCommenterComment|

"Same as cc but forces nesting.
"[count]<leader>cn |NERDCommenterNested|

"Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
"[count]<leader>c<space> |NERDCommenterToggle|

"Comments the given lines using only one set of multipart delimiters.
"[count]<leader>cm |NERDCommenterMinimal|

"Toggles the comment state of the selected line(s) individually.
"[count]<leader>ci |NERDCommenterInvert|

"Comments out the selected lines with a pretty block formatted layout.
"[count]<leader>cs |NERDCommenterSexy|

"Same as cc except that the commented line(s) are yanked first.
"[count]<leader>cy |NERDCommenterYank|

"Comments the current line from the cursor to the end of line.
"<leader>c$ |NERDCommenterToEOL|

"Adds comment delimiters to the end of line and goes into insert mode between them.
"<leader>cA |NERDCommenterAppend|

"Adds comment delimiters at the current cursor position and inserts between. Disabled by default.
"|NERDCommenterInsert|

"Switches to the alternative set of delimiters.
"<leader>ca |NERDCommenterAltDelims|

"Same as |NERDCommenterComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).
"[count]<leader>cl |NERDCommenterAlignLeft [count]<leader>cb |NERDCommenterAlignBoth

"Uncomments the selected line(s).
"[count]<leader>cu |NERDCommenterUncomment|
