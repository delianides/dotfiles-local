local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = {"typescript", "html", "tsx", "lua", "json", "rust", "css", "javascript", "golang", "python", "graphql", "yaml"},
  highlight = {
    enable = true,
  },
}
