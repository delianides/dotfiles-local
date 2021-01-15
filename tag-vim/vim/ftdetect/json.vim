augroup JsonSynDetect
    autocmd!
    autocmd BufNewFile,BufRead .{babel,eslint,stylelint,prettier,jshint}rc,.tern-* set filetype=json
augroup END

