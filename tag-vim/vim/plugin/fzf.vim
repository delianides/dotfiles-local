" search files in the current project starting from root...
" root is last directory before ~/Projects"
"
let g:fzf_layout = { 'down': '~40%' }
nnoremap <silent> <leader>g :GFiles<CR>

" imap <c-x><c-w> <plug>(fzf-complete-word)
" imap <c-x><c-p> <plug>(fzf-complete-path)
" imap <c-x><c-f> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)
