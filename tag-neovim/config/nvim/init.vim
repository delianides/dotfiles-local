" vim: fdm=marker foldlevel=99 foldenable sw=4 ts=4 sts=4

"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"
" {{{ The IMPORTANT
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
" }}}

" {{{ vim-plug: https://github.com/junegunn/vim-plug
"
call plug#begin('~/.config/nvim/bundle')

" {{{ vim tools
"
" highlight the object that is yanked
Plug 'machakann/vim-highlightedyank'

" highlight bad whitespace as red. use <leader>wi to remove
Plug 'bitc/vim-bad-whitespace'

" align lines based on args
Plug 'junegunn/vim-easy-align'

" interact with github gist file storage
Plug 'lambdalisue/vim-gista', { 'on': 'Gista' } " manipulate gists in vim

" git commands in vim
Plug 'tpope/vim-fugitive'

" search github issues in vim
Plug 'tpope/vim-rhubarb'

" netrw play nicely
Plug 'tpope/vim-vinegar'

" show git changes in column
Plug 'airblade/vim-gitgutter'

" async linting tool
Plug 'neomake/neomake'

" surround vim objects with a string
Plug 'tpope/vim-surround'

" universal comment application
Plug 'tpope/vim-commentary'

" allows . to repeat previous two commands
Plug 'tpope/vim-repeat'

" sensible vim settings we can all agree on
Plug 'tpope/vim-sensible'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" autocomplete for go
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}

" autocomplete for typescript
Plug 'mhartington/deoplete-typescript', {'for': 'typescript'}

" autocomplete for javascript
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" autocomplete for flow typed javascript
" Plug 'steelsojka/deoplete-flow', { 'for': ['javascript','javascript.jsx'] }

" snippets
Plug 'Shougo/neosnippet.vim'

" collection of snippets
Plug 'Shougo/neosnippet-snippets'

" another collection of snippets
Plug 'honza/vim-snippets'

" react collection of snippets
Plug 'justinj/vim-react-snippets', { 'for': 'javascript' }

" ctags generation, install jsctags for javascript
Plug 'xolox/vim-misc' | Plug 'xolox/vim-easytags'

" code outline with ctags
Plug 'majutsushi/tagbar'

" FuzzyFind
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" }}}
"
" {{{ tmux plugins
"
" syntax for tmux.conf
Plug 'tmux-plugins/vim-tmux'

" navigating tmux panes and vim buffers alike
Plug 'christoomey/vim-tmux-navigator'

" auto complete from adjacent tmux panes
Plug 'wellle/tmux-complete.vim'
"
" }}}
"
" {{{ syntax files
"
" git syntax
Plug 'tpope/vim-git' " git support

" distraction free markdown writing
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" preview markdown files in a webbrowser
Plug 'shime/vim-livedown', { 'for': 'markdown', 'do': 'npm install -g livedown' }

" markdown specific syntax settings
Plug 'tpope/vim-markdown', {'for': 'markdown'}

" flowtype javascript syntax
Plug 'flowtype/vim-flow', { 'for': ['javascript','javascript.jsx'] }

" javascript syntax highlighting with ES6 and ES7
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', {'for': ['javascript','javascript.jsx']}

" coffeescript syntax highlighting
Plug 'kchmck/vim-coffee-script', {'for': ['coffee', 'javascript']}

" typescript syntax highlighting
Plug 'Quramy/tsuquyomi', {'for': 'typescript'}
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}

" jsx syntax highlighting for react
Plug 'mxw/vim-jsx', { 'for': ['javascript','javascript.jsx'] } " JSX support

" graphql syntax highlighting
Plug 'jparise/vim-graphql'

" json syntax highlighting
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support

" golang syntax and tools
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' } " go support
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/bundle/gocode/nvim/symlink.sh' }

" sass syntax highlighting
Plug 'cakebaker/scss-syntax.vim' " sass support

" show color as hex value in vim
Plug 'ap/vim-css-color'

" ruby syntax
Plug 'vim-ruby/vim-ruby' " ruby support

" arduino syntax
Plug 'tclem/vim-arduino' " arduino support

