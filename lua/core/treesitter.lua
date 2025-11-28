-- lua/core/treesitter.lua
require("nvim-treesitter.configs").setup({
  ensure_installed = { "rust", "c", "cpp", "lua", "python", "bash", "javascript" },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
  textobjects = { enable = true },
})

-- Mini.nvim basic setup
require("mini.comment").setup()
require("mini.ai").setup()
require("mini.indentscope").setup()
require("mini.surround").setup()

