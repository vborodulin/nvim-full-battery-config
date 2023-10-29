-- Neovim Lua Config File by Slava Borodulin (https://github.com/vborodulin)

-- PLUGINS

vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- Themes

  use("neanias/everforest-nvim")
  use("mhinz/vim-startify")

  -- Navigation
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-telescope/telescope-media-files.nvim" },
    },
  })
  use("christoomey/vim-tmux-navigator")
  use("theprimeagen/harpoon")

  -- Git and undotree
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")
  use("mbbill/undotree")

  -- Syntax hightlight and autocomplete
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      { "windwp/nvim-ts-autotag" },
    },
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use("mfussenegger/nvim-lint")
  use("norcalli/nvim-colorizer.lua")
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" }, -- source for text in buffer
      { "hrsh7th/cmp-path" }, -- source for file system paths
      { "onsails/lspkind.nvim" }, -- vs-code like pictograms
    },
  })
  use({
    "williamboman/mason.nvim",
    requires = {
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    },
  })
  use({
    "nvimtools/none-ls.nvim",
    requires = {
      { "jay-babu/mason-null-ls.nvim" },
    },
  })
  use({
    "neovim/nvim-lspconfig",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "antosha417/nvim-lsp-file-operations" },
    },
  })

  -- UI elements
  use({ "nvim-lualine/lualine.nvim" })
  use({ "nvim-tree/nvim-tree.lua" })
  use({ "stevearc/dressing.nvim" })

  -- Improve working with text
  use("tpope/vim-surround")
  use({
    "windwp/nvim-autopairs",
    requires = {
      { "hrsh7th/nvim-cmp" },
    },
  })
  use({
    "numToStr/Comment.nvim",
    requires = {
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
  })

  -- Working with DB
  use("tpope/vim-dadbod")
  use("kristijanhusak/vim-dadbod-ui")

  -- Trouble shooting
  use({
    "folke/trouble.nvim",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
    },
  })

  -- Documentation
  use("folke/which-key.nvim")
end)
