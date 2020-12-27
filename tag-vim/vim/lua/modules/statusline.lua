vim.cmd [[packadd express_line.nvim]]

RELOAD('el')
require('el').reset_windows()

local builtin = require("el.builtin")
local extensions = require("el.extensions")
local subscribe = require("el.subscribe")
local sections = require("el.sections")
-- local lsp_statusline = require("el.plugins.lsp_status")
local status = require('lsp-status')

vim.api.nvim_command("hi! link ElNormal Statusline")
vim.api.nvim_command("hi! link ElInsert GruvboxRedBold")
vim.api.nvim_command("hi! link ElVisual GruvboxPurpleBold")
vim.api.nvim_command("hi! link ElCommand GruvboxOrangeBold")

-- tabline colors
vim.api.nvim_command('hi! link TabLine GruvboxBg2')
vim.api.nvim_command('hi! link TabLineSel GruvboxYellow')

local git_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
  local icon = extensions.file_icon(_, bufnr)
  if icon then
    return icon .. ' '
  end

  return ''
end)

local git_branch = subscribe.buf_autocmd(
  "el_git_branch",
  "BufEnter",
  function(window, buffer)
    local branch = extensions.git_branch(window, buffer)
    if branch then
      return ' ' .. extensions.git_icon() .. ' ' .. branch
    end
  end
)

local git_changes = subscribe.buf_autocmd(
  "el_git_changes",
  "BufWritePost",
  function(window, buffer)
    return extensions.git_changes(window, buffer)
  end
)

require('el').setup {
  generator = function(_, _)
    return {
      extensions.gen_mode {
        format_string = ' %s '
      },
      git_branch,
      ' ',
      sections.split,
      git_icon,
      sections.maximum_width(
        builtin.responsive_file(140, 90),
        0.30
      ),
      sections.collapse_builtin {
        ' ',
        builtin.modified_flag
      },
      sections.split,
      '[', status.status(), ']',
      git_changes,
      '[', builtin.line_with_width(3), ':',  builtin.column_with_width(2), ']',
      sections.collapse_builtin {
        '[',
        builtin.help_list,
        builtin.readonly_list,
        ']',
      },
      builtin.filetype,
    }
  end
}
