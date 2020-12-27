"
" Ale - https://github.com/dense-analysis/ale
"
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_sign_info = 'I'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
let g:ale_echo_msg_error_str='[ERROR]'
let g:ale_echo_msg_info_str='[INFO]'
let g:ale_echo_msg_warning_str='[WARNING]'
let g:ale_echo_msg_format = '%severity% %linter% -> [%code%] -> %s'

let g:ale_linter_aliases = {
      \ 'html': ['html', 'css']
      \}

let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tsserver','eslint'],
      \ 'javascriptreact': ['eslint'],
      \ 'typescriptreact': ['tsserver','eslint'],
      \ 'lua'       : ['luacheck'],
      \ 'sql'       : [],
      \}

" ESLint --fix is so slow to run it as part of the fixers, so I do this using a precommit hook or something else
let g:ale_fixers = {
      \   '*'         : ['remove_trailing_lines', 'trim_whitespace'],
      \   'markdown'  : ['prettier'],
      \   'javascript': ['eslint'],
      \   'typescript': ['eslint'],
      \   'javascriptreact': ['eslint'],
      \   'typescriptreact': ['eslint'],
      \   'css'       : ['prettier'],
      \   'json'      : ['prettier'],
      \   'scss'      : ['prettier'],
      \   'less'      : ['prettier'],
      \   'yaml'      : ['prettier'],
      \   'graphql'   : ['prettier'],
      \   'html'      : ['prettier'],
      \   'reason'    : ['refmt'],
      \   'sh'        : ['shfmt'],
      \   'bash'      : ['shfmt'],
      \   'rust'      : ['rustfmt'],
      \   'go'        : ['gofmt'],
      \}

" Don't auto auto-format files inside `node_modules`, `forks` directory, minified files and jquery (for legacy codebases)
let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = {
      \   '\.min\.(js\|css)$': {
      \       'ale_linters': [],
      \       'ale_fixers': []
      \   },
      \   'node_modules/.*': {
      \       'ale_linters': [],
      \       'ale_fixers': []
      \   },
      \   'package.json': {
      \       'ale_fixers': g:ale_fixers['*']
      \   }
      \}

hi ALEErrorSign guifg=red
hi ALEWarningSign guifg=yellow
