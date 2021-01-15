let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
let $FZF_DEFAULT_OPTS='--color=dark --height=30% --layout=reverse --margin=1,1 --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,pointer:12,marker:4,spinner:11,header:-1'
let g:fzf_preview_use_dev_icons = 1
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-l': 'vsplit',
  \ 'ctrl-x': 'split',
  \ 'enter': 'tab split',
  \ }

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nmap // :BLines!<CR>
nmap ?? :Rg!<CR>
nmap <C-f> :ProjectFiles<CR>
nmap <C-d> :Files ~/.dotfiles<CR>
nmap cc :Commands!<CR>
