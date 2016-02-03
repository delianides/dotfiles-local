" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
" technically this is unnessesary, having a .vimrc file sets this
" automatically.
set nocompatible

" Leader key
let mapleader = " "

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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" I use vundle for plugins but those are loaded in a separate file
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

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

set autoindent             " automatic indent new lines
set smartindent            " be smart about it
set wrap                   " do wrap lines
set softtabstop=2          " yep, two
set formatoptions+=n       " support for numbered/bullet lists
set formatoptions+=1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Numbers
set number "show line numbers
set numberwidth=5 "width of the column

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_match_window = 'bottom,order:ttb'
  let g:ctrlp_switch_buffer = 0
  let g:ctrlp_working_path_mode = 0
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


"custom leader commands, for my amusment, the may or may not be helpful for you
map <Leader>bb :!bundle install<cr>
nmap <Leader>bi :source ~/.vimrc.bundles<cr>:BundleInstall<cr>
map <leader>f ggVG==<CR>
map <leader>i mmgg=G`m<CR>
map <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>
map <leader>n :vsp note:<cr>:1<cr>dGG
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
map <leader>t :CtrlP<CR>
map <Leader>te :!bw:conf q
map <Leader>vi :tabe ~/.vimrc<CR>
nmap <Leader>wi :EraseBadWhitespace<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" " Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" exit to normal mode with 'jj', so i don't always have to hit the escape key
inoremap jj <ESC>

" nerd tree
map <C-n> :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:gist_clip_command = 'pbcopy'

let g:javascript_enable_domhtmlcss = '1'
let g:syntastic_javascript_checkers = ['eslint']

" ui
colorscheme PaperColor
let g:airline_theme='PaperColor'

set guifont=Source\ Code\ Pro:h13
set background=dark
set anti " for antialias
set linespace=5
"set guioptions=egmrt "http://vimdoc.sourceforge.net/htmldoc/options.html#'guioptions
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

set showcmd              " don't display incomplete commands
set lazyredraw           " turn off lazy redraw
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set ch=2                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
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
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching
set nohlsearch             " don't highlight searches
set visualbell             " shut up

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

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

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Toggle spelling with the F7 key
nn :setlocal spell! spelllang=en_us
imap :setlocal spell! spelllang=en_us

" Spelling
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

"handle whitespace like a boss
function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
