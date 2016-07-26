let g:tsuquyomi_disable_quickfix = 1
nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>

let g:neomake_typescript_tsc_maker = {
  \ 'args': [
  \ '-m', 'commonjs', '--noEmit', '--target', 'ES5', '--experimentalDecorators'
  \ ],
  \ 'errorformat':
  \ '%E%f %#(%l\,%c): error %m,' .
  \ '%E%f %#(%l\,%c): %m,' .
  \ '%Eerror %m,' .
  \ '%C%\s%\+%m'
  \ }

let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']


