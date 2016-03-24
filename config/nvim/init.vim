" nvim commands line up here
  if &compatible
    set nocompatible
  endif
  call plug#begin('~/.config/nvim/plugged')
" tools
  Plug 'ap/vim-css-color'
  Plug 'mattn/gist-vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
  Plug 'bitc/vim-bad-whitespace'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'benekastah/neomake'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-sleuth'
  Plug 'rking/ag.vim'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " distraction-free writing
  Plug 'junegunn/limelight.vim', { 'on': 'Limelight' } " focus tool. Good for presentating with vim
  Plug 'sotte/presenting.vim', { 'for': 'markdown' } " a simple tool for presenting slides in vim based on text files
  Plug 'vim-scripts/Align'
  Plug 'tomtom/tlib_vim'
  Plug 'mattn/webapi-vim'
  Plug 'vim-misc'

" themes
  Plug 'vim-airline/vim-airline'
  Plug 'mhartington/oceanic-next'

" syntax
  Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
  Plug 'kchmck/vim-coffee-script' " coffeescript support
  Plug 'tpope/vim-ragtag' " for html
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " JavaScript support
  Plug 'moll/vim-node', { 'for': 'javascript' } " node support
  Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
  Plug 'mxw/vim-jsx', { 'for': 'jsx' } " JSX support
  Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
  Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app
  Plug 'tpope/vim-markdown', {'for': 'markdown'}
  Plug 'fatih/vim-go', { 'for': 'go' } " go support
  Plug 'tpope/vim-git' " git support
  Plug 'cakebaker/scss-syntax.vim' " sass support
  Plug 'evidens/vim-twig' " twig support
  Plug 'nono/vim-handlebars' " handlebars support
  Plug 'vim-ruby/vim-ruby' " ruby support
  Plug 'smerrill/vcl-vim-plugin' " varnish config language
  Plug 'tclem/vim-arduino' " arduino support - compile wihtout needing to open the arduino IDE
  Plug 'hashivim/vim-hashicorp-tools' " hashicorp tools support, mostly for hcl, hashicorp Configuration language
  Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
  Plug 'Matt-Deacalion/vim-systemd-syntax' " systemd language
  Plug 'tobyS/vmustache' " mustache template system

  call plug#end()
  filetype plugin indent on
  set autoread " detect when a file is changed

" THE SUPPORT IMPORTANT STUFF "
" -----------------------------
" Leader key
  let mapleader = ' '
" exit to normal mode with 'jj', so i don't always have to hit the escape key
  inoremap jj <ESC>
" ------------------------------

" Color Schemes
  syntax enable
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  colorscheme OceanicNext
  set background=dark
  let g:airline_theme='oceanicnext'

  set clipboard+=unnamedplus
  set pastetoggle=<f6> " for neovim
  set nopaste
  set noshowmode
  set noswapfile
  set relativenumber number
  set tabstop=2 shiftwidth=2 expandtab
  set conceallevel=0
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
  set formatoptions+=n,1       " support for numbered/bullet lists
  set wildmenu               " turn on wild menu
  set wildmode=longest,list,full
  set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
  set shortmess=filtIoOA     " shorten messages
  set showmatch              " brackets/braces that is
  set mat=7                  " duration to show matching brace (1/10 sec)
  set ignorecase             " ignore case when searching
  set nohlsearch             " don't highlight searches
  set visualbell             " shut up
  set noerrorbells           " ditto
  set splitbelow
  set splitright

" custom key mappings and function calls
  noremap <leader>l :Align
  nnoremap <leader>a :Ag<space>
  nnoremap <leader>b :CtrlPBuffer<CR>
  nnoremap <leader>d :NERDTreeToggle<CR>
  nnoremap <leader>f :NERDTreeFind<CR>
  nnoremap <leader>t :CtrlP<CR>
  nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
  nnoremap <leader>wi :EraseBadWhitespace<CR>
  nnoremap <leader>g :GitGutterToggle<CR>
  noremap <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
  nmap <Leader>ni :source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
  map <leader>f ggVG==<CR>
  map <leader>i mmgg=G`m<CR>
  map <leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
  map <leader>v :set paste!<CR>
  map <Leader>te :!bw:conf q
  map <Leader>vi :tabe ~/.config/nvim/init.vim<CR>

" plugin settings
  let g:ctrlp_match_window = 'order:ttb,max:20'
  let g:gist_clip_command = 'pbcopy'
  let g:javascript_enable_domhtmlcss = '1'

" gitgutter
  let g:gitgutter_map_keys = 0

" nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  let g:NERDSpaceDelims=1
  let g:NERDTreeQuitOnOpen=0 " close NERDTree after a file is opened
  let NERDTreeShowHidden=1 " show hidden files in NERDTree

" space open/closes folds
  nnoremap <leader> za

" Navigate between vim and tmux
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
  tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
  tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
  tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
  tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
  tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>

" Get off my lawn, aka don't use arrow keys in vim.
  nnoremap <Left> :echoe "Use h"<CR>
  nnoremap <Right> :echoe "Use l"<CR>
  nnoremap <Up> :echoe "Use k"<CR>
  nnoremap <Down> :echoe "Use j"<CR>


" Switch between the last two files
  nnoremap <leader><leader> <c-^>


" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
  set spellfile=$HOME/.vim-spell-en.utf-8.add

" Auto commands that run when vim starts, some are specific to a file type.
  if has('autocmd') && !exists('autocommands_loaded')
    let autocommands_loaded = 1

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" Set syntax highlighting for specific file types
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html', 'go', 'ruby']
    autocmd FileType markdown,textile setlocal textwidth=0 wrapmargin=0 wrap spell
    autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/

" so I can comment terraform files
    autocmd FileType terraform setlocal commentstring=#\ %s

    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab indentkeys-=*<return>

    autocmd BufNewFile,BufRead *.ejs set filetype=html
    autocmd BufNewFile,BufRead *.ino set filetype=c
    autocmd BufNewFile,BufRead *.svg set filetype=xml
    autocmd BufNewFile,BufRead .babelrc set filetype=json
    autocmd BufNewFile,BufRead .jshintrc set filetype=json
    autocmd BufNewFile,BufRead .eslintrc set filetype=json

" commands only available for go files
    au FileType go nmap <Leader>gd <Plug>(go-doc)
    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>c <Plug>(go-coverage)

" Allow stylesheets to autocomplete hyphenated words
    autocmd FileType css,scss,sass setlocal iskeyword+=-
    autocmd! BufWritePost * Neomake
  endif

" format with goimports instead of gofmt
  let g:go_fmt_command = "goimports"
  let g:neomake_go_enabled_makers = ['golint']
  let g:neomake_verbose = 0
  let g:neomake_airline = 1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  if executable('ag')
" Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif

" functions



