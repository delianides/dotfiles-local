"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"
" VIMPATH
  let $VIMPATH=expand('$HOME/.vim')
" Leader key
  let mapleader = ' '
" exit to normal mode with 'jj', so i don't always have to hit the escape key
  inoremap jj <ESC>
" No need for ex mode
  nnoremap Q <nop>
" recording macros is not my thing
  map q <Nop>
" Allow saving of files as sudo when I forgot to start vim using sudo.
  cmap w!! w !sudo tee > /dev/null %
" ----------------------------------}}}

  call plug#begin('~/.config/nvim/bundle')
" vim-plug: https://github.com/junegunn/vim-plug
  set rtp+=/usr/local/opt/fzf

  Plug 'airblade/vim-gitgutter'
  Plug 'ap/vim-css-color'
  Plug 'neomake/neomake'

  Plug 'bitc/vim-bad-whitespace'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'wellle/tmux-complete.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-sensible'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'Raimondi/delimitMate'
  Plug 'machakann/vim-highlightedyank'

  Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
  Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
  Plug 'shime/vim-livedown', { 'for': 'markdown', 'do': 'npm install -g livedown' }
  Plug 'tpope/vim-markdown', {'for': 'markdown'}
  Plug 'junegunn/vim-easy-align'

  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}
  Plug 'mhartington/deoplete-typescript', {'for': 'typescript'}
  " Plug 'steelsojka/deoplete-flow', { 'for': ['javascript','javascript.jsx'] }

  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'honza/vim-snippets'
  Plug 'mattn/gist-vim'
  Plug 'mattn/webapi-vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " themes
  Plug 'vim-airline/vim-airline'
  Plug 'jacoborus/tender'

  " Syntax
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " JavaScript support
  Plug 'flowtype/vim-flow', { 'for': ['javascript','javascript.jsx'] } " flowtype
  Plug 'moll/vim-node', { 'for': 'javascript' } " node support
  Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
  Plug 'othree/jsdoc-syntax.vim', {'for':['javascript', 'typescript']}
  Plug 'othree/es.next.syntax.vim', {'for': ['javascript','javascript.jsx']}
  Plug 'kchmck/vim-coffee-script', {'for': ['coffee', 'javascript']}
  Plug 'Quramy/tsuquyomi', {'for': 'typescript'}
  Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
  Plug 'mxw/vim-jsx', { 'for': ['javascript','javascript.jsx'] } " JSX support
  Plug 'justinj/vim-react-snippets', { 'for': 'javascript' }
  Plug 'jparise/vim-graphql'
  Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' } " go support
  Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/bundle/gocode/nvim/symlink.sh' }
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'tpope/vim-git' " git support
  Plug 'cakebaker/scss-syntax.vim' " sass support
  Plug 'vim-ruby/vim-ruby' " ruby support
  Plug 'tclem/vim-arduino' " arduino support
  Plug 'hashivim/vim-hashicorp-tools'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'Matt-Deacalion/vim-systemd-syntax' " systemd language
  call plug#end()
  filetype plugin indent on

" System Settings
  set background=dark
  set clipboard+=unnamed
  set hidden
  set nopaste
  set noshowmode
  set noswapfile
  set relativenumber number
  set tabstop=2 shiftwidth=2 expandtab
  set laststatus=2
  set wrap linebreak nolist
  set undofile
  set undodir="$HOME/.VIM_UNDO_FILES"
  set nobackup      " disable automatic creation of backup files
  set nowritebackup " changes default behavior of saving files to 'write,delete,rename'
  set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
  set scrolloff=10  " number of lines to show below the cursor before the buffer scrolls down
  set smartindent            " be smart about it
  set wrapmargin=8           " wrap lines when coming within n characters from side
  set formatoptions+=n,1     " support for numbered/bullet lists
  set wildmode=longest,list,full
  set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
  set shortmess=filtIoOA     " shorten messages
  set completeopt-=preview   " disable preview/scratch pad
  set showmatch              " brackets/braces that is
  set mat=7                  " duration to show matching brace (1/10 sec)
  set ignorecase             " ignore case when searching
  set nohlsearch             " don't highlight searches
  set visualbell             " shut up
  set noerrorbells           " ditto
  set splitbelow
  set splitright
  set complete+=kspell
  set spellfile=$HOME/.vim/spell/.vim-spell-en.utf-8.add

  autocmd BufReadCmd set nohlsearch " on opening the file, clear search-highlighting
  let g:netrw_dirhistmax = 0 " I never use netrw, so disable its history.

" Git
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  let g:gist_clip_command = 'pbcopy'
  let g:gitgutter_map_keys = 0

" Neomake
  autocmd! BufWritePost,BufEnter * Neomake
  let g:neomake_verbose = 0
  let g:neomake_airline = 1

