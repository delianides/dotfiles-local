scriptencoding utf-8

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-git',
  \ 'coc-pairs',
  \ 'coc-yaml',
  \ 'coc-lists',
  \ 'coc-rls',
  \ 'coc-go',
  \ 'coc-marketplace',
  \ 'coc-highlight'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/typescript')
  let g:coc_global_extensions += ['coc-tsserver']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/styled-components')
  let g:coc_global_extensions += ['coc-styled-components']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/jest')
  let g:coc_global_extensions += ['coc-jest']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/flow-bin')
  let g:coc_global_extensions += ['coc-flow']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

hi SignColumn ctermbg=235 guibg=#282828
hi CocErrorSign ctermfg=167 ctermbg=235 guibg=#282828 guifg=#fb4934
hi CocWarningSign ctermbg=235 ctermfg=208 guibg=#282828 guifg=#fe8019
hi CocInfoSign ctermbg=235 ctermfg=214 guibg=#282828 guifg=#fabd2f
hi CocHintSign ctermbg=235 ctermfg=109 guibg=#282828 guifg=#83a598

