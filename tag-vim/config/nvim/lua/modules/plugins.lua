-- Only required if you have packer in your `opt` pack
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
    use {'wbthomason/packer.nvim', opt = true}

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    use 'mhinz/vim-startify' -- start screen

    use 'tpope/vim-fugitive' -- git
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'tpope/vim-unimpaired'

    use 'lambdalisue/gina.vim'
    use {
      'tpope/vim-fugitive',
      require = {
        'junegunn/gv.vim',
        'rhysd/git-messenger.vim'
      }
    }

    use 'vim-utils/vim-man' -- man pages
    use 'mbbill/undotree' -- undo tree
    use 'Yggdroot/indentLine'
    use 'mhinz/vim-signify'
    use 'voldikss/vim-floaterm'
    use 'christoomey/vim-tmux-navigator'

    use 'editorconfig/editorconfig-vim'
    use 'norcalli/snippets.nvim' -- snippets
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use 'tjdevries/lsp_extensions.nvim'
    use 'nvim-lua/completion-nvim'
    
    use 'rrethy/vim-illuminate' -- highlight matching words when cursor on it
    use {'rrethy/vim-hexokinase', run = 'make hexokinase' } -- preview hex colors
    use {'junegunn/fzf', run = './install --all' }     -- Fuzzy Searcher
    use {'junegunn/fzf.vim'}
    use 'ojroques/nvim-lspfuzzy'

    use 'justinmk/vim-dirvish' -- alternative file explorer
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'

    use 'mbbill/undotree' -- undo tree

    -- Language packs
    use { 'styled-components/vim-styled-components', branch = 'main', ft = { 'typescript', 'javascript' }}
    use { 'tpope/vim-rails', ft = 'ruby' }
    use { 'fatih/vim-go', run = ':GoInstallBinaries', ft = {'go', 'golang' }}
    use { 'sheerun/vim-polyglot', opt = true }
    use { 'junegunn/goyo.vim', ft = 'markdown' }
    use { 'junegunn/limelight.vim', ft = 'markdown' }
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() vim.cmd [[TSUpdate]] end
    }

    use {
      'gruvbox-community/gruvbox',
        config = function()
        vim.g.gruvbox_italics = true
        vim.g.gruvbox_contrast_dark = "hard"
        vim.cmd("colorscheme gruvbox")
      end,
    }

    -- status line
    use 'itchyny/lightline.vim'
    use 'shinchu/lightline-gruvbox.vim'
  end
}
