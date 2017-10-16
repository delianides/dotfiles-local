let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier','eslint'],
\}

let g:ale_javascript_eslint_use_global = 0
let g:ale_javascript_prettier_use_global = 1
let g:ale_javascript_prettier_options = '--trailing-comma all'
let g:ale_fix_on_save = 1

hi ALEErrorSign guifg=red
hi ALEWarningSign guifg=yellow

let g:airline_section_error = '%{ALEGetStatusLine()}'
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
