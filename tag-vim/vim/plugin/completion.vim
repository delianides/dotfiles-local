" if !has('nvim')
"   " Don't load lsp in vim
"   let g:nvim_lsp=1
"   finish
" endif

" let g:diagnostic_enable_underline = 0

" let g:UltiSnipsExpandTrigger='<c-u>'
" let g:UltiSnipsJumpForwardTrigger='<c-j>'
" let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" " ultisnips snippet
" let g:completion_enable_snippet = 'UltiSnips'
" let g:completion_enable_auto_signature = 0

" " Change the completion source automatically if no completion available
" let g:completion_auto_change_source = 1
" " Delete on completion
" let g:completion_trigger_on_delete = 0

" let g:completion_chain_complete_list = [
"       \{'complete_items': ['lsp', 'snippet', 'file', 'buffers']},
"       \{'mode': '<c-p>'},
"       \{'mode': '<c-n>'}
"       \]

" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <silent><expr> <c-p> completion#trigger_completion()
" imap <localleader>j <cmd>lua require'source'.prevCompletion()<CR>
" imap <localleader>k <cmd>lua require'source'.nextCompletion()<CR>

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ completion#trigger_completion()

" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert

" " Avoid showing message extra message when using completion
" " set shortmess+=c
