-- lua/ui/colors.lua
vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup({ transparent_background = false })

require("tokyonight").setup({ style = "night", transparent = false })

-- Set default theme
vim.cmd("colorscheme catppuccin")

-- Toggle command
vim.api.nvim_create_user_command("ToggleTheme", function()
  if vim.g.colors_name == "catppuccin" then
    vim.cmd("colorscheme tokyonight")
  else
    vim.cmd("colorscheme catppuccin")
  end
end, {})

