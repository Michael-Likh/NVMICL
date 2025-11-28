-- lua/core/keymaps.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Mini.comment
local comment = require("mini.comment")
comment.setup({
    options = { ignore_blank_line = true, start_of_line = false }
})

-- Marks.nvim
require("marks").setup({
    default_mappings = true,
    excluded_filetypes = { "harpoon" },
})

-- Normal mode navigation & actions with Alt as leader
map("n", "<M-f>", ":Telescope find_files<CR>", opts)
map("n", "<M-g>", ":Telescope live_grep<CR>", opts)
map("n", "<M-h>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
map("n", "<M-a>", ":lua require('harpoon.mark').add_file()<CR>", opts)
map("n", "<M-j>", ":lua require('flash').jump()<CR>", opts)
map("n", "<M-m>", ":lua require('marks').toggle()<CR>", opts)

-- Toggle comment
map("n", "<M-/>", "<cmd>lua require('mini.comment').toggle()<CR>", opts)
map("x", "<M-/>", "<cmd>lua require('mini.comment').toggle()<CR>", opts)

-- Copy/paste with system clipboard
map("v", "<C-c>", '"+y', opts)
map("n", "<C-v>", '"+p', opts)
map("i", "<C-v>", '<C-r>+', opts)

-- ToggleTerm
require("toggleterm").setup({
    size = 10,
    open_mapping = [[<M-t>]],
    direction = "horizontal",
    start_in_insert = true,
})

-- Command-mode ; shortcut
map("n", ";", ":", opts)
map("v", ";", ":", opts)

