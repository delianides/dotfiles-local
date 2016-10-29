let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" XXX need to work on this
hi ALEError guifg=white guibg=red
hi ALEWarning guifg=black guibg=yellow

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
