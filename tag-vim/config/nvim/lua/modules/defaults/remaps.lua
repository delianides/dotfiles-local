vnoremap('K', '<cmd>m "<-2<CR>gv=gv"')
vnoremap('J', '<cmd>m ">+1<CR>gv=gv"')

-- deletes in visual
vnoremap('X', '"_d')

-- undo
nnoremap('<leader>u', '<cmd>UndotreeToggle<CR>')
