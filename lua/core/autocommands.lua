-- lua/core/autocommands.lua
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Automatically reload files changed outside of Neovim
autocmd("BufEnter", { pattern = "*", command = "checktime" })

-- Highlight on yank
autocmd("TextYankPost", {
  pattern = "*",
  callback = function() vim.highlight.on_yank({ timeout = 200 }) end,
})

