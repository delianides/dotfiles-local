set background=dark
set clipboard+=unnamed
set hidden
set nopaste
set noshowmode
set noswapfile

set list                   " show whitespace
set listchars=nbsp:⦸       " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅      " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                           " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»   " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«  " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•     " BULLET (U+2022, UTF-8: E2 80 A2)
set nojoinspaces           " don't autoinsert two spaces after '.', '?', '!' for join command

if has('linebreak')
  let &showbreak='↳ '      " DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
endif  

set relativenumber number
set tabstop=2 shiftwidth=2 expandtab
set laststatus=2
set wrap linebreak nolist
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"
set nobackup               " disable automatic creation of backup files
set nowritebackup          " changes default behavior of saving files to 'write,delete,rename'
set noswapfile             " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set scrolloff=10           " number of lines to show below the cursor before the buffer scrolls down
set showcmd
set smarttab
set smartindent            " be smart about it
set wrapmargin=8           " wrap lines when coming within n characters from side
set formatoptions+=n,1     " support for numbered/bullet lists
set wildmode=longest:full,full
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOAc    " shorten messages
set completeopt-=preview
set completeopt+=menuone
set showmatch              " brackets/braces that is
set mat=7                  " duration to show matching brace (1/10 sec)
set ignorecase             " ignore case when searching
set nocursorcolumn         " speed up syntax highlighting
set nocursorline
set nohlsearch             " don't highlight searches
set visualbell             " shut up
set noerrorbells           " ditto
set splitbelow
set splitright
set textwidth=80
set complete+=kspell

set spellcapcheck=
set spellfile=$HOME/.vim/spell/.vim-spell-en.utf-8.add


set foldenable
set foldmethod=indent
set foldlevel=999
