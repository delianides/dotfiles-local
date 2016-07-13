let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>


