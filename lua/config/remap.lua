-- Set space as leader key
vim.g.mapleader = " "

-- Allow move up and down selected text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join two lines and does not change coursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Set coursor in the center of the screen while moving up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to the clipboard and paste anywhere
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Do nothing for capital Q
vim.keymap.set("n", "Q", "<nop>")

-- Search word under coursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Turn off arrow keys navigation
vim.keymap.set("n", "<Left>", '<noop>')
vim.keymap.set("i", "<Left>", '');
vim.keymap.set("n", "<Right>", '<noop>')
vim.keymap.set("i", "<Right>", '');
vim.keymap.set("n", "<Up>", '<noop>')
vim.keymap.set("i", "<Up>", '');
vim.keymap.set("n", "<Down>", '<noop>')
vim.keymap.set("i", "<Down>", '');
