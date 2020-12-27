RELOAD = require('plenary.reload').reload_module

R = function(name)
  RELOAD(name)
  return require(name)
end

require("modules.statusline")
require("modules.treesitter")
require("modules.snippets")

require("modules.telescope")
require("modules.telescope.mappings")

require("terminal").setup()
