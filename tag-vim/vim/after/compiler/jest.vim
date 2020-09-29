if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:jest='npm\ test'

execute 'CompilerSet makeprg=' . s:jest

CompilerSet errorformat=
      \%-G%[%^\ ]%.%#,
      \%A%\\s%\\+●\ %m,
      \%Z%\\s%\\+at\ %.%#\ (%f:%l:%c),
      \%C%.%#,
      \%-G%.%#,

