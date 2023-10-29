local builtin = require("telescope.builtin")

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return {
      desc = "Nvim-tree:" .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  local function get_dir_under_cursor()
    local node = api.tree.get_node_under_cursor()
    local is_dir = vim.fn.isdirectory(node.absolute_path)

    if is_dir then
      return node.absolute_path
    else
      local last_slash_index = string.find(node.absolute_path, "/[^/]*$")
      return string.sub(node.absolute_path, 0, last_slash_index)
    end
  end

  local function find_files_in_dir()
    builtin.find_files({
      cwd = get_dir_under_cursor(),
    })
  end

  local function grep_string_in_dir()
    local dir_path = get_dir_under_cursor()
    local title = dir_path .. " Grep > "

    builtin.grep_string({
      search = vim.fn.input(title),
      cwd = get_dir_under_cursor(),
    })
  end

  vim.keymap.set("n", "pf", find_files_in_dir, opts("Find files in dir"))
  vim.keymap.set("n", "ps", grep_string_in_dir, opts("Grep files in dir"))
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = { ".DS_Store" },
  },
  sync_root_with_cwd = true,
  hijack_cursor = true,
  on_attach = my_on_attach,
})

vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd>NvimTreeFindFile<CR>")
