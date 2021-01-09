local lsp = require('lspconfig')
local lsp_completion = require('completion')
local lsp_status  = require('lsp-status')
local diagnostics  = require('lt.lsp.diagnostics')

local function on_attach(client)
    lsp_status.on_attach(client)
    lsp_completion.on_attach(client)
end

lsp_status.register_progress()

local default_lsp_config = {on_attach = on_attach, capabilities = lsp_status.capabilities}

-- :LspInstall needed
local servers = {
  diagnosticls = diagnostics.options,
  bashls = {},
  vimls = {},
  dockerls = {},
  yamlls = {
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
  },

  rust_analyzer = {},

  jsonls = {
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
  },

  tsserver = {},
  html = {},
  cssls = {},

  pyls = {
    handlers = lsp_status.extensions.pyls_ms.setup(),
    enable = true,
    plugins = {
      pyls_mypy = {
        enabled = true,
        live_mode = false
      }
    },
  },

  sumneko_lua = {
    -- :LspInstallInfo sumneko_lua
    cmd = { '/home/lucatrazzi/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server' },
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim',
                    'use',
                    'imap',
                    'nmap',
                    'vmap',
                    'tmap',
                    'inoremap',
                    'nnoremap',
                    'vnoremap',
                    'tnoremap'
                }
            },
            workspace = {
                library = {
                    ['$VIMRUNTIME/lua'] = true,
                }
            }
        }
    }
  },
}

for server, config in pairs(servers) do
  lsp[server].setup(vim.tbl_deep_extend("force", default_lsp_config, config))
end
