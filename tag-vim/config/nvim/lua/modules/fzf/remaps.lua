local util = require 'nvim_lspconfig/util'

nmap('//', ':BLines!')
nmap('??', ':Rg!')
nmap('<C-f>', ':Files ' .. util.root_pattern('.git'))
nmap('<C-d>', ':Files')
nmap('cc', ':Commands!')
