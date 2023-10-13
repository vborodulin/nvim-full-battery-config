require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  term_colors = true,
  custom_highlights = function(colors)
    return {
      Comment = {
        fg = colors.overlay2,
        style = {
          "italic"
        }
      },
      LineNr = {
        fg = colors.overlay2
      }
    }
  end
})

vim.cmd("colorscheme catppuccin")

