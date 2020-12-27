local lspconfig = require('lspconfig')
local nvim_status = require('lsp-status')
local completion = require('completion')
local diagnostic = require('diagnostic')

local telescope_mapper = require('modules.telescope.mappings')
local status = require('modules.lsp_status')

-- require('vim.lsp.log').set_level("trace")

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end

-- highlights
vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

status.activate()

local custom_attach = function(client)
  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end

  completion.on_attach(client)
  status.on_attach(client)

  mapper('n','<leader>dn','vim.lsp.diagnostic.goto_next()')
  mapper('n','<leader>dp','vim.lsp.diagnostic.goto_prev()')
  mapper('n', '<leader>gd', 'vim.lsp.buf.definition()')
  mapper('n', '<leader>gi', 'vim.lsp.buf.implementation()')
  mapper('n', '<leader>r', 'vim.lsp.buf.rename()')
  mapper('n', '<leader>sl', 'vim.lsp.diagnostic.show_line_diagnostics()')
  mapper('i', '<c-s>', 'vim.lsp.buf.signature_help()')

  telescope_mapper('gr', 'lsp_references', nil, true)
  telescope_mapper('<space>fw', 'lsp_workspace_symbols', { ignore_filename = true }, true)
  telescope_mapper('<space>ca', 'lsp_code_actions', nil, true)

  if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'vim' then
    mapper('n', 'H', 'vim.lsp.buf.hover()')
  end

  if vim.tbl_contains({"go", "rust"}, filetype) then
    vim.cmd [[autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()]]
  end

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
end

lspconfig.yamlls.setup {
  on_attach = custom_attach,
  capabilities = status.capabilities
}

lspconfig.pyls.setup {
  enable = true,
  plugins = {
    pyls_mypy = {
      enabled = true,
      live_mode = false
    }
  },
  on_attach = custom_attach,
  handlers = nvim_status.extensions.pyls_ms.setup(),
  capabilities = status.capabilities
}

lspconfig.cssls.setup {
  on_attach = custom_attach,
  capabilities = status.capabilities
}

lspconfig.bashls.setup {
  on_attach = custom_attach,
  capabilities = status.capabilities
}

lspconfig.vimls.setup {
  on_attach = custom_attach,
  capabilities = status.capabilities
}

lspconfig.gopls.setup {
  on_attach = custom_attach,
  capabilities = status.capabilities
}

lspconfig.jsonls.setup {
  on_attach = custom_attach,
  capabilities = status.capabilities,
  settings = {
    json = {
      schemas = {
        {
          description = 'TypeScript compiler configuration file',
          fileMatch = {'tsconfig.json', 'tsconfig.*.json'},
          url = 'http://json.schemastore.org/tsconfig'
        },
        {
          description = 'Lerna config',
          fileMatch = {'lerna.json'},
          url = 'http://json.schemastore.org/lerna'
        },
        {
          description = 'Babel configuration',
          fileMatch = {'.babelrc.json', '.babelrc', 'babel.config.json'},
          url = 'http://json.schemastore.org/lerna'
        },
        {
          description = 'ESLint config',
          fileMatch = {'.eslintrc.json', '.eslintrc'},
          url = 'http://json.schemastore.org/eslintrc'
        },
        {
          description = 'Bucklescript config',
          fileMatch = {'bsconfig.json'},
          url = 'https://bucklescript.github.io/bucklescript/docson/build-schema.json'
        },
        {
          description = 'Prettier config',
          fileMatch = {'.prettierrc', '.prettierrc.json', 'prettier.config.json'},
          url = 'http://json.schemastore.org/prettierrc'
        },
        {
          description = 'Vercel Now config',
          fileMatch = {'now.json', 'vercel.json'},
          url = 'http://json.schemastore.org/now'
        },
        {
          description = 'Stylelint config',
          fileMatch = {'.stylelintrc', '.stylelintrc.json', 'stylelint.config.json'},
          url = 'http://json.schemastore.org/stylelintrc'
        },
      }
    },
  },
}

lspconfig.yamlls.setup {
  on_attach = custom_attach,
  capabilities = status.capabilities,
  settings = {
    yaml = {
      schemas = {
        ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
        ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
        ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
        ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
        ['http://json.schemastore.org/stylelintrc'] = '.stylelintrc.{yml,yaml}',
        ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}'
      }
    }
  },
}

lspconfig.tsserver.setup({
  cmd = {"typescript-language-server", "--stdio"},
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  on_attach = custom_attach,
  capabilities = status.capabilities
})

lspconfig.rust_analyzer.setup({
  cmd = {"rust-analyzer"},
  filetypes = {"rust"},
  on_attach = custom_attach,
  capabilities = status.capabilities,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = false
      }
    ),
  }
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, method, params, client_id, bufnr, config)
  local uri = params.uri

  vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = true,
      signs = sign_decider,
      update_in_insert = false,
    }
  )(err, method, params, client_id, bufnr, config)

  bufnr = bufnr or vim.uri_to_bufnr(uri)

  if bufnr == vim.api.nvim_get_current_buf() then
    vim.lsp.diagnostic.set_loclist { open_loclist = false }
  end
end
--]]

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = sign_decider,
    update_in_insert = false,
  }
)
