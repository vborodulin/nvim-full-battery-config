vim.keymap.set("n", "<leader>sf", [[mF:w<CR>:!stylelint --fix %<CR>:e!<CR>`F]], { silent = true })
