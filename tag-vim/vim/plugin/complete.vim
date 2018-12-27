" tmux autocomplete from other panes
let g:tmuxcomplete#trigger = 'omnifunc'
let g:mucomplete#enable_auto_at_startup = 1
" let g:mucomplete#no_mappings = 1
let g:mucomplete#chains = { 'default' : ['file', 'c-n', 'c-p', 'omni'], 'txt': ['file'], 'md': ['file'], 'yml': ['file'], 'yaml': [ 'file' ] }

" should be menu,menuone,noinsert,noselect
" set completeopt-=preview
set completeopt+=menuone,noinsert,noselect
set wildmenu
set wildmode=list:longest,full
"	.	scan the current buffer ('wrapscan' is ignored)
"	w	scan buffers from other windows
"	b	scan other loaded buffers that are in the buffer list
"	u	scan the unloaded buffers that are in the buffer list
"	kspell  use the currently active spell checking |spell|
"   i	scan current and included files
"   t   tag completion
set complete-=t,w,b,u
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

let g:AutoPairsMapCR = 0
let g:AutoPairsMapSpace = 0
imap <silent> <expr> <space> pumvisible()
	\ ? "<space>"
	\ : "<c-r>=AutoPairsSpace()<cr>"

augroup mucomplete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType javascript.jsx setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END
