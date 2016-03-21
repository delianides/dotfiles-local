" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
" technically this is unnessesary, having a .vimrc file sets this
" automatically.
set nocompatible

" Leader key
let mapleader = " "

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax enable
endif

" I use vundle for plugins but those are loaded in a separate file
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

colorscheme Tomorrow-Night
let g:airline_theme='tomorrow'

set guifont=Source\ Code\ Pro:h13
set background=dark
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup      " disable automatic creation of backup files
set nowritebackup " changes default behavior of saving files to 'write,delete,rename'
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set noruler         "dont show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set clipboard=unnamed
set linespace=5
set linebreak
set nolist        " show trailing whitespace
set textwidth=0
set wrapmargin=0
set scrolloff=3

set autoindent             " automatic indent new lines
set smartindent            " be smart about it
set wrap                   " do wrap lines
set formatoptions+=n       " support for numbered/bullet lists
set formatoptions+=1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2          " yep, two
set shiftround
set expandtab

" Numbers
set number "show line numbers
set numberwidth=6 "width of the column
set lazyredraw           " turn off lazy redraw
set wildmenu               " turn on wild menu
set wildmode=longest,list,full
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set ch=2                   " command line height
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
set report=0               " tell us about changes
set relativenumber         " line numbers display differently
set numberwidth=4
set foldenable
set foldlevelstart=10      " open most folds by default
set foldnestmax=10         " 10 nested fold max
set foldmethod=indent      " fold based on indent level

set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set ignorecase             " ignore case when searching
set nohlsearch             " don't highlight searches
set visualbell             " shut up

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
" if exists('$TMUX') && !has('nvim')  " Support resizing in tmux
"   set ttymouse=xterm2
" endif

" Auto commands that run when vim starts, some are specific to a file type.
augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  autocmd FileType markdown setlocal formatoptions=1
  autocmd FileType markdown setlocal noexpandtab
  autocmd FileType markdown setlocal spell spelllang=en_us
  autocmd FileType markdown set complete+=s
  autocmd FileType markdown set formatprg=par
  autocmd FileType markdown setlocal wrap
  autocmd FileType markdown setlocal linebreak

  " commands only available for go files
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>c <Plug>(go-coverage)

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"


" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>wi :EraseBadWhitespace<CR>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
map <Leader>bb :!bundle install<cr>
nmap <Leader>bi :source ~/.vimrc.bundles<cr>:BundleInstall<cr>
map <leader>f ggVG==<CR>
map <leader>i mmgg=G`m<CR>
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
map <Leader>te :!bw:conf q
map <Leader>vi :tabe ~/.vimrc<CR>

" exit to normal mode with 'jj', so i don't always have to hit the escape key
inoremap jj <ESC>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:gist_clip_command = 'pbcopy'
let g:javascript_enable_domhtmlcss = '1'
let g:syntastic_javascript_checkers = ['eslint']

" space open/closes folds
nnoremap <leader> za

" Quicker window movement, mapped to tmux too
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Toggle spelling with the F7 key
nn :setlocal spell! spelllang=en_us
imap :setlocal spell! spelllang=en_us
" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Spelling
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

