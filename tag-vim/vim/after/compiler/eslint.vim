if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:lint='npm\ run\ lint\ --\ --format\ stylish'

execute 'CompilerSet makeprg=' . s:lint

CompilerSet errorformat=
      \%-P%f,
      \%\\s%#%l:%c%\\s%\\+%trror%\\s%\\+%m,
      \%\\s%#%l:%c%\\s%\\+%tarning%\\s%\\+%m,
      \%-Q,
      \%-G%.%#
