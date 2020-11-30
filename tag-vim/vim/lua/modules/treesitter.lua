-- module treesiter
local M = {}

function M.config()
  require("nvim-treesitter.configs").setup({
    highlight = {enable = true},
    ensure_installed = {
      "go",
      "python",
      "lua",
      "html",
      "yaml",
      "json",
      "javascript",
      "markdown",
      "css",
      "bash",
      "toml",
      "typescript",
      "tsx",
      "rust"
    },
    textobjects = {
      lsp_interop = {
        enable = true,
        peek_definition_code = {
          ["df"] = "@function.outer",
          ["dF"] = "@class.outer",
        },
      },
    },
  })
end

return M
