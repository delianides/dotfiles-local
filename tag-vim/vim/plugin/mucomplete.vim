let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#auto_select = 0
let g:mucomplete#no_mappings = 1
let g:mucomplete#chains = { 'default' : ['file', 'omni', 'ulti', 'c-n', 'c-p' ] }

augroup mucomplete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType *
    \ if &l:spell && (&l:modifiable && !&l:readonly) |
    \   let b:mucomplete#chains = ['file', 'c-n', 'c-p', 'dict', 'spel', 'omni', 'ulti']
    \ endif
augroup END

