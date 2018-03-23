" search files in the current project starting from root...
" root is last directory before ~/Projects"
"
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_buffers_jump = 1

let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'enter': 'vsplit'
  \ }

nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nmap ; :Buffers<CR>
nnoremap ? :GFiles<CR>

