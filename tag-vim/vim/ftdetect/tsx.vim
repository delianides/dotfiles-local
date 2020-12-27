function! s:SetTSX()
  noautocmd set filetype=typescriptreact
endfunction

augroup tsxReact
  au!
  autocmd BufNewFile,BufRead *.tsx call s:SetTSX()
augroup end

