if &runtimepath =~ 'neomake'
	" for debugging, 0 is none, 3 is debug
	let g:neomake_verbose = 0
	let g:neomake_airline = 1
	" let g:neomake_open_list = 2
	let g:neomake_go_enabled_makers = ['golint']

	function! StrTrim(txt)
	  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
	endfunction

	let g:neomake_javascript_enabled_makers = []
	let g:neomake_jsx_enabled_makers = []

	if findfile('.flowconfig', '.;') !=# ''
	  let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
	  if g:flow_path != 'flow not found'
		let g:neomake_javascript_flow_maker = {
			  \ 'exe': 'sh',
			  \ 'args': ['-c', g:flow_path.' --json 2> /dev/null | flow-vim-quickfix'],
			  \ 'errorformat': '%E%f:%l:%c\,%n: %m',
			  \ 'cwd': '%:p:h'
			  \ }
		let g:neomake_javascript_enabled_makers = g:neomake_javascript_enabled_makers + [ 'flow']
		let g:neomake_jsx_enabled_makers = g:neomake_jsx_enabled_makers + [ 'flow']
	  endif
	endif

	if findfile('.eslintrc', '.;') !=# ''
	  let g:eslint_path = StrTrim(system('PATH=$(npm bin):$PATH && which eslint'))
	  if g:eslint_path != 'eslint not found'
		let g:neomake_javascript_eslint_exe = g:eslint_path
		let g:neomake_javascript_enabled_makers = g:neomake_javascript_enabled_makers + [ 'eslint']
		let g:neomake_jsx_enabled_makers = g:neomake_jsx_enabled_makers + [ 'eslint']
	  endif
	endif

	let g:neomake_warning_sign = {
	  \ 'text': 'W',
	  \ 'texthl': 'WarningMsg',
	  \ }
	let g:neomake_error_sign = {
	  \ 'text': 'E',
	  \ 'texthl': 'ErrorMsg',
	  \ }

	autocmd! BufWritePost,BufEnter * Neomake
endif
