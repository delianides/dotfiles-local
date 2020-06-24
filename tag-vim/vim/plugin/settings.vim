set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set termencoding=utf-8

set tabstop=2                         " spaces per tab
set softtabstop=2
set shiftwidth=2                      " spaces per tab (when shifting)
set expandtab                         " always use spaces instead of tabs

set nowrap                            " no wrap
set signcolumn=yes

if exists('+emoji')
  set noemoji
endif

set noswapfile
set nobackup                        " don't create root-owned files
set modeline

set textwidth=80
" set colorcolumn=+1
" let &colorcolumn=join([&colorcolumn,81] + range(101,999), ',')

syntax sync minlines=256              " start highlighting from 256 lines backwards
set synmaxcol=300                     " do not highlight very long lines

set noshowmode                        " Don't Display the mode you're in. since it's already shown on the statusline

" show a navigable menu for tab completion
set wildmode=longest:full,list,full
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc
set wildignore+=*.swp,*~,*/.DS_Store
set tagcase=followscs
set tags^=./.git/tags;

if has('nvim-0.4')
  set pumblend=10
endif

if has('nvim-0.4')
  set pumheight=50
endif

if has('syntax')
  set spellcapcheck=                  " don't check for capital letters at start of sentence
  " https://robots.thoughtbot.com/opt-in-project-specific-vim-spell-checking-and-word-completion
  set spelllang=en,nl
  set spellsuggest=30
  let &spellfile='~/.vim/spell/en.utf-8.add'
endif

set complete+=kspell

" Disable unsafe commands.
" Only run autocommands owned by me
" http://andrew.stwrt.ca/posts/project-specific-vimrc/
set secure

if has('virtualedit')
  set virtualedit=block               " allow cursor to move where there is no text in visual block mode
endif
set whichwrap=b,h,l,s,<,>,[,],~       " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries

set completeopt+=menuone
set completeopt+=noinsert
set completeopt-=preview

set lazyredraw                        " don't bother updating screen during macro playback

" highlight matching [{()}]
set showmatch
set title
set mouse=a

" More natural splitting
set splitbelow
set splitright

" Ignore case in search.
set ignorecase smartcase

" fix slight delay after pressing ESC then O http://ksjoberg.com/vim-esckeys.html
" set timeout timeoutlen=500 ttimeoutlen=100
set timeoutlen=1000 ttimeoutlen=0

if !has('nvim') && (v:version > 703 || v:version == 703 && has('patch541'))
  set formatoptions+=j                " remove comment leader when joining comment lines
endif
set formatoptions+=n                  " smart auto-indenting inside numbered lists
set formatoptions+=r1

" No beeping.
set visualbell

" No flashing.
set noerrorbells

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=5
set sidescrolloff=5

" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=3

" yank and paste with the system clipboard
set clipboard=unnamed

" line numbers are relative to the current line
set relativenumber

" show trailing whitespace
set list
set listchars=tab:………,nbsp:░,extends:»,precedes:«,trail:·
set nojoinspaces
set concealcursor=n

if has('windows')
  set fillchars=diff:⣿                " BOX DRAWINGS
  set fillchars+=vert:┃               " HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  set fillchars+=fold:─
  if has('nvim')
    set fillchars=eob:\                 " Hide end of buffer ~
  endif
endif

" Configure fold status text
if has('folding')
  set foldtext=utils#NeatFoldText()
  set foldlevelstart=99               " start unfolded
endif

if has('linebreak')
  let &showbreak='↳  '                " DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
endif

" show where you are
set ruler

set hidden

" Make tilde command behave like an operator.
set tildeop

set shortmess+=A                      " ignore annoying swapfile messages
set shortmess+=I                      " no splash screen
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
set shortmess+=o                      " overwrite file-written messages
set shortmess+=t                      " truncate file messages at start

if has('mksession')
  set viewdir=~/.vim/tmp/view         " override ~/.vim/view default
  set viewoptions=cursor,folds        " save/restore just these (with `:{mk,load}view`)
endif

if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile                    " don't create root-owned files
  else
    set undodir=~/.vim/tmp/undo       " keep undo files out of the way
    set undodir+=.
    set undofile                      " actually use undo files
  endif
endif

if exists('&swapsync')
  set swapsync=                       " let OS sync swapfiles lazily
endif

set updatecount=80                    " update swapfiles every 80 typed chars

if has('nvim')
  set inccommand=nosplit                " incremental command live feedback"
endif

if exists('&guioptions')
  " cursor behavior:
  "   - no blinking in normal/visual mode
  "   - blinking in insert-mode
  set guicursor+=n-v-c:blinkon0,i-ci:ver25-Cursor/lCursor-blinkwait30-blinkoff100-blinkon100
endif

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif
