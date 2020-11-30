local nvim_lsp = require('lspconfig')
local nvim_status = require('lsp-status')
local completion = require('completion')
local diagnostic = require('diagnostic')

local status = require('modules.lsp-status')

require('vim.lsp.log').set_level("trace")

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local setup_custom_diagnostics = function()
  -- vim.lsp.with -> a function that returns a new function, bound with new configuration.

  mapper(
    'n',
    '<leader>dn',
    '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'
  )

  mapper(
    'n',
    '<leader>dp',
    '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'
  )
end

-- for debugging
-- :lua print(vim.inspect(vim.lsp.buf_get_clients()))

-- highlights
vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Turn on status.
-- status.activate()

local custom_attach = function(client, bufnr)
  completion.on_attach(client)

  pcall(setup_custom_diagnostics)

  mapper(
    'n',
    '<leader>gd',
    '<cmd>lua vim.lsp.buf.definition()<CR>'
  )

  -- mapper(
  --   'n',
  --   '<leader>pd',
  --   '<cmd>lua vim.lsp.buf.definition { callbacks = Location.preview.with { lines_below = 5 } }<CR>'
  -- )

  -- Mappings.
  mapper('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
  mapper('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'vim' then
    mapper('n', 'H', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  end
  mapper('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
  mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  mapper('n', '<leader>ld', '<cmd>lua  vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  mapper('i', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

  vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
end

local servers = {
  {name = 'cssls'},
  {name = 'bashls'},
  {name = 'vimls'},
  {
    name = 'tsserver',
    config = {
      -- cmd = {
      --   "typescript-language-server",
      --   "--stdio",
      --   "--log-level",
      --   "4",
      --   "--tsserver-log-file",
      --   "tslog"
      -- },
      -- See https://github.com/neovim/nvim-lsp/issues/237
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
      },
      root_dir = nvim_lsp.util.root_pattern("tsconfig.json", ".git"),
    }
  },
  {
    name = 'rust_analyzer',
    config = {
      cmd = {"rust-analyzer"},
      filetypes = {"rust"},
    },
  },
  {
    name = 'jsonls',
    config = {
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
  },
  {
    name = 'yamlls',
    config = {
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
  },
}

for _, lsp in ipairs(servers) do
 if lsp.config then
   lsp.config.on_attach = custom_attach
 else
   lsp.config = {
     on_attach = custom_attach
   }
 end

 nvim_lsp[lsp.name].setup(lsp.config)
end

-- require('nlua.lsp.nvim').setup(require('nvim_lsp'), {
--   on_attach = custom_attach,

--   -- Include globals you want to tell the LSP are real :)
--   globals = {
--     -- Colorbuddy
--     "Color", "c", "Group", "g", "s", "vlc",
--   }
-- })
