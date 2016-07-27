" THE IMPORTANT STUFF "
" ---------------------------------
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
" ----------------------------------

  call plug#begin('~/.config/nvim/bundle')
" vim-plug: https://github.com/junegunn/vim-plug
  set rtp+=/usr/local/opt/fzf

  Plug 'airblade/vim-gitgutter'
  Plug 'ap/vim-css-color'
  Plug 'neomake/neomake'

  Plug 'bitc/vim-bad-whitespace'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-sleuth'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'Raimondi/delimitMate'

  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}
  Plug 'mhartington/deoplete-typescript', {'for': 'typescript'}
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'honza/vim-snippets'

  Plug 'vim-scripts/Align'
  Plug 'mattn/gist-vim'
  Plug 'mattn/webapi-vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " themes
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
  Plug 'fatih/molokai'

" *************************************************
" Syntax
" *************************************************
  Plug 'tmux-plugins/vim-tmux'

  Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " JavaScript support
  Plug 'moll/vim-node', { 'for': 'javascript' } " node support
  Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
  Plug 'othree/jsdoc-syntax.vim', {'for':['javascript', 'typescript']}
  Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
  Plug 'Quramy/tsuquyomi', {'for': 'typescript'}
  Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}

  Plug 'mxw/vim-jsx', { 'for': 'jsx' } " JSX support
  Plug 'jparise/vim-graphql'
  Plug 'elzr/vim-json', { 'for': 'json' } " JSON support

  Plug 'tpope/vim-markdown', {'for': 'markdown'}

  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' } " go support
  Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/bundle/gocode/nvim/symlink.sh' }
  Plug 'AndrewRadev/splitjoin.vim'

  Plug 'tpope/vim-git' " git support
  Plug 'cakebaker/scss-syntax.vim' " sass support
  Plug 'vim-ruby/vim-ruby' " ruby support
  Plug 'smerrill/vcl-vim-plugin' " varnish config language
  Plug 'tclem/vim-arduino' " arduino support
  Plug 'hashivim/vim-consul'
  Plug 'hashivim/vim-nomadproject'
  Plug 'hashivim/vim-ottoproject'
  Plug 'hashivim/vim-packer'
  Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
  Plug 'hashivim/vim-vagrant'
  Plug 'hashivim/vim-vaultproject'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'Matt-Deacalion/vim-systemd-syntax' " systemd language

  call plug#end()

" Turn on syntax highlighting and filetype detection.
" vim-plug loads all the extra syntax and ftdetect files, so turn them on after
" we load plugins.
  filetype plugin indent on
  syntax enable
  colorscheme Tomorrow-Night
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Enable true color
  if exists('+termguicolors')
    set termguicolors
  endif

" see https://github.com/neovim/neovim/issues/2048
  if has('nvim')
    nmap <silent> <bs> :<c-u>TmuxNavigateLeft<cr>
  endif

  set background=dark
  set clipboard+=unnamed
  set hidden
  set pastetoggle=<f6> " for neovim
  set nopaste
  set noshowmode
  set noswapfile
  set relativenumber number
  set tabstop=2 shiftwidth=2 expandtab
  set conceallevel=0
  set autoread " detect when a file is changed
  set laststatus=2
  set wrap linebreak nolist
  set undofile
  set undodir="$HOME/.VIM_UNDO_FILES"
  set nobackup      " disable automatic creation of backup files
  set nowritebackup " changes default behavior of saving files to 'write,delete,rename'
  set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
  set incsearch     " do incremental searching
  set scrolloff=10  " number of lines to show below the cursor before the buffer scrolls down
  set autoindent             " automatic indent new lines
  set smartindent            " be smart about it
  set wrapmargin=8           " wrap lines when coming within n characters from side
  set formatoptions+=n,1     " support for numbered/bullet lists
  set nofoldenable           " disable fold
  set wildmenu               " turn on wild menu
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

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
  set spellfile=$HOME/.vim/spell/.vim-spell-en.utf-8.add

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  let g:gist_clip_command = 'pbcopy'
  let g:gitgutter_map_keys = 0

" *******************************
" Vim-airline
" *******************************
  let g:airline_theme='tomorrow'
  let g:airline_powerline_fonts = 1

" on opening the file, clear search-highlighting
  autocmd BufReadCmd set nohlsearch

  " Without this, the next line copies a bunch of netrw settings like `let
  " g:netrw_dirhistmax` to the system clipboard.
  " I never use netrw, so disable its history.
  let g:netrw_dirhistmax = 0

  augroup myfiletypes
    autocmd!
    " Include ! as a word character, so dw will delete all of e.g. gsub!,
    " and not leave the "!"
    au FileType ruby,eruby,yaml set iskeyword+=!,?
    au FileType ruby,eruby,yaml set isfname=_,-,48-57,A-Z,a-z,/
    au BufNewFile,BufRead,BufWrite *.md,*.markdown syntax match Comment /\%^---\_.\{-}---$/
	  au BufNewFile,BufRead *.ino set filetype=c
	  au BufNewFile,BufRead *.svg set filetype=xml
	  au BufNewFile,BufRead .babelrc set filetype=json
	  au BufNewFile,BufRead .jshintrc set filetype=json
	  au BufNewFile,BufRead .eslintrc set filetype=json
    au VimResized * wincmd =

    autocmd! BufWritePost * Neomake
  augroup END

  let g:neomake_verbose = 0
  let g:neomake_airline = 1

" custom key mappings and function calls
  noremap <leader>l :Align
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

" ******************************************
" Deoplete
" ******************************************

" deoplete.nvim recommend
  " set completeopt+=noselect
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_camel_case = 1
  let g:deoplete#keyword_patterns = {}
  let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
  let g:deoplete#sources#go = 'vim-go'

" ******************************************
" Neosnippet
" ******************************************

  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#expand_word_boundary = 1
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
" Tell Neosnippet about the other snippets
  " let g:neosnippet#snippets_directory='~/.config/repos/github.com/Shougo/neosnippet-snippets/neosnippets, ~/Github/ionic-snippets, ~/.config/repos/github.com/matthewsimo/angular-vim-snippets/snippets'

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

" *******************************************
" Fzf - Fuzzy Finder
" *******************************************

  nnoremap <silent> <C-p> :call fzf#run({
  \   'down': '40%',
  \   'sink': 'botright split' })<CR>

" *******************************************
" Tmux - mappings
" *******************************************

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

