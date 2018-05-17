" search files in the current project starting from root...
" root is last directory before ~/Projects"
"
"

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

function! s:open_in_new_tmux_pane(lines)
	call system("tmux split-window  -h \"vim ". a:lines[0] . "\"")
endfunction

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_buffers_jump = 1

let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': function('s:open_in_new_tmux_pane'),
  \ 'enter': 'vsplit',
  \ }

nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nmap ; :Buffers<CR>
nnoremap ? :GFiles<CR>


