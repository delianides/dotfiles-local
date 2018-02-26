" search files in the current project starting from root...
" root is last directory before ~/Projects"
"
let g:fzf_layout = { 'down': '~40%' }

nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nmap ; :Buffers<CR>
nnoremap ? :GFiles<CR>

