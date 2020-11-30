function! s:small_terminal() abort
  new
  wincmd J
  call nvim_win_set_height(0, 12)
  set winfixheight
  term
endfunction

" ANKI: Make a small terminal at the bottom of the screen.
nnoremap <leader>st :call <SID>small_terminal()<CR>

nnoremap <C-t> :FloatermToggle<CR>
nnoremap <C-g> :FloatermNew --height=0.75 --width=0.75 --wintype=floating --name=lazygit --autoclose=2 lazygit<CR>

" vim-test floaterm
let test#strategy = 'floaterm'
