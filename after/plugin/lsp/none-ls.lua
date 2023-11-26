local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")
local null_ls_utils = require("null-ls.utils")

mason_null_ls.setup({
  ensure_installed = {
    "prettier", -- prettier formatter
    "stylua", -- lua formatter
    "eslint_d", -- js linter/formatter
    "stylelint", -- css linter/formatter
  },
})

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
  -- add package.json as identifier for root (for typescript monorepos)
  root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
  -- setup formatters & linters
  sources = {
    formatting.prettier.with({
      filetypes = { "html", "json", "yaml", "markdown", "json", "typescript", "scss", "css" },
    }),
    formatting.stylua,
    diagnostics.eslint_d,
    formatting.eslint_d,
    diagnostics.stylelint,
    formatting.stylelint,
  },
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})
