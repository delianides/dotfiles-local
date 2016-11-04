" tmux autocomplete from other panes
let g:tmuxcomplete#trigger = 'omnifunc'

let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#no_mappings = 1
let g:mucomplete#chains = { 'default' : ['file', 'omni', 'c-n', 'c-p' ] }

" should be menu,menuone,noinsert,noselect
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert

"	.	scan the current buffer ('wrapscan' is ignored)
"	w	scan buffers from other windows
"	b	scan other loaded buffers that are in the buffer list
"	u	scan the unloaded buffers that are in the buffer list
"	kspell  use the currently active spell checking |spell|
"   i	scan current and included files
"   t   tag completion
set complete+=kspell

augroup mucomplete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType markdown,txt let b:mucomplete_chain = ['file', 'c-n', 'dict', 'spel']
augroup END
