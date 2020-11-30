scriptencoding utf-8

augroup GeneralAutocmds
  autocmd!

  autocmd TermOpen * set nonumber norelativenumber
  autocmd TermLeave * set number relativenumber

  autocmd VimResized * execute "normal! \<c-w>="

  " http://vim.wikia.com/wiki/Detect_window_creation_with_WinEnter
  autocmd VimEnter * autocmd WinEnter * let w:created=1
  autocmd VimEnter * let w:created=1
  autocmd VimResized * wincmd =
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Disable paste mode on leaving insert mode.
  autocmd InsertLeave * set nopaste
  autocmd BufWritePost */spell/*.add silent! :mkspell! %
augroup END
