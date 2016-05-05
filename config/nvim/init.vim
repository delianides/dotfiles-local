" nvim commands line up here
  if &compatible
    set nocompatible
  endif
  call plug#begin('~/.config/nvim/plugged')

" tools
  Plug 'ap/vim-css-color'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
  Plug 'bitc/vim-bad-whitespace'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'benekastah/neomake'
  Plug 'AndrewRadev/switch.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'Chiel92/vim-autoformat'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-sleuth'
  Plug 'kassio/neoterm'
  Plug 'Yggdroot/indentLine'
  Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " distraction-free writing
  Plug 'junegunn/limelight.vim', { 'on': 'Limelight' } " focus tool. Good for presentating with vim
  Plug 'sotte/presenting.vim', { 'for': 'markdown' } " a simple tool for presenting slides in vim
  Plug 'rhysd/github-complete.vim'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'jaxbot/github-issues.vim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'carlitux/deoplete-ternjs'
  Plug 'zchee/deoplete-go'
  Plug 'Shougo/neoinclude.vim'
" Plug 'Shougo/neocomplete.vim'
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'honza/vim-snippets'
  Plug 'ujihisa/neco-look', {'for': 'markdown'}
  Plug 'xolox/vim-notes', {'for': 'markdown'}
  Plug 'vim-scripts/Align'
  Plug 'mattn/gist-vim'
  Plug 'mattn/webapi-vim'
  Plug 'vim-misc'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/unite-outline'
  Plug 'junkblocker/unite-codesearch'

" themes
  Plug 'vim-airline/vim-airline'
  Plug 'mhartington/oceanic-next'

" syntax
  Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim
  Plug 'kchmck/vim-coffee-script' " coffeescript support
  Plug 'tpope/vim-ragtag' " for html
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " JavaScript support
  Plug 'othree/jsdoc-syntax.vim', {'for': ['javascript', 'typescript']}
  Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
  Plug 'Quramy/tsuquyomi', {'for': ['typescript','javascript']}
  " Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
  Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
  Plug 'Raimondi/delimitMate', {'for': ['javascript', 'typescript', 'css', 'scss']}
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'moll/vim-node', { 'for': 'javascript' } " node support
  Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
  Plug 'mxw/vim-jsx', { 'for': 'jsx' } " JSX support
  Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
  Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app
  Plug 'tpope/vim-markdown', {'for': 'markdown'}
  Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}
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

" THE IMPORTANT STUFF "
" -----------------------------
" Leader key
  let mapleader = ' '
" exit to normal mode with 'jj', so i don't always have to hit the escape key
  inoremap jj <ESC>
  " No need for ex mode
  nnoremap Q <nop>
" recording macros is not my thing
  map q <Nop>
" ------------------------------

" see https://github.com/neovim/neovim/issues/2048
  if has('nvim')
    nmap <silent> <bs> :<c-u>TmuxNavigateLeft<cr>
  endif

" Color Schemes
  syntax enable
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  colorscheme OceanicNext
  set background=dark
  let g:airline_theme='oceanicnext'
  let g:airline#extensions#tabline#enabled = 1
  set hidden
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline_powerline_fonts = 1

  cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
  tmap <leader>x <c-\><c-n>:bp! <BAR> bd! #<CR>
  nmap <leader>t :term<cr>
  nmap <leader>, :bnext<CR>
  tmap <leader>, <C-\><C-n>:bnext<cr>
  nmap <leader>. :bprevious<CR>
  tmap <leader>. <C-\><C-n>:bprevious<CR>

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

