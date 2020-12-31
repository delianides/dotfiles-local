local opt = vim.opt

opt.completeopt = { "menuone" , "noinsert", "noselect" }

-- Don't show the dumb matching stuff.
vim.cmd [[set shortmess+=c]]

-- completion.nvim
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_enable_snippet = 'snippets.nvim'
vim.g.completion_enable_auto_signature = 0

vim.g.completion_auto_change_source = 1
vim.g.completion_trigger_on_delete = 0

-- Decide on length
vim.g.completion_trigger_keyword_length = 2

vim.g.completion_chain_complete_list = {
  default = {
    {
      {complete_items = {'lsp', 'snippet', 'file', 'tmux', 'buffers'}},
      {complete_items = {'buffer'}}, {mode = 'file'}
    }
  }
}
