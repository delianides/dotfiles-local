if &runtimepath =~ 'ale'
	let g:ale_linters = {
	\   'javascript': ['eslint'],
	\}

	function! StrTrim(txt)
	  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
	endfunction

	if findfile('.flowconfig', '.;') !=# ''
	  let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
	  if g:flow_path != 'flow not found'
		let g:ale_linters = {
		\   'javascript': ['eslint', 'flow'],
		\}
	  endif
	endif

	" XXX need to work on this
	hi ALEErrorSign guifg=white guibg=red
	hi ALEWarningSign guifg=yellow guibg=black

	let g:ale_sign_error = 'E'
	let g:ale_sign_warning = 'W'

	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
endif