" custom key mappings and function calls
  noremap <leader>l :Align
  map <C-n> :NERDTreeToggle<CR>
  nnoremap <c-p> :fzf<CR>
  nnoremap <leader>wi :EraseBadWhitespace<CR>
  noremap <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
  nmap <Leader>ni :source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
  map <leader>f ggVG==<CR>
  map <leader>i mmgg=G`m<CR>
  map <leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
  map <silent> <leader>v :set paste!<CR>
  map <Leader>te :!bw:conf q
  map <Leader>vi :tabe ~/.config/nvim/init.vim<CR>
  noremap <leader>f :Autoformat<CR>
  noremap <leader>tm :TableModeToggle<CR>
  noremap <leader>gy :Goyo<CR>

  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!

" plugin settings
  let g:gist_clip_command = 'pbcopy'
  let g:javascript_enable_domhtmlcss = '1'
  let g:deoplete#sources#go = 'vim-go'
  let g:table_mode_corner="|"
  let g:indentLine_char='│'
  let g:deoplete#enable_at_startup = 1
  let g:gitgutter_map_keys = 0
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-p>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'

" Color name (:help cterm-colors) or ANSI code
  let g:limelight_conceal_ctermfg = 'gray'
  let g:limelight_conceal_ctermfg = 240

" nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let g:NERDSpaceDelims=1
  let g:NERDTreeQuitOnOpen=0 " close NERDTree after a file is opened
  let g:NERDTreeShowHidden=1 " show hidden files in NERDTree

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
  noremap H ^
  noremap L g_
  noremap J 5j
  noremap K 5k

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

" typescript command
    let g:tsuquyomi_disable_quickfix = 1
    autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>

    let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }

    let g:neomake_typescript_tsc_maker = {
      \ 'args': [
      \ '-m', 'commonjs', '--noEmit', '--target', 'ES5', '--experimentalDecorators'
      \ ],
      \ 'errorformat':
      \ '%E%f %#(%l\,%c): error %m,' .
      \ '%E%f %#(%l\,%c): %m,' .
      \ '%Eerror %m,' .
      \ '%C%\s%\+%m'
      \ }

    autocmd FileType javascript let g:neomake_javascript_enabled_makers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint']

" github omni completion
    autocmd FileType gitcommit setl omnifunc=github_complete#complete

" Allow stylesheets to autocomplete hyphenated words
    autocmd FileType css,scss,sass setlocal iskeyword+=-

    autocmd! BufWritePost * Neomake
  endif

" format with goimports instead of gofmt
  let g:go_fmt_command = "goimports"
  let g:neomake_go_enabled_makers = ['golint']
  let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']
  let g:neomake_verbose = 0
  let g:neomake_airline = 1

" neosnippet plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  let g:neosnippet#enable_snipmate_compatibility = 1 " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

" unite settings
  let g:unite_data_directory='~/.nvim/.cache/unite'
  let g:unite_source_history_yank_enable=1
  let g:unite_prompt='» '
  let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'lib']

  nnoremap <silent> <c-p> :Unite -auto-resize -start-insert -direction=botright file_rec/neovim<CR>
  nnoremap <silent> <leader>u :call dein#update()<CR>
  nnoremap <silent> <leader>m :Unite -auto-resize -start-insert -direction=botright redismru<CR>

" Custom mappings for the unite buffer
  autocmd FileType unite call s:unite_settings()

  function! s:unite_settings() "{{{
" Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  endfunction "}}}

" Git from unite...ERMERGERD ------------------------------------------------{{{
  let g:unite_source_menu_menus = {} " Useful when building interfaces at appropriate places
  let g:unite_source_menu_menus.git = {
    \ 'description' : 'Fugitive interface',
    \}
  let g:unite_source_menu_menus.git.command_candidates = [
    \[' git status', 'Gstatus'],
    \[' git diff', 'Gvdiff'],
    \[' git commit', 'Gcommit'],
    \[' git stage/add', 'Gwrite'],
    \[' git checkout', 'Gread'],
    \[' git rm', 'Gremove'],
    \[' git cd', 'Gcd'],
    \[' git push', 'exe "Git! push " input("remote/branch: ")'],
    \[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
    \[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
    \[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
    \[' git fetch', 'Gfetch'],
    \[' git merge', 'Gmerge'],
    \[' git browse', 'Gbrowse'],
    \[' git head', 'Gedit HEAD^'],
    \[' git parent', 'edit %:h'],
    \[' git log commit buffers', 'Glog --'],
    \[' git log current file', 'Glog -- %'],
    \[' git log last n commits', 'exe "Glog -" input("num: ")'],
    \[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
    \[' git log until date', 'exe "Glog --until=" input("day: ")'],
    \[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
    \[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
    \[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
    \[' git mv', 'exe "Gmove " input("destination: ")'],
    \[' git grep',  'exe "Ggrep " input("string: ")'],
    \[' git prompt', 'exe "Git! " input("command: ")'],
    \] " Append ' --' after log to get commit info commit buffers
  nnoremap <silent> <Leader>g :Unite -direction=botright -silent -buffer-name=git -start-insert menu:git<CR>

" For conceal markers.
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif

" functions



