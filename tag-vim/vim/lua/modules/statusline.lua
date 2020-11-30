vim.cmd [[packadd express_line.nvim]]

pcall(RELOAD, 'el')

local builtin = require("el.builtin")
local extensions = require("el.extensions")
local subscribe = require("el.subscribe")
local sections = require("el.sections")
local lsp_statusline = require("el.plugins.lsp_status")

vim.api.nvim_command("hi! link ElNormal Statusline")
vim.api.nvim_command("hi! link ElInsert GruvboxRedBold")
vim.api.nvim_command("hi! link ElVisual GruvboxPurpleBold")
vim.api.nvim_command("hi! link ElCommand GruvboxOrangeBold")

-- tabline colors
vim.api.nvim_command('hi! link TabLine GruvboxBg2')
vim.api.nvim_command('hi! link TabLineSel GruvboxYellow')

local generator = function()
  local el_segments = {}

  table.insert(el_segments, extensions.gen_mode{ format_string = ' %s ' })
  table.insert(el_segments,
    subscribe.buf_autocmd(
    "el_git_branch",
    "BufEnter",
    function(window, buffer)
      local branch = extensions.git_branch(window, buffer)
      if branch then
        return ' ' .. branch
      end
    end
    )
  )
  table.insert(el_segments, ' ')
  table.insert(el_segments, builtin.shortened_file)
  table.insert(el_segments, ' ')
  table.insert(el_segments, builtin.modified)
  table.insert(el_segments, sections.split)
  table.insert(el_segments, lsp_statusline.current_function)
  table.insert(el_segments, lsp_statusline.server_progress)

  table.insert(el_segments, subscribe.buf_autocmd(
     "el_git_changes",
     "BufWritePost",
     function(window, buffer)
       return extensions.git_changes(window, buffer)
     end
   ))
  table.insert(el_segments, '[' .. builtin.line_with_width(3) .. ':' .. builtin.column_with_width(2) .. ']')
  table.insert(el_segments, sections.collapse_builtin{
    '[',
    builtin.help_list,
    builtin.readonly_list,
    ']',
  })
  table.insert(el_segments, builtin.filetype)

  return el_segments
end

require('el').setup { generator = generator }
