let g:fzf_layout = { 'down': '~20%' }
let g:fzf_buffers_jump = 1

let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'enter': 'vsplit',
  \ }

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-f> :ProjectFiles<CR>
nnoremap <silent> <C-p> :Ag<CR>


