vim.g.mapleader = ' '

vim.o.cursorline = false
vim.o.cursorcolumn = false

vim.o.showmatch = true
vim.o.hidden = true
vim.o.errorbells = false

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.wrap = false
vim.o.breakindent = true

vim.o.colorcolumn = 80

vim.o.relativenumber = true
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = '~/.config/nvim/undodir'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.showmode = false

vim.o.inccommand = 'split'

vim.o.cmdheight = 1

vim.o.updatetime = 50
vim.o.completeopt = 'menuone,noinsert,noselect'

vim.cmd [[ set shortmess+=c ]]

vim.o.signcolumn = 'yes'

vim.cmd [[
  set formatoptions-=a    " Auto formatting is BAD.
  set formatoptions-=t    " Don't auto format my code. I got linters for that.
  set formatoptions+=c    " In general, I like it when comments respect textwidth
  set formatoptions+=q    " Allow formatting comments w/ gq
  set formatoptions-=o    " O and o, don't continue comments
  set formatoptions+=r    " But do continue when pressing enter.
  set formatoptions+=n    " Indent past the formatlistpat, not underneath it.
  set formatoptions+=j    " Auto-remove comments if possible.
  set formatoptions-=2    " I'm not in gradeschool anymore
]]

vim.o.nojoinspaces = true

vim.o.foldmethod = 'marker'
vim.o.foldlevel = 0
vim.o.modelines = 1

