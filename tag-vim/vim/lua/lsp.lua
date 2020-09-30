local has_lsp, nvim_lsp = pcall(require, 'nvim_lsp')
local has_diagnostic, diagnostic = pcall(require, 'diagnostic')
local has_completion, completion = pcall(require, 'completion')

if not has_lsp then
  return
end

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local setup_custom_diagnostics = function()
  Diagnostic = require('vim.lsp.actions').Diagnostic
  Location = require('vim.lsp.actions').Location

  vim.lsp.callbacks["textDocument/publishDiagnostics"] = Diagnostic.handle_publish_diagnostics.with {
    should_underline = true,
    update_in_insert = false
  }

  mapper( 'n', '<leader>dn', '<cmd>lua vim.lsp.structures.Diagnostic.buf_move_next_diagnostic()<CR>')
  mapper( 'n', '<leader>dp', '<cmd>lua vim.lsp.structures.Diagnostic.buf_move_prev_diagnostic()<CR>')
end

-- for debugging
-- :lua print(vim.inspect(vim.lsp.buf_get_clients()))

-- highlights
vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

local custom_attach = function(client, bufnr)
  if has_diagnostic then
    diagnostic.on_attach()
  end

  if has_completion then
    completion.on_attach()
  end

  if false then
    pcall(setup_custom_diagnostics)
  end

  -- Mappings.
  mapper('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  mapper('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
  if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'vim' then
    mapper('n', 'H', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  end
  mapper('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  mapper('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
  mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  mapper('n', '<leader>ld', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
end

local servers = {
  {name = 'cssls'},
  {name = 'bashls'},
  {name = 'vimls'},
  {
    name = 'tsserver',
    config = {
      cmd = {
        "typescript-language-server",
        "--stdio",
        "--log-level",
        "4",
        "--tsserver-log-file",
        "tslog"
      },
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
