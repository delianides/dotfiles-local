 augroup lightline#ale
    autocmd!
    autocmd User ALEJobStarted call lightline#update()
    autocmd User ALELintPre call lightline#update()
    autocmd User ALELintPost call lightline#update()
    autocmd User ALEFixPre call lightline#update()
    autocmd User ALEFixPost call lightline#update()
 augroup END

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [['cocstatus'],[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ], ['filetype']]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'cocstatus': 'coc#status'
  \ },
  \ 'component_expand': {
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_infos': 'lightline#ale#infos',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
  \ }
\ }
