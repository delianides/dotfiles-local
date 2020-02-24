let g:go_code_completion_enabled = 0

set completeopt="menu,menuone"

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ deoplete#manual_complete()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

call deoplete#custom#option('sources', {
	\ '_': ['tmuxcomplete', 'ale'],
\})

