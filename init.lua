-- init.lua
-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("plugins")

-- Core settings
require("core.settings")
require("core.keymaps")
require("core.autocommands")

-- UI
require("ui.colors")
require("ui.statusline")
require("ui.empty")


-- LSP
require("lsp.lspconfig")
require("lsp.rust")


