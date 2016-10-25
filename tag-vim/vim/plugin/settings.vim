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
set completeopt=menu,menuone
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
set complete+=kspell
set spellfile=$HOME/.vim/spell/.vim-spell-en.utf-8.add


set foldenable
set foldmethod=indent
set foldlevel=999
