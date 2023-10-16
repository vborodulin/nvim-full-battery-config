-- Neovim Lua Config File by Slava Borodulin (https://github.com/vborodulin)

-- MAPPINGS

-- Set space as leader key
vim.g.mapleader = " "

-- Allow move up and down selected text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move up selected text"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move down selected text"})

-- Paste non-linewise text above or below current line, see https://stackoverflow.com/a/1346777/6064933
vim.keymap.set("n", "<leader>p", "m`o<ESC>p``", { desc = "paste below current line" })
vim.keymap.set("n", "<leader>P", "m`O<ESC>p``", { desc = "paste above current line" })

-- Quit all opened buffers
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })

-- Insert a blank line below or above current line (do not move the cursor),
-- see https://stackoverflow.com/a/16136133/6064933
vim.keymap.set("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line below",
})
vim.keymap.set("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line above",
})

-- Move the cursor based on physical lines, not the actual lines.
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "^", "g^")
vim.keymap.set("n", "0", "g0")

-- Do not include white space characters when using $ in visual mode,
-- see https://vi.stackexchange.com/q/12607/15292
vim.keymap.set("x", "$", "g_")

-- Join two lines and does not change coursor position
vim.keymap.set("n", "J", "mzJ`z", { desc = "join two lines" })

-- Set coursor in the center of the screen while moving up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move half screen down"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move half screen up"})

-- Always use very magic mode for searching
vim.keymap.set("n", "/", [[/\v]], { desc = "search"})

-- Use Esc to quit builtin terminal
vim.keymap.set("t", "<Esc>", [[<c-\><c-n>]], { desc = "quite builtin terminal"})

-- Reselect the text that has just been pasted
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "paste and reselect text"})

-- Yank to the clipboard and paste anywhere
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "yank to clipboard"})
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Do nothing for capital Q
vim.keymap.set("n", "Q", "<nop>")

-- Search word under coursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
  desc = "search word under coursor"
})

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {
  silent = true,
  desc = "make file executable"
})

-- Turn off arrow keys navigation
vim.keymap.set("n", "<Left>", '<noop>')
vim.keymap.set("i", "<Left>", '');
vim.keymap.set("n", "<Right>", '<noop>')
vim.keymap.set("i", "<Right>", '');
vim.keymap.set("n", "<Up>", '<noop>')
vim.keymap.set("i", "<Up>", '');
vim.keymap.set("n", "<Down>", '<noop>')
vim.keymap.set("i", "<Down>", '');

-- Go to start or end of line easier
vim.keymap.set({ "n", "x" }, "H", "^", { desc = "go to start of line easier"})
vim.keymap.set({ "n", "x" }, "L", "g_", { desc = "go to end of line easier"})

-- Insert semicolon in the end
vim.keymap.set("i", "<c-;>", "<Esc>miA;<Esc>`ii", { desc = "insert semicolon in the end"});

-- Delete the character to the right of the cursor
vim.keymap.set("i", "<C-D>", "<DEL>", { desc = "delete chat to the right"})

