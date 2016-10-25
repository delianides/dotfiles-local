function s:preview(file)
  silent execute "!open -a 'Markoff.app' " . shellescape(a:file)
endfunction

function commands#preview(...)
  if a:0 == 0
    call s:preview(expand('%'))
  else
    for l:file in a:000
      call s:preview(l:file)
    endfor
  endif
endfunction
