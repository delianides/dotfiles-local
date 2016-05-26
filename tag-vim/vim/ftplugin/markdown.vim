let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html', 'go', 'ruby']

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

noremap <leader>tm :TableModeToggle<CR>
noremap <leader>gy :Goyo<CR>

let g:table_mode_corner="|"
let g:indentLine_char='│'
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

setlocal tw=0 wrapmargin=0 wrap spell
