scriptencoding utf-8

if has('autocmd')
	function! s:UtilsAutocmds()
		augroup UtilsAutocmds
			autocmd!

			autocmd BufNewFile,BufRead {Gemfile,Brewfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set filetype=ruby
			autocmd BufNewFile,BufRead .{babel,eslint,stylelint,prettier,jshint}rc,.tern-* set filetype=json

			autocmd VimResized * execute "normal! \<c-w>="

			" http://vim.wikia.com/wiki/Detect_window_creation_with_WinEnter
			autocmd VimEnter * autocmd WinEnter * let w:created=1
			autocmd VimEnter * let w:created=1
			autocmd VimResized * wincmd =
			autocmd BufReadPost *
						\ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
						\   exe "normal g`\"" |
						\ endif

			" Disable paste mode on leaving insert mode.
			autocmd InsertLeave * set nopaste

			" Make current window more obvious by turning off/adjusting some features in non-current
			" windows.
			if exists('+winhighlight')
				autocmd BufEnter,FocusGained,VimEnter,WinEnter * set winhighlight=
				autocmd FocusLost,WinLeave * set winhighlight=CursorLineNr:LineNr,EndOfBuffer:ColorColumn,IncSearch:ColorColumn,Normal:ColorColumn,NormalNC:ColorColumn,SignColumn:ColorColumn
			endif

			autocmd BufWritePost */spell/*.add silent! :mkspell! %

			if exists('##TextYankPost')
				autocmd TextYankPost * silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank('Substitute', 200)
			endif
		augroup END
	endfunction

	call s:UtilsAutocmds()
endif
