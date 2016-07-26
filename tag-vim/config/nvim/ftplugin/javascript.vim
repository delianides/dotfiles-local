let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }

autocmd FileType javascript let g:neomake_javascript_enabled_makers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint']
