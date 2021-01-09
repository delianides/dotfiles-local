vim.g.fzf_layout = {
  window = {
    width = 0.9,
    height = 0.9
  }
}

vim.g.fzf_preview_use_dev_icons = 1
vim.g.fzf_buffers_jump = 1

vim.g.fzf_preview_window = { 'down', 'ctrl-/' }
vim.env.FZF_DEFAULT_OPTS = '--color=dark --height=30% --layout=reverse --margin=1,1 --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,pointer:12,marker:4,spinner:11,header:-1'
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

