let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:lua_tree_auto_close = 1 "0 by default, closes the tree when it's the last window

nnoremap <C-n> :LuaTreeToggle<CR>
