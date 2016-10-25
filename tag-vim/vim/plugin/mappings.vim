nnoremap s za
nnoremap S zA

noremap H ^
noremap L g_
noremap J 5j
noremap K 5k

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap <silent> <Leader>wi :call functions#zap()<CR>

" fold and unfold
nnoremap <leader>fu zM<CR>
nnoremap <leader>uf zR<CR>
" Focus the current fold by closing all others
nnoremap <leader>flf mzzM`zzv
