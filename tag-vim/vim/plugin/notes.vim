let g:notes = "~/Dropbox \(Personal\)/@Notes"

if !exists('g:date_command')
	let g:date_command = "date"
endif

function! GetTodaysNote()
	execute "rightbelow split!" . g:notes .strftime('\/%Y\/%B/%Y-%m-%d').".md"
endfunction
command GetTodaysNote :call GetTodaysNote()

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre *.md :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

command! -bang SearchNotes
	\ call fzf#run((fzf#wrap('search-notes', { 'dir': "~/Dropbox \(Personal\)/@Notes", 'source': 'find . -name *.md' })))