" Mappings
  autocmd FileType ruby,eruby,yaml set iskeyword+=!,?
  autocmd FileType ruby,eruby,yaml set isfname=_,-,48-57,A-Z,a-z,/
  autocmd BufNewFile,BufRead *.ino set filetype=c
  autocmd BufNewFile,BufRead *.svg set filetype=xml
  autocmd BufNewFile,BufRead .babelrc set filetype=json
  autocmd BufNewFile,BufRead .jshintrc set filetype=json
  autocmd BufNewFile,BufRead .eslintrc set filetype=json
  autocmd FileType terraform setlocal commentstring=#\ %s
  autocmd VimResized * wincmd =

" custom key mappings and function calls
  nnoremap <leader>wi :EraseBadWhitespace<CR>
  map <leader>f ggVG==<CR>
  noremap <leader>f :Autoformat<CR>
  map <leader>i mmgg=G`m<CR>
  map <leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
  map <silent> <leader>v :set paste!<CR>

  noremap H ^
  noremap L g_
  noremap J 5j
  noremap K 5k

" Get off my lawn, aka don't use arrow keys in vim.
  nnoremap <Left> :echoe "Use h"<CR>
  nnoremap <Right> :echoe "Use l"<CR>
  nnoremap <Up> :echoe "Use k"<CR>
  nnoremap <Down> :echoe "Use j"<CR>

" fold
  set foldenable
  set foldmethod=indent
  set foldlevel=999

  nnoremap s za
  nnoremap S zA

  autocmd FileType javascript,html,css,scss,typescript,json setlocal foldlevel=99
  autocmd FileType javascript,typescript,json setlocal foldmethod=syntax
  autocmd FileType coffee setlocal foldmethod=indent

  "Maps for folding, unfolding all
  nnoremap <leader>fu zM<CR>
  nnoremap <leader>uf zR<CR>

  " Focus the current fold by closing all others
  nnoremap <leader>flf mzzM`zzv

" autocomplete
  set completeopt+=noselect
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_camel_case = 1
  let g:deoplete#sources = {}
  let g:deoplete#keyword_patterns = {}
  let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
  let g:deoplete#omni#input_patterns = {}

  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
  let g:deoplete#sources#go#use_cache = 1
  let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'
  let g:deoplete#sources#go = 'vim-go'

" Neosnippet
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#expand_word_boundary = 1
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  imap <silent><expr><CR> pumvisible() ?
    \ (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : deoplete#mappings#close_popup())
    \ : (delimitMate#WithinEmptyPair() ? "\<Plug>delimitMateCR" : "\<CR>")

  imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
    \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
    \ : (<SID>is_whitespace() ? "\<Tab>"
    \ : deoplete#mappings#manual_complete()))

  smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
    \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
    \ : (<SID>is_whitespace() ? "\<Tab>"
    \ : deoplete#mappings#manual_complete()))

  inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:is_whitespace()
    let col = col('.') - 1
    return ! col || getline('.')[col - 1] =~? '\s'
  endfunction

" Golang
  autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>b <Plug>(go-build)
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  autocmd FileType go nmap <leader>c <Plug>(go-coverage)

  let g:go_textobj_include_function_doc = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_interfaces = 1
  let g:go_highlight_operators = 0
  let g:go_highlight_build_constraints = 1
  let g:go_fmt_command = "goimports"
  let g:go_snippet_engine = "neosnippet"
  let g:neomake_go_enabled_makers = ['golint']

" Javascript
  let g:jsx_ext_required = 0
  let g:flow#flowpath = system('PATH=$(npm bin):$PATH && which flow | tr -d "\n"')

  function! neomake#makers#ft#javascript#eslint()
      return {
          \ 'args': ['-f', 'compact'],
          \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
          \ '%W%f: line %l\, col %c\, Warning - %m'
          \ }
  endfunction
  autocmd FileType javascript let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')
  autocmd FileType javascript let g:neomake_javascript_enabled_makers = ['eslint']
  autocmd FileType json let g:vim_json_syntax_conceal = 0

" Markdown
  function! s:goyo_enter()
    silent !tmux set status off
    Limelight
  endfunction

  function! s:goyo_leave()
    silent !tmux set status on
    Limelight!
  endfunction

  autocmd! User GoyoEnter
  autocmd! User GoyoLeave
  autocmd  User GoyoEnter nested call <SID>goyo_enter()
  autocmd  User GoyoLeave nested call <SID>goyo_leave()
  autocmd FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
  autocmd BufRead,BufNewFile *.md set filetype markdown
  autocmd BufNewFile,BufRead,BufWrite *.md,*.markdown syntax match Comment /\%^---\_.\{-}---$/
  let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html', 'go', 'ruby']
" }}}

" Fuzzy Finder
  nnoremap <silent> <C-p> :call fzf#run({
  \   'down': '40%',
  \   'sink': 'botright split' })<CR>

" tmux
" see https://github.com/neovim/neovim/issues/2048
  if has('nvim')
    nmap <silent> <bs> :<c-u>TmuxNavigateLeft<cr>
  endif
  let g:tmuxcomplete#trigger = ''
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
  if has('nvim')
    tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
    tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
    tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
    tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
    tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>
  endif

" syntax
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme tender
let g:airline_theme='tender'
let g:airline_powerline_fonts = 1
