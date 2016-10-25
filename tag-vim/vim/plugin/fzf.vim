nnoremap <silent> <C-p> :call fzf#run({
    \   'down': '40%',
    \   'sink': 'botright split' })<CR>

imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-p> <plug>(fzf-complete-path)
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
