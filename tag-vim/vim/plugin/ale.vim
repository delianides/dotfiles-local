let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'typescript': ['tslint'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint'],
\   'graphql': [ 'prettier' ],
\   'markdown': [ 'prettier' ],
\}

let g:ale_sign_column_always = 1
let g:ale_javascript_eslint_use_global = 0
let g:ale_javascript_prettier_use_global = 1
let g:ale_javascript_prettier_options = '--trailing-comma all'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1

hi ALEErrorSign guifg=red
hi ALEWarningSign guifg=yellow
hi link ALEErrorSign    Error
hi link ALEWarningSign  Warning

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '▲'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

