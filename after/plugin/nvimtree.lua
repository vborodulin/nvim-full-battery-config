-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  api.config.mappings.default_on_attach(bufnr)
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  sync_root_with_cwd = true,
  hijack_cursor = true,
  on_attach = my_on_attach,
})

vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd>NvimTreeFindFile<CR>")
