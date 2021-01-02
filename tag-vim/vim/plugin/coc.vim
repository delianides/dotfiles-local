if has_key(plugs, 'coc.nvim')
  let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-jest',
    \ 'coc-inline-jest',
    \ 'coc-git',
    \ 'coc-gist',
    \ 'coc-pairs',
    \ 'coc-db',
    \ 'coc-styled-components',
    \ 'coc-deno',
    \ 'coc-prisma',
    \ 'coc-yaml',
    \ 'coc-lists',
    \ 'coc-rls',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-xml',
    \ 'coc-svg',
    \ 'coc-sql',
    \ 'coc-elixir',
    \ 'coc-emmet',
    \ 'coc-vimlsp',
    \ 'coc-actions',
    \ 'coc-graphql',
    \ 'coc-explorer',
    \ 'coc-python',
    \ 'coc-rust-analyzer',
    \ 'coc-spell-checker',
    \ 'coc-go',
    \ 'coc-highlight',
    \ 'coc-snippets',
    \ 'coc-docker',
    \ 'coc-sh',
    \ 'coc-floaterm',
    \ 'coc-marketplace',
    \ ]

  if isdirectory('./node_modules') && isdirectory('./node_modules/typescript')
    let g:coc_global_extensions += ['coc-tsserver']
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

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gr <Plug>(coc-references)

  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

  let g:coc_snippet_next = '<tab>'
  let g:coc_snippet_prev = '<s-tab>'

  " <C-space> - trigger completion
  inoremap <silent><expr> <c-space> coc#refresh()

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

  " Remap keys for applying codeAction to the current line.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)
  " Use <TAB> for selections ranges.
  " NOTE: Requires 'textDocument/selectionRange' support from the language server.
  " coc-tsserver, coc-python are the examples of servers that support it.
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Mappings using CoCList:
  " Show all diagnostics.
  nnoremap <silent> <space>d  :<C-u>CocFzfList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent> <space>e  :<C-u>CocFzfList extensions<cr>
  " Show commands.
  nnoremap <silent> <space>c  :<C-u>CocFzfList commands<cr>
  " Find symbol of current document.
  nnoremap <silent> <space>o  :<C-u>CocFzfList outline<cr>
  " Search workspace symbols.
  nnoremap <silent> <space>s  :<C-u>CocFzfList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent> <space>p  :<C-u>CocFzfListResume<CR>

  " Mappings using Coc-Jest
  nnoremap <leader>f :call CocAction('runCommand', 'jest.fileTest', ['%'])<CR>
  nnoremap <leader>n :call CocAction('runCommand', 'jest.singleTest')<CR>
  command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')
  command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

  hi CocUnderline cterm=bold gui=bold
endif
