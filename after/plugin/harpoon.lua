local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>h", mark.add_file, { desc = "mark file with harpoon" })
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "toggle harpoon menu" })
vim.keymap.set("n", "hn", ui.nav_next, { desc = "go to the next harpoon mark" })
vim.keymap.set("n", "hp", ui.nav_prev, { desc = "go to the prev harpoon mark" })

require("harpoon").setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 100,
  },
})
