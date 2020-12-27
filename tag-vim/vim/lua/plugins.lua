local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  -- TODO: Maybe handle windows better?
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloading packer.nvim...")
  return
end

return require('packer').startup {
  function(use)
    local local_use = function(plugin)
      if vim.fn.isdirectory(vim.fn.expand("~/Code/plugins/" .. plugin[1])) == 1 then
        use {"~/Code/plugins/" .. plugin[1], config = plugin[2]}
      else
        use {'delianides/' .. plugin[1], config = plugin[2]}
      end
    end

    use 'tjdevries/express_line.nvim'
    use {'wbthomason/packer.nvim', opt = true}

    use 'rhysd/git-messenger.vim'

    use {"junegunn/fzf", run = ":call fzf#install()"}
    use 'junegunn/fzf.vim'
    use 'stsewd/fzf-checkout.vim'

    use 'editorconfig/editorconfig-vim'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'tpope/vim-unimpaired'
    use {'dstein64/vim-startuptime', cmd = { 'StartupTime' }}

    use 'vim-test/vim-test'
    use 'RRethy/vim-illuminate'
    use 'christoomey/vim-tmux-navigator'
    use 'junegunn/vim-easy-align'
    use 'jiangmiao/auto-pairs'
    use 'dense-analysis/ale'

    -- -- git
    use 'tpope/vim-fugitive'
    use 'mhinz/vim-signify'
    use 'lambdalisue/gina.vim'
    use 'kdheepak/lazygit.nvim'

    -- -- Pretty icons. Not necessarily required.
    use 'ryanoasis/vim-devicons'

    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'justinmk/vim-dirvish'

    use 'voldikss/vim-floaterm'

    -- Pretty colors
    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require("modules.colorizer")
      end
    }

    use 'norcalli/nvim-terminal.lua'

    -- Make cool signs for your files
    use 'johannesthyssen/vim-signit'

    -- Make comments appear IN YO FACE
    use 'tjdevries/vim-inyoface'

    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
      'neovim/nvim-lspconfig',
      config = function()
        require("modules.lsp")
      end,
    }

    use 'nvim-lua/diagnostic-nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'nvim-lua/completion-nvim'
    use 'steelsojka/completion-buffers'
    use 'tjdevries/lsp_extensions.nvim'
    use 'albertoCaroM/completion-tmux'

    use 'norcalli/snippets.nvim'
    use 'norcalli/ui.nvim'

    use 'brooth/far.vim'

    use 'romainl/vim-qf'

    use {
      'glacambre/firenvim',
      run = function()
        vim.fn['firenvim#install'](0)
      end
    }

    -- use 'tjdevries/nlua.nvim' cant use until figure out how to remap K
    use {
      'nvim-treesitter/nvim-treesitter',
      commit = '42ca4a4c075cae2ec480508d04f9b6d35b7bf382',
      -- config = function()
      --   require("modules.treesitter").config()
      -- end,
      run = ':TSUpdate',
      requires = {
        'nvim-treesitter/playground',
      }
    }

    use {
      'nvim-treesitter/completion-treesitter',
      run = function() vim.cmd [[TSUpdate]] end
    }

    -- use 'itchyny/lightline.vim'

    -- languages
    use { 'styled-components/vim-styled-components', branch = 'main', ft = { 'typescript', 'javascript' }}
    use { 'tpope/vim-rails', ft = 'ruby' }
    use { 'fatih/vim-go', run = ':GoInstallBinaries', ft = {'go', 'golang' }}
    use { 'sheerun/vim-polyglot', opt = true }
    use { 'junegunn/goyo.vim', ft = 'markdown' }
    use { 'junegunn/limelight.vim', ft = 'markdown' }

    -- colors
    use {
      'tjdevries/colorbuddy.vim',
    }

    use {
      'mkitt/tabline.vim',
    }

    use {
      'nvim-telescope/telescope.nvim',
    }

    use{'nvim-telescope/telescope-fzy-native.nvim'}
    use{'nvim-telescope/telescope-fzf-writer.nvim'}
    use{'nvim-telescope/telescope-packer.nvim'}

    use{'nvim-telescope/telescope-github.nvim'}
    use{'nvim-telescope/telescope-symbols.nvim'}

    use {
      "gruvbox-community/gruvbox",
      config = function()
        vim.g.gruvbox_italics = true
        vim.g.gruvbox_contrast_dark = "hard"
        vim.cmd("colorscheme gruvbox")
      end,
    }

    use 'ThePrimeagen/vim-apm'
    use 'ThePrimeagen/vim-be-good'
  end,
  config = {
    display = {
      _open_fn = function(name)
        -- Can only use plenary when we have our plugins.
        --  We can only get plenary when we don't have our plugins ;)
        local ok, float_win = pcall(function()
          return require('plenary.window.float').percentage_range_window(0.8, 0.8)
        end)

        if not ok then
          vim.cmd [[65vnew  [packer] ]]

          return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
        end

        local bufnr = float_win.buf
        local win = float_win.win

        vim.api.nvim_buf_set_name(bufnr, name)
        vim.api.nvim_win_set_option(win, 'winblend', 10)

        return win, bufnr
      end
    },
  }
}
