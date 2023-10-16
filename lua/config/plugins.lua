-- Neovim Lua Config File by Slava Borodulin (https://github.com/vborodulin)

-- PLUGINS

vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Themes
  use "lukas-reineke/indent-blankline.nvim"
  use("neanias/everforest-nvim")
  use("mhinz/vim-startify")

  -- Navigation
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-telescope/telescope-media-files.nvim'}
    }
  }
  use("christoomey/vim-tmux-navigator")
  use("theprimeagen/harpoon")

  -- Git and undotree
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")
  use("mbbill/undotree")

  -- Syntax hightlight and autocomplete
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/cmp-nvim-lsp'},
      {"onsails/lspkind-nvim"},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-omni'},
      {'hrsh7th/cmp-emoji'},
      {'saadparwaiz1/cmp_luasnip'},
    }
  }
  use("norcalli/nvim-colorizer.lua")

  -- UI elements
  use {'nvim-lualine/lualine.nvim'}
  use {'nvim-tree/nvim-tree.lua'}

  -- Improve working with text
  use("tpope/vim-commentary")
  use("tpope/vim-surround")
  use("Raimondi/delimitMate")

  -- Working with DB
  use("tpope/vim-dadbod")
  use("kristijanhusak/vim-dadbod-ui")

  -- Trouble shooting
  use{
    "folke/trouble.nvim",
    requires = {
      {"nvim-tree/nvim-web-devicons"},
    }
  }

  -- Documentation
  use("folke/which-key.nvim")
end)
