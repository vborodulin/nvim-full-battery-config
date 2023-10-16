-- Neovim Lua Config File by Slava Borodulin (https://github.com/vborodulin)

-- SETTINGS

-- UTF-8 encoding
vim.opt.encoding = "UTF-8"

-- Use English as main language
vim.cmd [[language en_US.UTF-8]]

vim.g.logging_level = "info"

-- enable highlighting for lua here doc inside vim script
vim.g.vimsyn_embed = 'l'

-- Disable netrw (native VIM file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Time in milliseconds to wait for a mapped sequence to complete,
-- see https://unix.stackexchange.com/q/36882/221410 for more info
vim.opt.updatetime = 500;

-- For CursorHold events
vim.opt.timeoutlen = 500;

-- Enabling clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.guicursor = ""

-- Line numbers
vim.opt.number = true

-- Relative line numbers
vim.opt.relativenumber = true

-- General tab settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Ignoring capital letters during search
vim.opt.ignorecase = true

-- Overriding ignorecase option if searching for capital letters
vim.opt.smartcase = true

--  Showing matching words during search
vim.opt.showmatch = true

-- Showing partial command on last line
vim.opt.showcmd = false

-- Showing mode on last line
vim.opt.showmode = false

-- Mouse support
vim.opt.mouse = "a"

-- Hide End-Of-Buffer symbol (~)
vim.opt.fillchars:append({ eob = " " })

-- Opening new split panes to right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.smartindent = true

-- Wrap lines
vim.opt.wrap = true

-- Preserve indentation of virtual line
vim.opt.breakindent = true

vim.opt.swapfile = false

-- Disable backup files
vim.opt.backup = false
vim.opt.writebackup = false

-- Persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search highlighting
vim.opt.hlsearch = false

-- Incrementally highlight matching characters while typing
vim.opt.incsearch = true

-- Always show the signcolumn
vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")

-- Horizontal cursor line
vim.opt.cursorline = true;

-- Vertical line to show max line length
vim.opt.colorcolumn = "100"

--  Do not let cursor scroll below or above N number of lines when scrolling
vim.opt.scrolloff = 10;

-- Command history
vim.opt.history = 1000

vim.opt.autowrite = true

-- Settings for line highlighting
vim.opt.list = true
