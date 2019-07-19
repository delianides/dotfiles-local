let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'typescript': ['eslint', 'tsserver'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'graphql': [ 'prettier' ],
\   'markdown': [ 'prettier' ],
\   'json': ['prettier']
\}

let g:ale_linters_ignore = { 'typescript': [ 'tslint' ] }

let g:ale_sign_column_always = 1
let g:ale_javascript_eslint_use_global = 0
let g:ale_fix_on_save = 1

hi ALEErrorSign guifg=red
hi ALEWarningSign guifg=yellow
hi link ALEErrorSign Error
hi link ALEWarningSign Warning

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

nnoremap <leader>ad :ALEDetail<CR>
nnoremap <leader>gd :ALEGoToDefinitionInVSplit<CR>
nnoremap <leader>gh :ALEHover<CR>
