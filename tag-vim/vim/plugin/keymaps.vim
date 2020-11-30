scriptencoding utf-8

" No need for ex mode
nnoremap Q <nop>

" recording macros is not my thing
map q <Nop>

" With this, you can enter ":Config" in normal mode to open the Vim configuration.
command! Config execute ":e $MYVIMRC"

" Call ":Reload" to apply the latest .vimrc contents
command! Reload execute "source ~/.vimrc"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

noremap H ^
noremap L g_
noremap J 5j
noremap K 5k

noremap <Tab> :tabn<CR>
noremap <S-Tab> :tabp<CR>

vmap < <gv
vmap > >gv

" Disable useless arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Bubble single lines
nmap <C-K> [e
nmap <C-J> ]e
" Bubble multiple lines
vmap <C-K> [egv
vmap <C-J> ]egv
