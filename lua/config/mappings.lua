--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- Neovim Lua Config File by Slava Borodulin
-- MAPPINGS

local uv = vim.loop

-- Set space as leader key
vim.g.mapleader = " "

-- Allow move up and down selected text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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

-- move the cursor based on physical lines, not the actual lines.
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "^", "g^")
vim.keymap.set("n", "0", "g0")

-- Do not include white space characters when using $ in visual mode,
-- see https://vi.stackexchange.com/q/12607/15292
vim.keymap.set("x", "$", "g_")

-- Join two lines and does not change coursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Set coursor in the center of the screen while moving up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Always use very magic mode for searching
vim.keymap.set("n", "/", [[/\v]])

-- Use Esc to quit builtin terminal
vim.keymap.set("t", "<Esc>", [[<c-\><c-n>]])

-- Reselect the text that has just been pasted
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

-- Go to start or end of line easier
vim.keymap.set({ "n", "x" }, "H", "^")
vim.keymap.set({ "n", "x" }, "L", "g_")

-- Insert semicolon in the end
vim.keymap.set("i", "<c-;>", "<Esc>miA;<Esc>`ii");

-- Delete the character to the right of the cursor
vim.keymap.set("i", "<C-D>", "<DEL>")

vim.keymap.set("n", "<leader>cb", function()
  local cnt = 0
  local blink_times = 7
  local timer = uv.new_timer()

  timer:start(0, 100, vim.schedule_wrap(function()
    vim.cmd[[
      set cursorcolumn!
      set cursorline!
    ]]

    if cnt == blink_times then
      timer:close()
    end

    cnt = cnt + 1
  end))
end)