" hashicorp hcl syntax highlighting
Plug 'hashivim/vim-hashicorp-tools'

" dockerfile based highlighting
Plug 'ekalinin/Dockerfile.vim'

" systemd syntax highlighting
Plug 'Matt-Deacalion/vim-systemd-syntax' " systemd language
"
" }}}
"
" {{{ themes and such
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
"
" }}}
"
" {{{ utilities for other plugins
"
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
"
" }}}

call plug#end()
"
" }}} end vim-plug

" {{{ load themes
"
if (has("termguicolors"))
    set termguicolors
endif

colorscheme molokai
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
"
" }}}

" {{{ System Settings
"
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
"
" }}} end settings

" {{{ netrw file browser configured through tpope/vim-vinegar
"
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_banner=0        " disable annoying banner

"
" }}}

" {{{ filetype configurations with linting
"
" neomake
"
" for debugging, 0 is none, 3 is debug
let g:neomake_verbose = 0
let g:neomake_airline = 1
let g:neomake_go_enabled_makers = ['golint']
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')
let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }

autocmd! BufWritePost,BufEnter * Neomake

" markdown
autocmd FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html', 'go', 'ruby']

" terraform
autocmd FileType terraform setlocal commentstring=#\ %s

" gitcommits
autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

autocmd FileType ruby,eruby,yaml set iskeyword+=!,?
autocmd FileType ruby,eruby,yaml set isfname=_,-,48-57,A-Z,a-z,/
autocmd BufNewFile,BufRead *.ino set filetype=c
autocmd BufNewFile,BufRead *.svg set filetype=xml
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead .jshintrc set filetype=json
autocmd BufNewFile,BufRead .eslintrc set filetype=json
autocmd VimResized * wincmd =

"
" }}}

" {{{ custom key mappings
"
" see https://github.com/neovim/neovim/issues/2048
if has('nvim')
    nmap <silent> <bs> :<c-u>TmuxNavigateLeft<cr>
endif

nnoremap <leader>wi :EraseBadWhitespace<CR>
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
"
" }}}

" {{{ fold your laundry
"
set foldenable
set foldmethod=indent
set foldlevel=999

nnoremap s za
nnoremap S zA

autocmd FileType javascript,html,css,scss,typescript,json setlocal foldlevel=99
autocmd FileType javascript,typescript,json setlocal foldmethod=syntax
autocmd FileType coffee setlocal foldmethod=indent

" fold and unfold
nnoremap <leader>fu zM<CR>
nnoremap <leader>uf zR<CR>
" Focus the current fold by closing all others
nnoremap <leader>flf mzzM`zzv
"
" }}}

" {{{ pop some tags
"
" let g:easytags_dynamic_files = 1
" let g:easytags_on_cursorhold = 1
" let g:easytags_updatetime_min = 4000
" let g:easytags_auto_update = 1
" let g:easytags_async = 1
" let g:easytags_by_filetype = '~/tagfiles'
" let g:easytags_languages = {
" \   'javascript': {
" \     'cmd': 'jsctags',
" \       'args': ['-f']
" \   }
" \ }
"
" }}}

" {{{ autocomplete
"
let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'

function! StrTrim(txt)
    return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

" if g:flow_path != 'flow not found'
"     let g:deoplete#sources#flow#flow_bin = g:flow_path
" endif
"
" }}}

" {{{ snippets
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
"
" }}}

" {{{ tmux-plugins - assist in using tmux
"
let g:tmuxcomplete#trigger = ''
"
" }}}

" {{{ writing golang
"
let g:go_textobj_include_function_doc = 1
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"
"
" }}}

" {{{ writing avascript
"
let g:jsx_ext_required = 0
let g:flow#flowpath = g:flow_path

autocmd FileType json let g:vim_json_syntax_conceal = 0
"
" }}}

" {{{ git-gutter - shows changes to files
"
let g:gitgutter_map_keys = 0

" }}}

" {{{  Fuzzy Findering
nnoremap <silent> <C-p> :call fzf#run({
    \   'down': '40%',
    \   'sink': 'botright split' })<CR>

imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-p> <plug>(fzf-complete-path)
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
"
" }}}

