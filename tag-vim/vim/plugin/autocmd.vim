if has('autocmd')
  augroup Autocmds
    autocmd!
    " http://vim.wikia.com/wiki/Detect_window_creation_with_WinEnter
    autocmd VimEnter * autocmd WinEnter * let w:created=1
    autocmd VimEnter * let w:created=1

    autocmd VimResized * wincmd =
    " Disable paste mode on leaving insert mode.
    autocmd InsertLeave * set nopaste
  augroup END
endif
