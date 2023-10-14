local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return {
      desc = "nvim-tree:" ..desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  api.config.mappings.default_on_attach(bufnr)

  local function open_in_finder()
    local node = api.tree.get_node_under_cursor()
    api.tree.system_open()
  end

  vim.keymap.set("n", "op", open_in_finder, opts("Open in finder"))
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
    dotfiles = false
  },
  sync_root_with_cwd = true,
  hijack_cursor = true,
  on_attach = my_on_attach,
})

vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd>NvimTreeFindFile<CR>")
